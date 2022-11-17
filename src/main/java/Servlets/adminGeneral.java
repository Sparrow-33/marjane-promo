package Servlets;

import java.io.*;
import java.util.concurrent.TimeoutException;

import DAO.adminGeneralDAO;
import DAO.centreDAO;
import entities.Admingeneral;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import static java.lang.System.out;

@WebServlet(name = "adminGeneral", value = "/adminGeneral")
public class adminGeneral extends HttpServlet {
    private String message;
    boolean status = false;

    adminGeneralDAO adminG = new adminGeneralDAO();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        String path = request.getServletPath();
        if (!path.equals("/login.adminGeneral")) {
            if (session.getAttribute("ROLE") == null || !session.getAttribute("ROLE").equals("ADMINGENERAL")){
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
        }
          if (path.equals("/index.adminGeneral")) {
            centreDAO centre = new centreDAO();

            request.setAttribute("centres", centre.getAllCenter());
            request.getRequestDispatcher("adminGeneral/index.jsp").forward(request,response);
          }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String path = req.getServletPath();

        if (!path.equals("/login.adminGeneral")) {
            if (session.getAttribute("ROLE") == null ||  !session.getAttribute("ROLE").equals("ADMINGENERAL")){
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            }
        }
        switch (path) {
            case "/login.adminGeneral":
                String email = req.getParameter("email");
                String password = req.getParameter("password");
                Admingeneral admingeneral = adminG.signIn(email,password);
                if(admingeneral != null) {
                    session.setAttribute("ROLE","ADMINGENERAL");
                    session.setMaxInactiveInterval(30*60);
                    resp.sendRedirect("index.adminGeneral");
                }else {
                    req.getRequestDispatcher("index.jsp").forward(req,resp);
                }
                break;
            case "/addAdmin.adminGeneral":

                String nom = req.getParameter("nom");
                email = req.getParameter("email");
                int centre = Integer.valueOf(req.getParameter("centre"));
                password = req.getParameter("password");

                if (adminG.createAdmin(email,password,centre)) {
                    req.setAttribute("status", true);
                    req.getRequestDispatcher("adminGeneral/index.jsp").forward(req,resp);
                }else {
                    req.setAttribute("status", false);
                    req.getRequestDispatcher("adminGeneral/index.jsp").forward(req,resp);
                }
                break;
            case "/logout.adminGeneral" :
                session = req.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                req.getRequestDispatcher("index.jsp").forward(req,resp);
                break;

            default:
                req.getRequestDispatcher("adminGeneral/index.jsp").forward(req,resp);
                break;
        }


    }
}
package Servlets;

import java.io.*;
import java.util.concurrent.TimeoutException;

import DAO.adminGeneralDAO;
import DAO.centreDAO;
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
          String path = request.getServletPath();
          if (path.equals("/index.adminGeneral")) {
            centreDAO centre = new centreDAO();

            request.setAttribute("centres", centre.getAllCenter());
            request.getRequestDispatcher("adminGeneral/index.jsp").forward(request,response);
          }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        switch (path) {
            case "/login.adminGeneral":
                String email = req.getParameter("email");
                String password = req.getParameter("password");
                if(adminG.signIn(email,password)) {
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
                    status = true;
                    req.setAttribute("status",status);
                    req.getRequestDispatcher("adminGeneral/index.jsp").forward(req,resp);
//                    status = false;

                }else {
                }

            default:
                req.getRequestDispatcher("adminGeneral/index.jsp").forward(req,resp);
                break;
        }


    }
}
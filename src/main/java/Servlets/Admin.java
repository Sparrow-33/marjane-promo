package Servlets;

import DAO.adminDAO;
import DAO.categoryDAO;
import DAO.produitDAO;
import DAO.promotionDAO;
import entities.Produit;
import entities.Promotion;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import static java.lang.System.out;

@WebServlet(name = "Admin", value = "/Admin")
public class Admin extends HttpServlet {
    private String message;
    boolean status = false;
    DAO.adminDAO adminDAO = new adminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String path = request.getServletPath();

        if (session.getAttribute("ROLE") == null ||  !session.getAttribute("ROLE").equals("ADMIN")){
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
        switch (path){
            case "/index.admin" :
            categoryDAO catDAO = new categoryDAO();
            request.setAttribute("categories", catDAO.getAllCategories());
            request.getRequestDispatcher("admin/index.jsp").forward(request,response);
            break;

            case "/display.products.admin" :
            produitDAO  produit = new produitDAO();
            List<Produit> produits = produit.getAll();
            request.setAttribute("produits",produits);
            request.getRequestDispatcher("admin/produits.jsp").forward(request,response);
            break;

            case "/appliquerPromo.admin" :
            request.getRequestDispatcher("admin/appliquerPromo.jsp").forward(request, response);
            break;

            case "/display.promo.admin" :
            List<Promotion> promotions = new promotionDAO().getAllPromo();
            request.setAttribute("promotions",promotions);
            request.getRequestDispatcher("admin/displayPromo.jsp").forward(request, response);
            break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String path = request.getServletPath();
        if (!path.equals("/login.admin")) {
            if (session.getAttribute("ROLE") == null ||  !session.getAttribute("ROLE").equals("ADMIN")){
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
        }

        switch (path) {
            case "/login.admin" :
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                entities.Admin admin = adminDAO.signIn(email,password);
                if(adminDAO.signIn(email,password) != null) {
                    session.setAttribute("ROLE","ADMIN");
                    session.setAttribute("AdminCentreId", admin.getCentreId());
                    session.setMaxInactiveInterval(30*60);
                    response.sendRedirect("index.admin");
                    out.println("admin logged In ");
                }else {
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                }
                break;

            case "/addResponsable.admin" :
                String name = request.getParameter("nom");
                email = request.getParameter("email");
                int category = Integer.valueOf(request.getParameter("category"));
                int centre = (int) session.getAttribute("AdminCentreId");
                password = request.getParameter("password");

                if (adminDAO.addManager(category, centre, email, password, name)) {
                    status = true;
                    request.setAttribute("status",true);
                    message = "Responsable cree avec succes";
                    request.setAttribute("message", message );
                    request.getRequestDispatcher("admin/index.jsp").forward(request,response);
                } else {
                    out.println(" manager not created");
                }
                break;

            case "/setPromo.admin" :
                 int id = Integer.parseInt(request.getParameter("produit"));
                 float taux = Float.parseFloat(request.getParameter("pourcentage"));
                 long profit = Long.parseLong(request.getParameter("points"));
                LocalDate dateExpiration = LocalDate.parse(request.getParameter("date_expiration"));
                if (new promotionDAO().setPromotion(id,profit,taux,dateExpiration)) {
                    status = true;
                    request.setAttribute("status",true);
                    message = "Promo appliquee";
                    request.setAttribute("message", message );
                    request.getRequestDispatcher("admin/index.jsp").forward(request,response);
                } else {
                    request.getRequestDispatcher("admin/produits.jsp").forward(request,response);
                }

                break;

            case "/logout.admin" :
                session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                request.getRequestDispatcher("index.jsp").forward(request,response);
                break;
        }

    }
}

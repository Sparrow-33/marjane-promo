package Servlets;

import DAO.adminDAO;
import DAO.categoryDAO;
import DAO.produitDAO;
import entities.Produit;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

import static java.lang.System.out;

@WebServlet(name = "Admin", value = "/Admin")
public class Admin extends HttpServlet {
    private String message;
    boolean status = false;
    DAO.adminDAO adminDAO = new adminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
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
                out.println("Appliquer Promo view");
            request.getRequestDispatcher("admin/appliquerPromo.jsp").forward(request, response);
            break;


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/login.admin" :
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                if(adminDAO.signIn(email,password)) {
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
                int centre =  1;
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


        }

    }
}

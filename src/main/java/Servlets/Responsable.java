package Servlets;

import DAO.ResponsableDAO;
import DAO.produitDAO;
import DAO.promotionDAO;
import entities.Produit;
import entities.Promotion;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

import static java.lang.System.out;

@WebServlet(name = "Responsable", value = "/Responsable")
public class Responsable extends HttpServlet {
    ResponsableDAO responsableDAO = new ResponsableDAO();
    String message;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String path = request.getServletPath();

        if (session.getAttribute("ROLE") == null ||  !session.getAttribute("ROLE").equals("RESPONSABLE")){
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }

        switch (path) {
            case "/index.responsable" :
            request.getRequestDispatcher("responsable/index.jsp").forward(request,response);
            break;

            case "/display.products.responsable" :
                List<Produit> produits = new produitDAO().getProductsByCategory((Integer) session.getAttribute("catId"));
                request.setAttribute("produits",produits);
                request.getRequestDispatcher("responsable/produits.jsp").forward(request,response);
            break;

            case "/display.promo.responsable" :
                List<Promotion> promotions = new promotionDAO().getPromoByCat((Integer) session.getAttribute("catId"));
                request.setAttribute("promotions",promotions);
                request.getRequestDispatcher("responsable/displayPromo.jsp").forward(request,response);
            break;

            case "/accept.promo.responsable" :
                int id = Integer.parseInt(request.getParameter("promo"));
                out.println(id);
                if(new promotionDAO().updatePromoStatus(id,"APP")){
                    message = "promotion appilquee";
                    request.setAttribute("message", message);
                    request.setAttribute("status", true);
                    request.getRequestDispatcher("display.promo.responsable").forward(request, response);
                }
            break;

            case "/decline.promo.responsable" :
                 id = Integer.parseInt(request.getParameter("promo"));
                out.println(id);
                if(new promotionDAO().updatePromoStatus(id,"REJ")){
                    message = "promotion rejetee";
                    request.setAttribute("message", message);
                    request.setAttribute("status", true);
                    request.getRequestDispatcher("display.promo.responsable").forward(request, response);
                }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String path = request.getServletPath();

        if (!path.equals("/signIn.responsable")) {
            if (session.getAttribute("ROLE") == null ||  !session.getAttribute("ROLE").equals("RESPONSABLE")){
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
        }

        switch (path) {
            case "/signIn.responsable" :
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                entities.Responsable responsable = responsableDAO.signIn(email, password);
                if( responsable != null) {
                    session.setAttribute("ROLE","RESPONSABLE");
                    session.setAttribute("catId",responsable.getCategorieId());
                    response.sendRedirect("index.responsable");
                }  else {
                  request.getRequestDispatcher("index.jsp").forward(request,response);
                }
                break;

            case "/logout.responsable" :
                session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                  request.getRequestDispatcher("index.jsp").forward(request,response);
                break;
        }
        
    }
}

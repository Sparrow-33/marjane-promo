package DAO;

import entities.Promotion;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public class promotionDAO extends baseDAO<Promotion>{

    public Boolean setPromotion(int produitID, long profit, float taux, LocalDate expiration){


        promotionDAO promotionDAO = new promotionDAO();
        Promotion promotion = new Promotion();
        promotion.setProduitId(produitID);
        promotion.setProfit(profit);
        promotion.setTaux(taux);
        promotion.setStatus("ENC");
        promotion.setExpired_at(expiration);
        if(promotionDAO.save(promotion)){
            return true;
        }else{
            return false;
        }
    }

    public List<Promotion> getAllPromo(){
            Query query = entityManager.createQuery("from Promotion ", Promotion.class);
            return query.getResultList();
        }
    public List<Promotion> getPromoByCat(Integer id) {
        TypedQuery<Promotion> query = entityManager.createQuery("from Promotion p WHERE p.produitByProduitId.categorieId = :id",Promotion.class);
        query.setParameter("id",id);
        return query.getResultList();
    }

    public Promotion get(Integer id) {
        return entityManager.find(Promotion.class, id);
    }

    public Boolean updatePromoStatus(Integer id, String status){
        Promotion promotion = get(id);
        promotion.setStatus(status);
        if (new promotionDAO().update(promotion)){
            return true;
        }else{
            return false;
        }
    }
    public Boolean rejectPromo(Integer id,promotionDAO promotionDAO){
        Promotion promotion = get(id);
        promotion.setStatus("REJ");
        if (promotionDAO.update(promotion)){
            return true;
        }else{
            return false;
        }


    }
}

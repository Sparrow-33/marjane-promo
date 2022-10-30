package DAO;

import entities.Promotion;
import jakarta.persistence.Query;

import java.util.List;

public class promotionDAO extends baseDAO<Promotion>{

    public Boolean setPromotion(int produitID, long profit, float taux, String status, Promotion promotion){
        promotionDAO promotionDAO = new promotionDAO();
        promotion.setProduitId(produitID);
        promotion.setProfit(profit);
        promotion.setTaux(taux);
        promotion.setStatus(status);
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

    public Promotion get(Integer id) {
        return entityManager.find(Promotion.class, id);
    }

    public Boolean updatePromoStatus(Integer id, String status,promotionDAO promotionDAO){
        Promotion promotion = get(id);
        promotion.setStatus(status);
        if (promotionDAO.update(promotion)){
            return true;
        }else{
            return false;
        }
    }
}

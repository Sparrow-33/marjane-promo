package DAO;

import entities.Produit;
import entities.Promotion;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class promotionDAOTest {

    promotionDAO promotionDAO = new promotionDAO();
    @Test
    void setPromotion(){
        Promotion promotion = new Promotion();
        assertEquals(true,promotionDAO.setPromotion(5,2,0.2f,"PEND",promotion));
        System.out.println("TEst");
    }

    @Test
    void getAllPromo(){
     List<Promotion> list = promotionDAO.getAllPromo();
     assertEquals(10,list.get(0).getTaux());

    }

    @Test
    void get(){
        assertEquals(10,promotionDAO.get(1).getTaux());
    }

    @Test
    void updateStatus(){
         assertEquals(true,promotionDAO.updatePromoStatus(1,"REJECTED",promotionDAO));
    }



}
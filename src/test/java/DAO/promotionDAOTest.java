package DAO;

import entities.Produit;
import entities.Promotion;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class promotionDAOTest {

    promotionDAO promotionDAO = new promotionDAO();
    @Test
    void setPromotion(){
        Promotion promotion = new Promotion();
        LocalDate date = LocalDate.now();
        assertEquals(true,promotionDAO.setPromotion(5,2,20, date));
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
         assertEquals(true,promotionDAO.updatePromoStatus(1,"REJ"));
    }

     @Test
    void getPromoByCat(){
        List<Promotion> promotions = promotionDAO.getPromoByCat(1);
         int i =0;
         while (i < promotions.size()) {
             System.out.println(promotions.get(i).getStatus());
             i++;
         }
     }

}
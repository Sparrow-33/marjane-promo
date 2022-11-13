package DAO;

import entities.Produit;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
class produitDAOTest {
    produitDAO p = new produitDAO();
    @Test
    void getAllProducts(){
        List<Produit> list =p.getAll();
        int i =0;
        while (i < list.size()) {
            System.out.println(list.get(i).getCategorieByCategorieId().getType());
            i++;
        }
    }

}
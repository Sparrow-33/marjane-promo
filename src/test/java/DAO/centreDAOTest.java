package DAO;

import entities.Categorie;
import entities.Centre;
import org.junit.jupiter.api.Test;
import java.util.List;

class centreDAOTest {
    centreDAO centre = new centreDAO();
    categoryDAO cat = new categoryDAO();

    @Test
    public void getAll() {
        List<Centre> centres = centre.getAllCenter();
        int i =0;
        while (i < centres.size()) {
            System.out.println(centres.get(i).getNom());
            i++;
        }
    }

    @Test
    public void getAllCat(){
        List<Categorie> categories = cat.getAllCategories();
        int i = 0;
        while (i < categories.size()) {
            System.out.println(categories.get(i).getType());
            i++;
        }
    }
}
package DAO;

import entities.Categorie;
import jakarta.persistence.Query;
import java.util.List;

public class categoryDAO extends baseDAO<Categorie>{

    public List<Categorie> getAllCategories(){
        Query query = entityManager.createQuery("from Categorie ", Categorie.class);
        return query.getResultList();
    }
}

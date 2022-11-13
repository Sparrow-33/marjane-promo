package DAO;

import entities.Categorie;
import entities.Produit;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class produitDAO extends baseDAO<Produit>  {

    public Produit get(long id) {
        return entityManager.find(Produit.class, id);
    }

    public  List<Produit> getAll() {
        TypedQuery<Produit> query = entityManager.createQuery("from Produit",Produit.class);
        return query.getResultList();
    }

    public List<Produit> getProductsByCategory(Integer catId){
         Query query = entityManager.createQuery("from Produit where categorieId = ?",Produit.class);
         query.setParameter(1,catId);
         return query.getResultList();
    }



}

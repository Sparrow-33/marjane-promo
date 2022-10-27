package DAO;

import DAO.Interfaces.dao;
import Hibernate.Util.Hibernate.Util;
import entities.Produit;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

import java.util.List;

public class produitDAO extends baseDAO<Produit>  {

    public Produit get(long id) {
        return entityManager.find(Produit.class, id);
    }

    public static List<Produit> getAllProducts() {
        Query query = entityManager.createQuery("from Produit", Produit.class);
        return query.getResultList();
    }


}

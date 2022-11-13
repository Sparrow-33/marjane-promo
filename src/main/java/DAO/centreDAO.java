package DAO;

import entities.Centre;
import jakarta.persistence.Query;

import java.util.List;

public class centreDAO extends  baseDAO<Centre>{
    public List<Centre> getAllCenter(){
        Query query = entityManager.createQuery("from Centre ", Centre.class);
        return query.getResultList();
    }
}

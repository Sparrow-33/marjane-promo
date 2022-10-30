package DAO;

import Hibernate.Util.Hibernate.Util;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.util.function.Consumer;

public class baseDAO<T> {
    public static EntityManager entityManager = Util.getEntityManager();

    public Boolean save(T t){
        if(executeInsideTransaction(entityManager1 -> entityManager.persist(t))){
            return true;
        }   return false;
    }
    public Boolean update(T t){
        if(executeInsideTransaction(entityManager1 -> entityManager.merge(t))){
            return true;
        }   return false;
    }

    public static Boolean executeInsideTransaction(Consumer<EntityManager> action) {
        EntityTransaction tx = entityManager.getTransaction();
        try {
            tx.begin();
            action.accept(entityManager);
            tx.commit();
            return true;
        }
        catch (RuntimeException e) {
            tx.rollback();
//            throw e;
            return false;
        }
    }


}

package DAO;

import DAO.Interfaces.dao;
import Hibernate.Util.Hibernate.Util;
import entities.Admin;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;
import java.util.function.Consumer;

public class baseDAO<T> {
    public static EntityManager entityManager = Util.getEntityManager();

    public void save(T t){
        executeInsideTransaction(entityManager1 -> entityManager.persist(t));
    }
    public static void executeInsideTransaction(Consumer<EntityManager> action) {
        EntityTransaction tx = entityManager.getTransaction();
        try {
            tx.begin();
            action.accept(entityManager);
            tx.commit();
        }
        catch (RuntimeException e) {
            tx.rollback();
            throw e;
        }
    }

}

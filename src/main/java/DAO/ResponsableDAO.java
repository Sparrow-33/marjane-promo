package DAO;

import Services.PasswordManager;
import entities.Responsable;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import static java.lang.System.out;

public class ResponsableDAO extends baseDAO<Responsable>{
     public Responsable findManagerByEmail( String email) {
         TypedQuery<Responsable> query = entityManager.createQuery("SELECT r from Responsable r WHERE r.email = :email", Responsable.class);
         query.setParameter("email",email);
         return query.getSingleResult();
     }

    public Responsable signIn(String email,String password) {
        ResponsableDAO responsableDAO = new ResponsableDAO();
        try {
            Responsable responsable =  findManagerByEmail(email);
            if(PasswordManager.passwordVerify(password,responsable.getPassword())){
                return responsable;
            }else {
                out.println("password mismatch!");
                return null;
            }

        } catch (NoResultException e){
            return null;
        }
    }

}

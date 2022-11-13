package DAO;
import Services.PasswordManager;
import entities.Admin;
import entities.Admingeneral;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import static java.lang.System.out;

public class adminGeneralDAO extends baseDAO<Admingeneral>{

    public static Admingeneral findByEmail(String email){
        TypedQuery<Admingeneral> query = entityManager.createQuery("SELECT e FROM Admingeneral e WHERE e.email = :email",Admingeneral.class);
        query.setParameter("email",email);
        return query.getSingleResult();
    }

    public Boolean signIn(String email,String password){
        adminGeneralDAO adminGeneralDAO = new adminGeneralDAO();
        try {
            Admingeneral admingeneral =  adminGeneralDAO.findByEmail(email);
            if(PasswordManager.passwordVerify(password,admingeneral.getPassword())){
                return true;
            }else {
                out.println("password mismatch!");
                return false;
            }

        }catch (NoResultException e){
            return false;
        }
    }

    public  boolean createAdmin(String email, String password, int centreID){
        adminDAO adminDAO = new adminDAO();
        Admin admin = new Admin();
        admin.setEmail(email);
        admin.setPassword(PasswordManager.passwordEncrypt(password));
        admin.setCentreId(centreID);
        return ( adminDAO.save(admin)) ? true : false;
    }

}


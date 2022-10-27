package DAO;

import Services.PasswordManager;
import entities.Admin;
import entities.Admingeneral;
import jakarta.persistence.TypedQuery;
public class adminGeneralDAO extends baseDAO<Admingeneral>{
    public static void createAdmin(adminDAO adminDAO){
        Admin admin = new Admin();
        admin.getEmail();
        admin.getPassword();
        admin.getCentreId();
        adminDAO.save(admin);
    }


    public static Admingeneral findByEmail(String email){
        TypedQuery<Admingeneral> query = entityManager.createQuery("SELECT e FROM Admingeneral e WHERE e.email = :email",Admingeneral.class);
        query.setParameter("email",email);
        return query.getSingleResult();
    }

    public Boolean signIn(String email,String password){
        adminGeneralDAO adminGeneralDAO = new adminGeneralDAO();
        Admingeneral admingeneral =  adminGeneralDAO.findByEmail(email);

        if(PasswordManager.passwordVerify(password,admingeneral.getPassword())){
            System.out.println(admingeneral.toString());
            return true;
        }else {
            System.out.println("password mismatch!");
            return false;
        }
    }

    public  void createAdmin(String email, String password, int centreID){
        adminDAO adminDAO = new adminDAO();
        Admin admin = new Admin();
        admin.setEmail(email);
        admin.setPassword(PasswordManager.passwordEncrypt(password));
        admin.setCentreId(centreID);
        adminDAO.save(admin);
    }

}


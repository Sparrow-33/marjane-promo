package DAO;
import Services.Mail;
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

    public Admingeneral signIn(String email,String password){
        adminGeneralDAO adminGeneralDAO = new adminGeneralDAO();
        try {
            Admingeneral admingeneral =  adminGeneralDAO.findByEmail(email);
            if(PasswordManager.passwordVerify(password,admingeneral.getPassword())){
                return admingeneral;
            }else {
                out.println("password mismatch!");
                return null;
            }

        }catch (NoResultException e){
            return null;
        }
    }

    public  boolean createAdmin(String email, String password, int centreID){
        adminDAO adminDAO = new adminDAO();
        Admin admin = new Admin();
        admin.setEmail(email);
        admin.setPassword(PasswordManager.passwordEncrypt(password));
        admin.setCentreId(centreID);

        if (Mail.sendMail("Cher administrateur , voici vos donnees de connexion sur la platforme Marjane \n Email: " + email + "Bien cordialement", "Marjane espace employe", email)) {
            return (adminDAO.save(admin)) ? true : false;
        } else {
            return false;
        }
    }

}


package DAO;
import Services.Mail;
import Services.PasswordManager;
import entities.Admin;
import entities.Responsable;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import static java.lang.System.out;

public class adminDAO extends baseDAO<Admin> {

    public static Admin findByEmail(String email){
        TypedQuery<Admin> query = entityManager.createQuery("SELECT e FROM Admin e WHERE e.email = :email",Admin.class);
        query.setParameter("email",email);
        return query.getSingleResult();
    }

    public Boolean signIn(String email,String password){
        adminGeneralDAO adminGeneralDAO = new adminGeneralDAO();
        try {
            Admin admin =  adminDAO.findByEmail(email);
            if(PasswordManager.passwordVerify(password,admin.getPassword())){
                return true;
            }else {
                out.println("password mismatch!");
                return false;
            }

        }catch (NoResultException e){
            return false;
        }
    }

    public boolean addManager(Integer category,Integer centre ,String email, String password, String name) {
        password = PasswordManager.passwordEncrypt(password);
        ResponsableDAO responsableDAO = new ResponsableDAO();
        Responsable responsable = new Responsable();
        responsable.setCategorieId(category);
        responsable.setCentreId(centre);
        responsable.setEmail(email);
        responsable.setPassword(password);
        responsable.setNom(name);

        if (Mail.sendMail("Cher responsable rayon , voici vos donnees de connexion sur la platforme Marjane \n Email: " + email + "Bien cordialement", "Marjane espace employe", email)) {
            return (responsableDAO.save(responsable)) ? true : false;

        } else {
            return false;
        }
    }
}

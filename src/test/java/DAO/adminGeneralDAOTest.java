package DAO;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class adminGeneralDAOTest {
    @Test
    void adminGeneralSignInTest(){
        adminGeneralDAO adminG = new adminGeneralDAO();
        assertEquals(true,adminG.signIn("general@marjane.ma","123456"));
    }

}

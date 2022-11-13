package DAO;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class adminDAOTest {
    adminDAO admin = new adminDAO();

    @Test
    public void addManager(){
        assertTrue(admin.addManager(1,2,"manager1@marjane.ma","123456","manager1"));
    }

}
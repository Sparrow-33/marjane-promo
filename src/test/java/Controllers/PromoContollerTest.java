package Controllers;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class PromoContollerTest {

    @Test
    void getPromoByStatus(){
        String status = "PEND";
        assertNull(PromoContoller.getAllPromoByStatus(status));
    }

}
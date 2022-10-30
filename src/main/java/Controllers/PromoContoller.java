package Controllers;

import DAO.promotionDAO;
import entities.Promotion;

import java.time.LocalTime;
import java.util.List;
import java.util.stream.Collectors;

public class PromoContoller {
  static promotionDAO promDAO = new promotionDAO();

  public static List<Promotion> getAllPromoByStatus(String Status){
      if(LocalTime.now().isAfter(LocalTime.of(8,0,0)) && LocalTime.now().isBefore(LocalTime.of(14,0,0))){
         return promDAO.getAllPromo().stream()
                                     .filter(promo ->promo.getStatus().equals(Status) )
                                     .collect(Collectors.toList());
      }else{
          return null;
      }
  }
}

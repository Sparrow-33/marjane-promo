package entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
import java.util.Objects;

@Entity
@ToString
@Setter
@Getter
public class Promotion {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;
    @Basic
    @Column(name = "created_at")
    private Timestamp createdAt;
    @Basic
    @Column(name = "produit_id")
    private Integer produitId;
    @Basic
    @Column(name = "profit")
    private Long profit;
    @Basic
    @Column(name = "taux")
    private Long taux;
    @Basic
    @Column(name = "status")
    private String status;
    @ManyToOne
    @JoinColumn(name = "produit_id", referencedColumnName = "id",insertable = false,updatable = false)
    private Produit produitByProduitId;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Integer getProduitId() {
        return produitId;
    }

    public void setProduitId(Integer produitId) {
        this.produitId = produitId;
    }

    public Long getProfit() {
        return profit;
    }

    public void setProfit(Long profit) {
        this.profit = profit;
    }

    public Long getTaux() {
        return taux;
    }

    public void setTaux(Long taux) {
        this.taux = taux;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Promotion promotion = (Promotion) o;

        if (id != promotion.id) return false;
        if (createdAt != null ? !createdAt.equals(promotion.createdAt) : promotion.createdAt != null) return false;
        if (produitId != null ? !produitId.equals(promotion.produitId) : promotion.produitId != null) return false;
        if (profit != null ? !profit.equals(promotion.profit) : promotion.profit != null) return false;
        if (!Objects.equals(taux, promotion.taux)) return false;
        if(!Objects.equals(status,promotion.status)) return false;


        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        result = 31 * result + (produitId != null ? produitId.hashCode() : 0);
        result = 31 * result + (profit != null ? profit.hashCode() : 0);
        result = 31 * result + (taux != null ? taux.hashCode() : 0);
        result = 31 * result + (status != null ? taux.hashCode() : 0);
        return result;
    }

    public Produit getProduitByProduitId() {
        return produitByProduitId;
    }

    public void setProduitByProduitId(Produit produitByProduitId) {
        this.produitByProduitId = produitByProduitId;
    }
}

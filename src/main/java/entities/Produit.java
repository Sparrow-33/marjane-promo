package entities;

import jakarta.persistence.*;
import lombok.ToString;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;

@Entity
@ToString
public class Produit {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private Integer id;
    @Basic
    @Column(name = "categorie_id")
    private Long categorieId;
    @Basic
    @Column(name = "created_at")
    private Timestamp createdAt;
    @Basic
    @Column(name = "label")
    private String label;
    @Basic
    @Column(name = "prix")
    private Integer prix;
    @Basic
    @Column(name = "stock")
    private Integer stock;
    @ManyToOne
    @JoinColumn(name = "categorie_id", referencedColumnName = "id",insertable = false,updatable = false)
    private Categorie categorieByCategorieId;
    @OneToMany(mappedBy = "produitByProduitId")
    private Collection<Promotion> promotionsById;

    public long getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getCategorieId() {
        return categorieId;
    }

    public void setCategorieId(Long categorieId) {
        this.categorieId = categorieId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt() {
        this.createdAt = new Timestamp(new Date().getTime());
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Integer getPrix() {
        return prix;
    }

    public void setPrix(Integer prix) {
        this.prix = prix;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Produit produit = (Produit) o;

        if (id != produit.id) return false;
        if (categorieId != null ? !categorieId.equals(produit.categorieId) : produit.categorieId != null) return false;
        if (createdAt != null ? !createdAt.equals(produit.createdAt) : produit.createdAt != null) return false;
        if (label != null ? !label.equals(produit.label) : produit.label != null) return false;
        if (prix != null ? !prix.equals(produit.prix) : produit.prix != null) return false;
        if (stock != null ? !stock.equals(produit.stock) : produit.stock != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (categorieId != null ? categorieId.hashCode() : 0);
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        result = 31 * result + (label != null ? label.hashCode() : 0);
        result = 31 * result + (prix != null ? prix.hashCode() : 0);
        result = 31 * result + (stock != null ? stock.hashCode() : 0);
        return result;
    }

    public Categorie getCategorieByCategorieId() {
        return categorieByCategorieId;
    }

    public void setCategorieByCategorieId(Categorie categorieByCategorieId) {
        this.categorieByCategorieId = categorieByCategorieId;
    }

    public Collection<Promotion> getPromotionsById() {
        return promotionsById;
    }

    public void setPromotionsById(Collection<Promotion> promotionsById) {
        this.promotionsById = promotionsById;
    }
}

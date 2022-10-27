package entities;

import jakarta.persistence.*;

@Entity
public class Responsable {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;
    @Basic
    @Column(name = "categorie_id")
    private Integer categorieId;
    @Basic
    @Column(name = "email")
    private String email;
    @Basic
    @Column(name = "nom")
    private String nom;
    @ManyToOne
    @JoinColumn(name = "categorie_id", referencedColumnName = "id",insertable = false,updatable = false)
    private Categorie categorieByCategorieId;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Integer getCategorieId() {
        return categorieId;
    }

    public void setCategorieId(Integer categorieId) {
        this.categorieId = categorieId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Responsable that = (Responsable) o;

        if (id != that.id) return false;
        if (categorieId != null ? !categorieId.equals(that.categorieId) : that.categorieId != null) return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        if (nom != null ? !nom.equals(that.nom) : that.nom != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (categorieId != null ? categorieId.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        return result;
    }

    public Categorie getCategorieByCategorieId() {
        return categorieByCategorieId;
    }

    public void setCategorieByCategorieId(Categorie categorieByCategorieId) {
        this.categorieByCategorieId = categorieByCategorieId;
    }
}

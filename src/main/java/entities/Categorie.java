package entities;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
public class Categorie {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;
    @Basic
    @Column(name = "type")
    private String type;
    @OneToMany(mappedBy = "categorieByCategorieId")
    private Collection<Produit> produitsById;
    @OneToOne(mappedBy = "categorieByCategorieId")
    private Responsable responsablesById;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Categorie categorie = (Categorie) o;

        if (id != categorie.id) return false;
        if (type != null ? !type.equals(categorie.type) : categorie.type != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }

    public Collection<Produit> getProduitsById() {
        return produitsById;
    }

    public void setProduitsById(Collection<Produit> produitsById) {
        this.produitsById = produitsById;
    }

    public Responsable getResponsablesById() {
        return responsablesById;
    }

    public void setResponsablesById(Responsable responsablesById) {
        this.responsablesById = responsablesById;
    }
}

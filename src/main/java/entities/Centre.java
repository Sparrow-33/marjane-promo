package entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Collection;

@Entity
@Setter
@Getter
public class Centre {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;
    @Basic
    @Column(name = "nom")
    private String nom;
    @Basic
    @Column(name = "ville")
    private String ville;
    @OneToOne(mappedBy = "centreByCentreId")
    private Admin adminById;

    @OneToMany(mappedBy = "responsableByCentreId")
    private Collection<Responsable> responsablesId;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Centre centre = (Centre) o;

        if (id != centre.id) return false;
        if (nom != null ? !nom.equals(centre.nom) : centre.nom != null) return false;
        if (ville != null ? !ville.equals(centre.ville) : centre.ville != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        result = 31 * result + (ville != null ? ville.hashCode() : 0);
        return result;
    }

    public Admin getAdminsById() {
        return adminById;
    }

    public void setAdminsById(Admin adminById) {
        this.adminById = adminById;
    }
}

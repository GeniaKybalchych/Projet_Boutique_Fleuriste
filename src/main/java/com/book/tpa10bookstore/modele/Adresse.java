package com.book.tpa10bookstore.modele;

import javax.persistence.*;

@Entity
@Table(name="adresse")
public class Adresse {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    private int noCivique;
    @Column(name="rue")
    private String rue;

    @Column(nullable = true)
    private String complementAdresse;

    private String codePostal;

    private String ville;

    private String province;

    private String pays;
    @OneToOne(mappedBy = "adresse", cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private Client client;

    public Adresse() {
    }

    public Adresse(int noCivique, String rue, String complementAdresse, String codePostal, String ville, String province, String pays) {
        this.noCivique = noCivique;
        this.rue = rue;
        this.complementAdresse = complementAdresse;
        this.codePostal = codePostal;
        this.ville = ville;
        this.province = province;
        this.pays = pays;
    }

    public int getNoCivique() {
        return noCivique;
    }

    public void setNoCivique(int noCivique) {
        this.noCivique = noCivique;
    }

    public String getRue() {
        return rue;
    }

    public void setRue(String rue) {
        this.rue = rue;
    }

    public String getComplementAdresse() {
        return complementAdresse;
    }

    public void setComplementAdresse(String complementAdresse) {
        this.complementAdresse = complementAdresse;
    }

    public String getCodePostal() {
        return codePostal;
    }

    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getPays() {
        return pays;
    }

    public void setPays(String pays) {
        this.pays = pays;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Override
    public String toString() {
        return "Adresse{" +
                "id=" + id +
                ", noCivique=" + noCivique +
                ", rue='" + rue + '\'' +
                ", complementAdresse='" + complementAdresse + '\'' +
                ", codePostal='" + codePostal + '\'' +
                ", ville='" + ville + '\'' +
                ", province='" + province + '\'' +
                ", pays='" + pays + '\'' +
                '}';
    }
}

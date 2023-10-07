package com.book.tpa10bookstore.modele;

import javax.persistence.*;

@Entity
@Table(name = "paiement")
public class Paiement  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="type")
    private String type;

    @Column(name="nom")
    private String nom;

    @Column(name="numero")
     private long numero;

    @Column(name="expiration")
    private String expiration;

    @Column(name="cvv")
    private int cvv;

    @OneToOne(mappedBy = "paiement", cascade={CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private Client client;

    public Paiement() {
    }

    public Paiement( String type, String nom, long numero, String expiration, int cvv) {

        this.type = type;
        this.nom = nom;
        this.numero = numero;
        this.expiration = expiration;
        this.cvv = cvv;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public long getNumero() {
        return numero;
    }

    public void setNumero(long numero) {
        this.numero = numero;
    }

    public String getExpiration() {
        return expiration;
    }

    public void setExpiration(String expiration) {
        this.expiration = expiration;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Override
    public String toString() {
        return "Paiement{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", nom='" + nom + '\'' +
                ", numero=" + numero +
                ", expiration='" + expiration + '\'' +
                ", cvv=" + cvv +
                ", client=" + client +
                '}';
    }
}

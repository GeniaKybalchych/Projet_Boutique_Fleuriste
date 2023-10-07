package com.book.tpa10bookstore.modele;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "client")
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "adresse_id")
    private Adresse adresse;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "paiement_id")
    private Paiement paiement;

    @OneToMany(mappedBy = "client", fetch = FetchType.EAGER, cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    private Set<Commande> historiqueCommande = new HashSet<>();

    @Column(name = "nom")
    private String nom;

    @Column(name = "prenom")
    private String prenom;

    private String username;

    private String password;

    @Column(name = "courriel")
    private String courriel;

    @Column(name = "telephone")
    private String telephone;

    public Client() {

    }

    public Client(String nom, String prenom, Adresse adresse, String courriel, String telephone, String username, String password) {
        this.nom = nom;
        this.prenom = prenom;
        this.username = username;
        this.password = password;
        this.adresse = adresse;
        this.courriel = courriel;
        this.telephone = telephone;
    }
    //recupere client
    //recupere historique dans une liste
    //on ajoute 1 commande dans la liste
    //On fait le set

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Set<Commande> getHistoriqueCommande() {
        return historiqueCommande;
    }

    public void setHistoriqueCommande(Set<Commande> historiqueCommande) {
        this.historiqueCommande = historiqueCommande;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Adresse getAdresse() {
        return adresse;
    }

    public void setAdresse(Adresse adresse) {
        this.adresse = adresse;
    }

    public String getCourriel() {
        return courriel;
    }

    public void setCourriel(String courriel) {
        this.courriel = courriel;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Paiement getPaiement() {
        return paiement;
    }

    public void setPaiement(Paiement paiement) {
        this.paiement = paiement;
    }

    @Override
    public String toString() {
        return "Client{" +
                "id=" + id +
                ", adresse=" + adresse +
                ", historiqueCommande=" + historiqueCommande +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", courriel='" + courriel + '\'' +
                ", telephone='" + telephone + '\'' +
                '}';
    }
}

package com.book.tpa10bookstore.modele;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
@Entity
@Table(name = "commandes")
public class Commande {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "commande",
    fetch = FetchType.EAGER)
    @JsonManagedReference
    private List<CommandeArticle> listeCommande;

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    @JoinColumn(name = "client_id")
    private Client client;

//    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_commande")
    private Date dateCommande;

//    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_livraison")
    private Date dateLivraison;

    public Commande() {
    }

    /**
     * Cette fonction permet de gerer l'ajout d'item a une commande en évitant les doublons, et en mettant en place
     * le lien bidirectionnel
     * @param commandeArticle
     */
    public void addCommandeArticleBidirection(CommandeArticle commandeArticle) {
        if(listeCommande == null) {
            listeCommande = new ArrayList<>();
        }
        if(this.hasItem(commandeArticle.getArticle())) {
            this.incrementItem(commandeArticle, commandeArticle.getQuantity());
        } else {
            this.listeCommande.add(commandeArticle);
            commandeArticle.setCommande(this);

        }
    }

    public boolean hasItem(Article item) {
        return this.listeCommande.stream()
                .anyMatch(i -> i.getArticle().equals(item));
    }

    public void incrementItem(CommandeArticle item, int quantity) {
        this.listeCommande.stream()
                .filter(i -> i.getArticle().equals(item.getArticle()))
                .findFirst()
                .ifPresent(i -> i.setQuantity(i.getQuantity() + quantity));
    }

    public Commande(List<CommandeArticle> listeCommande, Client client, Date dateCommande, Date dateLivraison) {
        this.listeCommande = listeCommande;
        this.client = client;
        this.dateCommande = dateCommande;
        this.dateLivraison = dateLivraison;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<CommandeArticle> getListeCommande() {
        return listeCommande;
    }

    public void setListeCommande(List<CommandeArticle> listeCommande) {
        this.listeCommande = listeCommande;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Date getDateCommande() {
        return dateCommande;
    }

    public void setDateCommande(Date dateCommande) {
        this.dateCommande = dateCommande;
    }

    public Date getDateLivraison() {
        return dateLivraison;
    }

    public void setDateLivraison(Date dateLivraison) {
        this.dateLivraison = dateLivraison;
    }

    /**
     * cette fonction fait en sorte que le champ calculé "Prix total" ne soit pas dans la BD
     * @return
     */
    public double getPrixTotal() {
        double result = 0;
        for (CommandeArticle item : this.listeCommande) {
            result += item.getArticle().getPrix();
        }
        return result;
    }

    @Override
    public String toString() {
        return "Commande{" +
                "id=" + id +
                ", listeCommande=" + listeCommande +
                ", client=" + client +
                ", dateCommande=" + dateCommande +
                ", dateLivraison=" + dateLivraison +
                '}';
    }

}
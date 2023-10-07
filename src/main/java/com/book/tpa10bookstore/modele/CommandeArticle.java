package com.book.tpa10bookstore.modele;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;

//@JsonPropertyOrder({ "id", "quantity", "commande" })
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
@Entity
@Table(name = "commande_article")
public class CommandeArticle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "commande_id_FK")
//    @JsonBackReference //@JsonIgnore
    private Commande commande;

    @ManyToOne
    @JoinColumn(name = "article_id")
    private Article article;

    private int quantity;

    public CommandeArticle() {
    }

    public CommandeArticle(Article article, int quantity) {
        this.article = article;
        this.quantity = quantity;
    }

    public CommandeArticle(Commande commande, Article article, int quantity) {
        this.commande = commande;
        this.article = article;
        this.quantity = quantity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Commande getCommande() {
        return commande;
    }

    public void setCommande(Commande commande) {
        this.commande = commande;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}

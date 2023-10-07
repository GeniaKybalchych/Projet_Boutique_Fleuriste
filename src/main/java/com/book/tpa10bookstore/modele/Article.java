package com.book.tpa10bookstore.modele;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;

/**
 * Cette classe ...
 */
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
@Entity
@Table(name="article")
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    private String imgPath;

    @Column(unique = true)
    private String nomArticle;

    private String description;

    private Double prix;

    private Double taille;

    private String categorie;

    @Column(name = "difficulte_entretien", nullable = true)
    private int difficulteEntretien;

    @Column(nullable = true)
    private String occasion;

    public Article(String description) {
        this.description = description;
    }

    public Article() {

    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Article(String imgPath, String nomArticle, String description, Double prix, Double taille, String categorie, int difficulteEntretien, String occasion) {
        this.imgPath = imgPath;
        this.nomArticle = nomArticle;
        this.description = description;
        this.prix = prix;
        this.taille = taille;
        this.categorie = categorie;
        this.difficulteEntretien = difficulteEntretien;
        this.occasion = occasion;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getNomArticle() {
        return nomArticle;
    }

    public void setNomArticle(String nomArticle) {
        this.nomArticle = nomArticle;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomCommun() {
        return nomArticle;
    }

    public void setNomCommun(String nomCommun) {
        this.nomArticle = nomCommun;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public Double getTaille() {
        return taille;
    }

    public void setTaille(Double taille) {
        this.taille = taille;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public int getDifficulteEntretien() {
        return difficulteEntretien;
    }

    public void setDifficulteEntretien(int difficulteEntretien) {
        this.difficulteEntretien = difficulteEntretien;
    }

    public String getOccasion() {
        return occasion;
    }

    public void setOccasion(String occasion) {
        this.occasion = occasion;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", nomArticle='" + nomArticle + '\'' +
                ", description='" + description + '\'' +
                ", prix=" + prix +
                ", taille=" + taille +
                ", categorie='" + categorie + '\'' +
                ", difficulteEntretien='" + difficulteEntretien + '\'' +
                ", occasion='" + occasion + '\'' +
                '}';
    }
}

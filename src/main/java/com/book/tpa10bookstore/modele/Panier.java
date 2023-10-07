package com.book.tpa10bookstore.modele;

import java.util.List;
import java.util.Objects;

public class Panier {

    private Long id;
    private List<Article> panier;

    public Panier() {
    }

    public Panier(List<Article> panier) {
        this.panier = panier;
    }

    public List<Article> getPanier() {
        return panier;
    }

    public void setPanier(List<Article> panier) {
        this.panier = panier;
    }

    //User ajoute des article au panier
    //On les ajoute dans un arraylist
    //Save arraylist dans la SESSION


    @Override
    public String toString() {
        return "Panier{" +
                "id=" + id +
                ", panier=" + panier +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Panier panier1 = (Panier) o;
        return Objects.equals(panier, panier1.panier);
    }

    @Override
    public int hashCode() {
        return Objects.hash(panier);
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
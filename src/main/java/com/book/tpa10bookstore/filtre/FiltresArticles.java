package com.book.tpa10bookstore.filtre;

public class FiltresArticles {
    public FiltreArticle filterByPriceRange(double minPrix, double maxPrix) {
        return article -> article.getPrix() >= minPrix && article.getPrix() <= maxPrix;
    }

    public FiltreArticle filterBySizeRange(double minTaille, double maxTaille) {
        return article -> article.getTaille() >= minTaille && article.getTaille() <= maxTaille;
    }

    public FiltreArticle filterByDifficultyRange(int minDifficulte, int maxDifficulte) {
        return article -> article.getDifficulteEntretien() >= minDifficulte &&
                                                                article.getDifficulteEntretien() <= maxDifficulte;
    }

    public FiltreArticle filterByOccasion(String occasion) {
        return article -> article.getOccasion().equals(occasion);
    }

    public FiltreArticle filterByCategorie(String categorie) {
        return article -> article.getCategorie().equals(categorie);
    }


}

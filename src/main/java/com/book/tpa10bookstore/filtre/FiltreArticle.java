package com.book.tpa10bookstore.filtre;

import com.book.tpa10bookstore.modele.Article;

@FunctionalInterface
public interface FiltreArticle {
    boolean test(Article article);
}

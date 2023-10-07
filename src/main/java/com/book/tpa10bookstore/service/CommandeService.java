package com.book.tpa10bookstore.service;

import com.book.tpa10bookstore.dao.CommandeArticleDAO;
import com.book.tpa10bookstore.dao.CommandeDAO;
import com.book.tpa10bookstore.modele.Commande;
import com.book.tpa10bookstore.modele.CommandeArticle;

public class CommandeService {

    private CommandeArticleDAO commandeArticleDAO;

    private CommandeDAO commandeDAO;

    public CommandeService(CommandeDAO commandeDAO, CommandeArticleDAO commandeArticleDAO) {

        this.commandeArticleDAO = commandeArticleDAO;
        this.commandeDAO = commandeDAO;
    }

    public void insertCommande(Commande commande) {
        for (CommandeArticle item :
                commande.getListeCommande()) {
            commandeArticleDAO.save(item);
        }
    }
}

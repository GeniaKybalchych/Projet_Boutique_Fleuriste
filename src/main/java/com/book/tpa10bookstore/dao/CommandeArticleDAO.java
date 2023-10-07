package com.book.tpa10bookstore.dao;

import com.book.tpa10bookstore.modele.CommandeArticle;
import com.book.tpa10bookstore.util.HibernateUtil;

import javax.persistence.*;
import java.util.List;

public class CommandeArticleDAO {

    private static CommandeArticleDAO instance = null;

    private final EntityManagerFactory entityManagerFactory = HibernateUtil.getEntityManagerFactory();

    private CommandeArticleDAO() {}

    public static synchronized CommandeArticleDAO getInstance() {
        if (instance == null) {
            instance = new CommandeArticleDAO();
        }
        return instance;
    }
    public CommandeArticle save(CommandeArticle commandeArticle) {
        EntityManager entityManager = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(commandeArticle);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return commandeArticle;
    }

    public void updateCommandeArticle(CommandeArticle commandeArticle, int nouvelleQuantite) {
        EntityManager entityManager = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();

            // Mettre à jour la quantité de l'article
            commandeArticle.setQuantity(nouvelleQuantite);

            entityManager.merge(commandeArticle);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }
    public void deleteCommandeArticle(CommandeArticle commandeArticle) {
        EntityManager entityManager = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.remove(commandeArticle);
            entityManager.getTransaction().commit();
            System.out.println("CommandeArticle supprimé avec succès.");
        } catch (Exception e) {
            System.out.println("Erreur lors de la suppression de la CommandeArticle : " + e.getMessage());
            if (entityManager != null) {
                entityManager.getTransaction().rollback();
            }
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    public CommandeArticle findCommandeArticleById(long id) {
        EntityManager entityManager = null;
        CommandeArticle commandeArticle = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            commandeArticle = entityManager.find(CommandeArticle.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

        return commandeArticle;
    }

    public List<CommandeArticle> findCommandeArticlesByCommandeId(int commandeId) {
        EntityManager entityManager = null;
        List<CommandeArticle> commandeArticles = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            TypedQuery<CommandeArticle> query = entityManager.createQuery(
                    "SELECT ca FROM CommandeArticle ca WHERE ca.commande.id = :commandeId",
                    CommandeArticle.class
            );
            query.setParameter("commandeId", commandeId);
            commandeArticles = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

        return commandeArticles;
    }

    public List<CommandeArticle> findCommandeArticlesByArticleId(int articleId) {
        EntityManager entityManager = null;
        List<CommandeArticle> commandeArticles = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            TypedQuery<CommandeArticle> query = entityManager.createQuery(
                    "SELECT ca FROM CommandeArticle ca WHERE ca.article.id = :articleId",
                    CommandeArticle.class
            );
            query.setParameter("articleId", articleId);
            commandeArticles = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

        return commandeArticles;
    }

    /**
     * Va chercher tous les items de la bd
     *
     * @return une liste items
     */
    public List<CommandeArticle> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();


        //  Query query = entityManager.createNativeQuery("select * from Item");
        Query query = entityManager.createQuery("select i from CommandeArticle i");

        return query.getResultList();
    }

}

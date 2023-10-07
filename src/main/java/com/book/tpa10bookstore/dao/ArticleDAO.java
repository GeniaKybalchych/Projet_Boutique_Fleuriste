package com.book.tpa10bookstore.dao;

import com.book.tpa10bookstore.modele.Article;
import com.book.tpa10bookstore.util.HibernateUtil;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {
    //Lien vers persistence.xml
    private static ArticleDAO instance = null;

    private EntityManagerFactory entityManagerFactory = HibernateUtil.getEntityManagerFactory();

    private ArticleDAO() {}

    public static synchronized ArticleDAO getInstance() {
        if (instance == null) {
            instance = new ArticleDAO();
        }
        return instance;
    }

    public Article insert(Article article) {

        EntityManager entityManager = null;
        try {
            //Nous donne les methodes de hibernate
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(article);//sauvegarder l'item
            entityManager.getTransaction().commit();

        } catch (Exception e) {
            entityManager.getTransaction().rollback();//Permet de supprimer l'insertion s<il y eu un probleme
            e.printStackTrace();
        }
        return null;
    }

    public boolean delete(Integer Id) {
        //Lien vers le fichier persistence.xml
        EntityManager entityManager = null;
        try {
            //permet d<utiliser les fonctions pour manipuler la bd
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();

            //cherche le id dans la classe Item (rajoute un merge)
            entityManager.merge(entityManager.find(Article.class, Id));
            entityManager.remove(entityManager.find(Article.class, Id));
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            entityManager.getTransaction().rollback();//Permet de supprimer l'insertion s<il y eu un probleme
            e.printStackTrace();//affcihe l<exception
            return false;
        }

    }//fin delete

    /**
     * Va chercher tous les items de la bd
     *
     * @return une liste items
     */
    public List<Article> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery("select i from Article i");

        return query.getResultList();
    }

    public Article findById(Integer id) {
        Article article = null;
        EntityManager entityManager = null;
        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();

            article = entityManager.find(Article.class, id);

            entityManager.getTransaction().commit();
            return article;
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
            return article;
        }
    }//fin findById

    /**
     * Update l'article s'il le trouve return true sinon return false
     *
     * @param updatedArticle
     * @return boolean
     */
    public boolean update(Article updatedArticle) {

        EntityManager entityManager = null;
        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();

            Article existingArticle = entityManager.find(Article.class, updatedArticle.getId());

            if (existingArticle != null) {
                //On detache l'entité
                entityManager.detach(existingArticle);

                //Update les propriétés
                existingArticle.setPrix(updatedArticle.getPrix());
                existingArticle.setCategorie(updatedArticle.getCategorie());
                existingArticle.setTaille(updatedArticle.getTaille());
                existingArticle.setDifficulteEntretien(updatedArticle.getDifficulteEntretien());
                existingArticle.setOccasion(updatedArticle.getOccasion());
                existingArticle.setNomCommun(updatedArticle.getNomCommun());

                entityManager.merge(existingArticle);

                entityManager.getTransaction().commit();
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            if (entityManager != null && entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    //Methode filtre{
    //retourne la liste filtrée
    public static List<Article> filtreRangePrix(List<Article> list, double minPrix, double maxPrix) {
        List<Article> filteredArticles = new ArrayList<>();

        for (Article art : list) {
            double price = art.getPrix();
            if (price >= minPrix && price <= maxPrix) {
                filteredArticles.add(art);
            }
        }
        return filteredArticles;
    }

    public List<Article> filtreRangePrix2(double minPrix, double maxPrix) { //Implementation plus optimisé car le filtrage sèeffectue du coté de la BD
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            CriteriaBuilder cb = entityManager.getCriteriaBuilder();
            CriteriaQuery<Article> query = cb.createQuery(Article.class);
            Root<Article> root = query.from(Article.class);
            query.select(root).where(cb.between(root.get("prix"), minPrix, maxPrix));
            return entityManager.createQuery(query).getResultList();
        } finally {
            entityManager.close();
        }
    }

    public List<Article> findByTailleRange(double minTaille, double maxTaille) { //On peut mettre un range de taille
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            CriteriaBuilder cb = entityManager.getCriteriaBuilder();
            CriteriaQuery<Article> query = cb.createQuery(Article.class);
            Root<Article> root = query.from(Article.class);
            query.select(root).where(cb.between(root.get("taille"), minTaille, maxTaille));
            return entityManager.createQuery(query).getResultList();
        } finally {
            entityManager.close();
        }
    }

    public List<Article> findByDifficulteEntretienRange(int minDifficulte, int maxDifficulte) { //On peut mettre un range pour choisir le niveau de difficulté
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            CriteriaBuilder cb = entityManager.getCriteriaBuilder();
            CriteriaQuery<Article> query = cb.createQuery(Article.class);
            Root<Article> root = query.from(Article.class);
            query.select(root).where(cb.between(root.get("difficulteEntretien"), minDifficulte, maxDifficulte));
            return entityManager.createQuery(query).getResultList();
        } finally {
            entityManager.close();
        }
    }

    public List<Article> findByOccasion(String occasion) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            CriteriaBuilder cb = entityManager.getCriteriaBuilder();
            CriteriaQuery<Article> query = cb.createQuery(Article.class);
            Root<Article> root = query.from(Article.class);
            query.select(root).where(cb.equal(root.get("occasion"), occasion));
            return entityManager.createQuery(query).getResultList();
        } finally {
            entityManager.close();
        }
    }

    public List<Article> findByCategorie(String categorie) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            CriteriaBuilder cb = entityManager.getCriteriaBuilder();
            CriteriaQuery<Article> query = cb.createQuery(Article.class);
            Root<Article> root = query.from(Article.class);
            query.select(root).where(cb.equal(root.get("categorie"), categorie));
            return entityManager.createQuery(query).getResultList();
        } finally {
            entityManager.close();
        }
    }
}


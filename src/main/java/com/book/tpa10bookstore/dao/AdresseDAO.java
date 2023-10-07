package com.book.tpa10bookstore.dao;

import com.book.tpa10bookstore.modele.Adresse;
import com.book.tpa10bookstore.modele.Article;
import com.book.tpa10bookstore.util.HibernateUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class AdresseDAO {

    private static AdresseDAO instance = null;
    private static EntityManagerFactory entityManagerFactory =
            HibernateUtil.getEntityManagerFactory();

    private AdresseDAO() {}

    public static synchronized AdresseDAO getInstance() {
        if (instance == null) {
            instance = new AdresseDAO();
        }
        return instance;
    }

    public void ajouterAdresse(Adresse adresse) {
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(adresse);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    public Adresse obtenirAdresseParId(int adresseId) {
        EntityManager entityManager = null;
        Adresse adresse = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            adresse = entityManager.find(Adresse.class, adresseId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

        return adresse;
    }

    public void mettreAJourAdresse(Adresse adresse) {
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.merge(adresse);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }
    public boolean supprimerAdresse(int Id){
        //Lien vers le fichier persistence.xml
        EntityManager entityManager = null;
        try{
            //permet d<utiliser les fonctions pour manipuler la bd
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();

            //cherche le id dans la classe Item (rajoute un merge)
            //entityManager.merge(entityManager.find(Article.class, Id));
            Adresse adresse = entityManager.find(Adresse.class, Id);
            entityManager.remove(entityManager.contains(adresse) ? adresse : entityManager.merge(adresse));
            entityManager.remove(adresse);
            entityManager.getTransaction().commit();
            return true;
        }catch(Exception e){
            if (entityManager.getTransaction() != null && entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }//Permet de supprimer l'insertion s<il y eu un probleme
            e.printStackTrace();//affcihe l<exception
            return false;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

}//fin delete






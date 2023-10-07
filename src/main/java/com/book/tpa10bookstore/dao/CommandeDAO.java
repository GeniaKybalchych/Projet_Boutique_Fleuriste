package com.book.tpa10bookstore.dao;


import com.book.tpa10bookstore.modele.Commande;
import com.book.tpa10bookstore.util.HibernateUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.ArrayList;
import java.util.List;

/**
 * Cette classe permet de ...
 * ajouter une commande
 * supprimer une commande
 * modifier une commande
 * chercher une commande
 * chercher toutes les commandes
 *
 */
public class CommandeDAO {

    private static CommandeDAO instance = null;

    private EntityManagerFactory entityManagerFactory = HibernateUtil.getEntityManagerFactory();

    private CommandeDAO() {}

    public static synchronized CommandeDAO getInstance() {
        if (instance == null) {
            instance = new CommandeDAO();
        }
        return instance;
    }

    /**
     * Cette methode permet d'ajouter une commande  dans la base de donnée
     *
     * @param commande
     */
    public void save(Commande commande) {

        EntityManager entityManager = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(commande);
            entityManager.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {

            if (entityManager != null) {
                entityManager.close();
            }
        }

    }

    /**
     * Cette méthode permet de supprimer une commande en la recherchant par son id
     *
     * @param id
     */
    public void deleteCommandeById(int id) {

        EntityManager entityManager = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();

            Commande commadeASupprimer = entityManager.find(Commande.class, id);

            if (commadeASupprimer != null) {

                entityManager.persist(commadeASupprimer);
                entityManager.getTransaction().commit();
                System.out.println("Suppression de la commande ayant l'id " + id);

            } else {

                System.out.println("Suppression impossible de la commande ayant l'id " + id);
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {

            if (entityManager != null) {
                entityManager.close();
            }
        }

    }

    /**
     * Cette méthode permet de modifier une commande existante dans la base de données
     * en la recherchant par son id
     *
     * @param id
     * @param commandeModifiee
     */
    public void updateCommande(int id, Commande commandeModifiee) {

        EntityManager entityManager = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();

            Commande commandeAModifier = entityManager.find(Commande.class, id);

            if (commandeAModifier != null) {
                commandeAModifier.setDateCommande(commandeModifiee.getDateCommande());
                commandeAModifier.setListeCommande(commandeModifiee.getListeCommande());
                commandeAModifier.setClient(commandeModifiee.getClient());
                commandeAModifier.setDateLivraison(commandeModifiee.getDateLivraison());

                entityManager.getTransaction().commit();
                System.out.println("La commande ayant l'id " + id + " a été modifiée.");
            } else {
                System.out.println("La commande ayant l'id " + id + " n'a pu être modifiée.");
            }

        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    /**
     * Cette méthode permet de chercher une commande par son id
     *
     * @param id
     * @return la commande relative a l'id
     */
    public Commande findCommandeById(int id) {

        EntityManager entityManager = null;
        Commande commande = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            commande = entityManager.find(Commande.class, id);
            System.out.println("La commande ayant l'id " + id + " a été trouvée.");

        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            if (entityManager != null) {
                entityManager.close();
            }
        }

        return null;
    }

    /**
     * Cette méthode permet de chercher toutes les commandes
     *
     * @return la liste de toutes les commandes
     */
    public List<Commande> findAllCommande() {

        EntityManager entityManager = null;
        List<Commande> commandeList = new ArrayList<>();

        try {

            entityManager = entityManagerFactory.createEntityManager();
            TypedQuery<Commande> query =
                    entityManager.createQuery("select commande from Commande commande", Commande.class);
            commandeList = query.getResultList();

        } catch (Exception e) {

            e.printStackTrace();

        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

        return commandeList;
    }

}




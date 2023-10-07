package com.book.tpa10bookstore.util;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class HibernateUtil {
    private static final EntityManagerFactory entityManagerFactory = buildEntityManagerFactory();

    private static EntityManagerFactory buildEntityManagerFactory() {
        try {
            // Crée une EntityManagerFactory à partir du nom de l'unité de persistance dans le fichier persistence.xml
            return Persistence.createEntityManagerFactory("connection");
        } catch (Throwable ex) {
            System.err.println("Erreur lors de la création de l'EntityManagerFactory : " + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static EntityManagerFactory getEntityManagerFactory() {
        return entityManagerFactory;
    }

    public static void closeEntityManagerFactory() {
        if (entityManagerFactory != null) {
            entityManagerFactory.close();
        }
    }
}
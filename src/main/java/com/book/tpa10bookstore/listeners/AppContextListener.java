//package com.book.tpa10bookstore.listeners;
//
//import com.book.tpa10bookstore.modele.Commande;
//import com.book.tpa10bookstore.util.HibernateUtil;
//
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//
///**
// * Cette classe permet de partager des objets à travers l'application. Les objets sont initialisé lors du chargement de
// * l'application dans "contextInitialized"
// */
//public class AppContextListener implements ServletContextListener {
//
//    @Override
//    public void contextInitialized(ServletContextEvent servletContextEvent) {
//        // Create a new instance of an object
//        Commande commande = new Commande();
//
//
//        // Store the object in the ServletContext
//        // so that it can be retrieved later.
//        servletContextEvent.getServletContext().setAttribute("commande", commande);
//    }
//
//    @Override
//    public void contextDestroyed(ServletContextEvent servletContextEvent) {
//        HibernateUtil.closeEntityManagerFactory();
//    }
//}

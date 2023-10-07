package com.book.tpa10bookstore.controleur;

import com.book.tpa10bookstore.dao.ArticleDAO;
import com.book.tpa10bookstore.dao.ClientDAO;
import com.book.tpa10bookstore.dao.CommandeArticleDAO;
import com.book.tpa10bookstore.dao.CommandeDAO;
import com.book.tpa10bookstore.modele.*;

import java.util.*;

/**
 * Scripts d'insertion à la BD pour faire des tests. on definit la methode en bas et on l'appelle dans le main
 */
public class Main {
    public static void main(String[] args) {

        ArticleDAO articleDAO = ArticleDAO.getInstance();
        CommandeDAO commandeDAO = CommandeDAO.getInstance();
        ClientDAO clientDAO = ClientDAO.getInstance();
        CommandeArticleDAO commandeArticleDAO = CommandeArticleDAO.getInstance();

        //Remplissage de la table Client si vide
        if (clientDAO.rechercherTousLesClients().isEmpty()) {
            remplirBDClientAvecAdresse(clientDAO);
        }

        //Remplissage de la table Article si vide
        if(articleDAO.findAll().isEmpty()) {
            remplirBDArticle(articleDAO);
        }
        //Remplissage de la table Commande avec des CommandeArticle si vide
        if(commandeDAO.findAllCommande().isEmpty()) {
            remplirBDCommandes(articleDAO, commandeDAO, clientDAO, commandeArticleDAO);
        }
    }

    public static void remplirBDClientAvecAdresse(ClientDAO clientDAO) {
        Client client1 = new Client("Bohr", "Alex", new Adresse(300, "rue de la Rivière", "apt 27", "H4J 3B9", "St-ClinClin-Des-MeuMeu",
                "Tokebac", "Canada"), "alex123@gmail.com", "514-321-3456", "forspoken", "password123");
        Client client2 = new Client("Safa", "Sofiane", new Adresse(500, "rue de la Rivière", "apt 27", "H4J 3B9", "St-ClinClin-Des-MeuMeu",
                "Tokebac", "Canada"), "soso888@gmail.com", "514-982-2673", "sheeshhh", "123vivaldi");
        clientDAO.ajouterClient(client1);
        clientDAO.ajouterClient(client2);
    }

    private static void remplirBDArticle(ArticleDAO articleDAO) {
        // Bouquets
        articleDAO.insert(new Article("./Images/articles/download.jfif", "Bouquet de tournesols", "Un assortiment joyeux de tournesols et de fleurs de saison.", 30.00, 5.0, "bouquet", 1, "Tous"));
        articleDAO.insert(new Article("./Images/articles/download2.jfif", "Bouquet de roses classique", "Douze roses rouges disposées dans un beau bouquet.", 45.00, 5.0, "bouquet", 1, "Tous"));
        articleDAO.insert(new Article("./Images/articles/download3.jfif", "Aloe Vera", "Une excellente plante d'intérieur connue pour ses qualités purifiantes de l'air.", 15.00, 2.0, "plantes", 2, "Tous"));
        articleDAO.insert(new Article("./Images/articles/download4.jfif", "Ficus Lyrata", "Une plante d'intérieur populaire avec de grandes feuilles cireuses.", 55.00, 8.0, "plantes", 3, "Tous"));
        articleDAO.insert(new Article("./Images/articles/download5.jfif", "Vase en verre vintage", "Un élégant vase en verre vintage, parfait pour tout bouquet.", 25.00, 3.0, "vases", 0, "Tous"));
        articleDAO.insert(new Article("./Images/articles/download6.jfif", "Vase en céramique", "Un solide vase en céramique dans une jolie teinte pastel.", 35.00, 5.0, "vases", 0, "Tous"));
        articleDAO.insert(new Article("./Images/articles/download7.jfif", "Guide des plantes d'intérieur", "Un guide complet sur les plantes d'intérieur et leur entretien.", 20.00, 1.0, "livres", 0, "Tous"));
        articleDAO.insert(new Article("./Images/articles/download8.jfif", "Maîtrise de l'art des compositions florales", "Un livre détaillé sur la création de compositions florales époustouflantes.", 30.00, 1.5, "livres", 0, "Tous"));
        articleDAO.insert(new Article("./Images/articles/download9.jfif", "Panier d'anniversaire de fleurs", "Un magnifique panier de fleurs parfait pour les anniversaires.", 50.00, 7.0, "occasions", 1, "Anniversaire"));
        articleDAO.insert(new Article("./Images/articles/download10.jfif", "Arrangement floral pour anniversaire", "Un arrangement floral élégant conçu pour les anniversaires.", 70.00, 8.0, "occasions", 2, "Anniversaire"));

// Comme vous n'avez que 10 images, nous répétons les mêmes images pour le reste des articles.
        articleDAO.insert(new Article("./Images/articles/download.jfif", "Bouquet personnalisé", "Un bouquet personnalisé conçu selon vos spécifications.", 60.00, 7.0, "demandes-speciales", 2, "Tous"));
        articleDAO.insert(new Article("./Images/articles/download2.jfif", "Orchidées rares", "Une sélection d'orchidées rares et exotiques.", 100.00, 10.0, "demandes-speciales", 4, "Tous"));
        articleDAO.insert(new Article("./Images/articles/download3.jfif", "Bouquet Winter Wonderland", "Un arrangement vif de fleurs d'hiver.", 45.00, 5.0, "bouquet", 1, "Tous"));
// Plus de Plantes
        articleDAO.insert(new Article("./Images/articles/download5.jfif", "Plante Serpent", "Une plante d'intérieur à faible entretien avec de longues feuilles dressées.", 20.00, 3.0, "plantes", 1, "Tous"));
// Plus de Vases
        articleDAO.insert(new Article("./Images/articles/download6.jfif", "Vase en métal rustique", "Un vase en métal rustique, idéal pour les fleurs séchées.", 30.00, 4.0, "vases", 0, "Tous"));
// Plus de Livres
        articleDAO.insert(new Article("./Images/articles/download7.jfif", "Botanique pour débutants", "Un guide introductif sur la botanique pour les débutants.", 25.00, 1.5, "livres", 0, "Tous"));
// Plus d'Occasions
        articleDAO.insert(new Article("./Images/articles/download8.jfif", "Bouquet Bon Rétablissement", "Un bouquet vibrant qui saura remonter le moral.", 40.00, 6.0, "occasions", 0, "Bon Rétablissement"));
// Plus de Demandes-spéciales
        articleDAO.insert(new Article("./Images/articles/download9.jfif", "Forfait fleurs de mariage", "Un forfait complet de fleurs pour les mariages.", 500.00, 50.0, "demandes-speciales", 3, "Mariage"));
        articleDAO.insert(new Article("./Images/articles/download10.jfif", "Consultation de décoration d'intérieur", "Une consultation professionnelle pour la décoration de plantes d'intérieur.", 150.00, 1.0, "demandes-speciales", 0, "Tous"));

    }

    private static void remplirBDCommandes(ArticleDAO articleDAO, CommandeDAO commandeDAO, ClientDAO clientDAO, CommandeArticleDAO commandeArticleDAO) {
        // Fetch some articles to associate with commandes
        List<Article> articles = articleDAO.findAll();

        if(articles.size() < 4) {
            System.out.println("Not enough articles in the database to create a Commande");
            return;
        }

        // Assume we have at least one client in the database
        List<Client> listeClient = clientDAO.rechercherTousLesClients();  // Implement this method in your ClientDAO to fetch a client

        if(listeClient.size() < 2) {
            System.out.println("Not enough clients in the database to create a Commande");
            return;
        }

        Client firstClient = listeClient.get(0);
        Client secondClient = listeClient.get(1);

        for(int i=0; i<5; i++) {  // For creating 5 Commandes
            List<CommandeArticle> listeCommande = new ArrayList<>();
            Date dateCommande = new Date();  // Set the current date as the order date
            Date dateLivraison = new Date(System.currentTimeMillis() + 3*24*60*60*1000);  // Set the delivery date as 3 days from now

            // Alternate between the first and second clients
            Client client = (i % 2 == 0) ? firstClient : secondClient;

            Commande commande = new Commande(listeCommande, client, dateCommande, dateLivraison);

            for(int j=0; j<4; j++) {  // For creating 4 CommandeArticle instances for each Commande
                 ;
                CommandeArticle commandeArticle = new CommandeArticle(commande, articles.get(j), (j+1)*2);
                commande.addCommandeArticleBidirection(commandeArticle);
            }

            // Save the Commande
            commandeDAO.save(commande);
        }
    }
}

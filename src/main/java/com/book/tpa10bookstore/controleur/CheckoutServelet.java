package com.book.tpa10bookstore.controleur;


import com.book.tpa10bookstore.dao.ClientDAO;
import com.book.tpa10bookstore.modele.Adresse;
import com.book.tpa10bookstore.modele.Client;
import com.book.tpa10bookstore.modele.Paiement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class CheckoutServelet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //1. récuperation de la session
        HttpSession session = request.getSession();

        //2. récuperation du client si connecté
        Client client = null;
        Adresse adresse = null;
        Paiement paiement = new Paiement();

        ClientDAO clientDAO = ClientDAO.getInstance();

        if (session.getAttribute("client") != null) {
            client = (Client) session.getAttribute("client");

            paiement.setType(request.getParameter("paymentMethod"));
            paiement.setNom(request.getParameter("nomCarte"));
            paiement.setNumero(Integer.parseInt(request.getParameter("numeroCarte")));
            paiement.setExpiration(request.getParameter("dateExpiration"));
            paiement.setCvv(Integer.parseInt(request.getParameter("cvv")));

        } else { // client non connecté

            client = new Client();
            adresse = new Adresse();
            client.setAdresse(adresse);

            String prenom = request.getParameter("prenom");
            String nom = request.getParameter("nom");
            String courriel = request.getParameter("email");
            String noCivique = request.getParameter("noCivique");
            String rue = request.getParameter("adress");
            String adresse2 = request.getParameter("adress2");
            String pays = request.getParameter("pays");
            String province = request.getParameterValues("province").toString();
            String codePostal = request.getParameter("codePostal");

            client.setPrenom(prenom);
            client.setNom(nom);
            client.setCourriel(courriel);
            client.getAdresse().setNoCivique(Integer.parseInt(noCivique));
            client.getAdresse().setRue(rue);
            client.getAdresse().setComplementAdresse(adresse2);
            client.getAdresse().setPays(pays);
            client.getAdresse().setProvince(province);
            client.getAdresse().setCodePostal(codePostal);

            paiement.setType(request.getParameter("paymentMethod"));
            paiement.setNom(request.getParameter("nomCarte"));
            paiement.setNumero(Integer.parseInt(request.getParameter("numeroCarte")));
            paiement.setExpiration(request.getParameter("dateExpiration"));
            paiement.setCvv(Integer.parseInt(request.getParameter("cvv")));
        }

        // À la fin, mettez à jour le client dans la base de données.
        client.setPaiement(paiement);
        clientDAO.ajouterClient(client); // Si le client est nouveau
        // ou
        clientDAO.mettreAJourClient(client); // Si le client existait déjà

        // Redirigez vers la page de confirmation
        response.sendRedirect("confirmationCheckout.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}











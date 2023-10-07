package com.book.tpa10bookstore.controleur;

import com.book.tpa10bookstore.dao.ClientDAO;
import com.book.tpa10bookstore.modele.Adresse;
import com.book.tpa10bookstore.modele.Client;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ClientServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Client Controller";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        // Définir l'encodage des paramètres de requête
        request.setCharacterEncoding("UTF-8");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        // Définir l'encodage des paramètres de requête
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String courriel = request.getParameter("courriel");
        String telephone = request.getParameter("telephone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        HttpSession session = request.getSession();
        Client client = null;
        if (action.equals("create")) {
            client = new Client();
        } else if (action.equals("update")) {
            client = (Client) session.getAttribute("client");
        }

        client.setNom(nom);
        client.setPrenom(prenom);
        client.setTelephone(telephone);
        client.setCourriel(courriel);
        client.setPassword(password);
        client.setUsername(username);


        // Addresse
        String rue = request.getParameter("rue");
        String complementAdresse = request.getParameter("complementAdresse");
        String codePostal = request.getParameter("codePostal");
        String ville = request.getParameter("ville");
        String province = request.getParameter("province");
        String pays = request.getParameter("pays");
        String noCivique = request.getParameter("noCivique");

        Adresse adresse = null;
        if (action.equals("create")) {
            adresse = new Adresse();
        } else if (action.equals("update")) {
            adresse = client.getAdresse();
        }

        adresse.setRue(rue);
        adresse.setVille(ville);
        adresse.setCodePostal(codePostal);
        adresse.setComplementAdresse(complementAdresse);
        adresse.setProvince(province);
        adresse.setPays(pays);
        adresse.setNoCivique(Integer.parseInt(noCivique));

        client.setAdresse(adresse);

        ClientDAO clientDAO = ClientDAO.getInstance();
        if (action.equals("create")) {
            clientDAO.ajouterClient(client);
        } else if (action.equals("update")) {
            clientDAO.mettreAJourClient(client);
        }

        session.setAttribute("client", client);

        RequestDispatcher disp = getServletContext().getRequestDispatcher("/profil.jsp");
        try {
            disp.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() {
    }
}
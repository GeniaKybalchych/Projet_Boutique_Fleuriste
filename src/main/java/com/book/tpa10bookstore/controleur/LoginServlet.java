package com.book.tpa10bookstore.controleur;

import com.book.tpa10bookstore.dao.ArticleDAO;
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

public class LoginServlet extends HttpServlet {

    private String message;

    public void init() {
        message = "Login Controller";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Vérifier si le client existe
        ClientDAO clientDAO = ClientDAO.getInstance();
        Client client = clientDAO.findByUsername(username);

        if (client != null && client.getPassword().equals(password)) {
            // User exists and password matches
            HttpSession session = request.getSession();
            session.setAttribute("client", client);
            session.setAttribute("connected", true);

            // Write success to the response so the fetch API knows the login was successful
            response.getWriter().write("success");
        } else {
            // User doesn't exist or password doesn't match
            // Write failure to the response so the fetch API knows the login was unsuccessful
            response.getWriter().write("fail");
        }
    }

    public void destroy() {
    }
}
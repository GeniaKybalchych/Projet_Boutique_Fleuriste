package com.book.tpa10bookstore.controleur;

import com.book.tpa10bookstore.dao.ArticleDAO;
import com.book.tpa10bookstore.modele.Article;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Cette servlet est la servlet principale de l'accueil du magasin. Elle permet la redirection vers les différents catalogues.
 */
public class MagasinServlet extends HttpServlet {

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        session.setAttribute("action", action);
        response.sendRedirect("catalogue.jsp");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
    }
    public void destroy() {
    }
}
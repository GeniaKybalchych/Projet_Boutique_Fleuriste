package com.book.tpa10bookstore.controleur;

import com.book.tpa10bookstore.dao.ArticleDAO;
import com.book.tpa10bookstore.modele.Article;
import com.book.tpa10bookstore.modele.CommandeArticle;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/PanierServlet")
public class PanierServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder stringBuilder = new StringBuilder();
        String line = null;
        BufferedReader reader = request.getReader();
        while ((line = reader.readLine()) != null)
            stringBuilder.append(line);

        String requestBody = stringBuilder.toString();

        Gson gson = new Gson();
        Map<String, Integer> cart = gson.fromJson(requestBody, new TypeToken<Map<String, Integer>>(){}.getType());

        ArticleDAO articleDAO = ArticleDAO.getInstance();
        List<CommandeArticle> articles = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : cart.entrySet()) {
            Article article = articleDAO.findById(Integer.parseInt(entry.getKey()));

            CommandeArticle commandeArticle = new CommandeArticle(article, entry.getValue());
            // Assuming you have a setQuantity method in your Article class
//            article.set(entry.getValue());
            articles.add(commandeArticle);
        }

        request.getSession().setAttribute("articles", articles);
        response.sendRedirect("panier.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.getWriter().write("redirect");
    }
}

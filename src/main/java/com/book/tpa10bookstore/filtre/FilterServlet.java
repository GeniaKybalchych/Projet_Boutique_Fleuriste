package com.book.tpa10bookstore.filtre;

import com.book.tpa10bookstore.dao.ArticleDAO;
import com.book.tpa10bookstore.modele.Article;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/servletFiltre")
public class FilterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String jsonInput = new BufferedReader(new InputStreamReader(request.getInputStream()))
                .lines().collect(Collectors.joining());

        // Utilisation de Gson pour la SERDE
        Gson gson = new Gson();
        Type type = new TypeToken<Map<String, Object>>(){}.getType();
        Map<String, Object> inputMap = gson.fromJson(jsonInput, type);

        JsonArray filtersJsonArray = gson.toJsonTree(inputMap.get("filters")).getAsJsonArray();


        //Instance de classe de Filtres
        FiltresArticles filtresArticles = new FiltresArticles();
        //Liste qui contiendra les filtres a appliquer
        List<FiltreArticle> filters = new ArrayList<>();

        //On passe à travers la liste JSON qui contient les filtres à appliquer et les paramètres
        for (int i = 0; i < filtersJsonArray.size(); i++) {
            JsonObject filterJson = filtersJsonArray.get(i).getAsJsonObject();
            String filterType = filterJson.get("type").getAsString();

            //Pour chaque type de filtre, on ajoute le filtre paramétré à la liste
            switch (filterType) {
                case "price":
                    if(filterJson.has("min") && filterJson.has("max")) {
                        double minPrice = filterJson.get("min").getAsDouble();
                        double maxPrice = filterJson.get("max").getAsDouble();
                        filters.add(filtresArticles.filterByPriceRange(minPrice, maxPrice));
                    }
                    break;
                case "size":
                    if(filterJson.has("min") && filterJson.has("max")) {
                        double minSize = filterJson.get("min").getAsDouble();
                        double maxSize = filterJson.get("max").getAsDouble();
                        filters.add(filtresArticles.filterBySizeRange(minSize, maxSize));
                    }
                    break;
                case "difficulty":
                    if(filterJson.has("min") && filterJson.has("max")) {
                        int minDifficulty = filterJson.get("min").getAsInt();
                        int maxDifficulty = filterJson.get("max").getAsInt();
                        filters.add(filtresArticles.filterByDifficultyRange(minDifficulty, maxDifficulty));
                    }
                    break;
                case "occasion":
                    if(filterJson.has("value")) {
                        String occasion = filterJson.get("value").getAsString();
                        filters.add(filtresArticles.filterByOccasion(occasion));
                    }
                    break;
                case "category":
                    if(filterJson.has("value")) {
                        String category = filterJson.get("value").getAsString();
                        filters.add(filtresArticles.filterByCategorie(category));
                    }
                    break;
                default:
                    break;
            }
        }


        List<Article> articles = ArticleDAO.getInstance().findAll();  // Liste initiale du catalogue

        //On utilise le stream API pour filtrer rapidement selon tous les critères de sélection appliqués
        List<Article> filteredArticles = articles.stream()
                .filter(article -> filters.stream().allMatch(filter -> filter.test(article)))
                .collect(Collectors.toList());

        // on va retourner la liste en JSON et creer le
        // html coté client


        String json = new Gson().toJson(filteredArticles);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}

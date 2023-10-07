package com.book.tpa10bookstore.filtre;

import com.book.tpa10bookstore.dao.ArticleDAO;
import com.book.tpa10bookstore.modele.Article;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Cette servlet permet le filtrage initial des articles par catégorie
 */
@WebFilter("/catalogue.jsp")
public class FiltreBase implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {


        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String action = (String) request.getSession().getAttribute("action");
        ArticleDAO articleDAO = ArticleDAO.getInstance();
        List<Article> listeArticleFiltre = null;

        if (action.equals("all")) {
            listeArticleFiltre = articleDAO.findAll();
            request.setAttribute("listeArticleFiltre", listeArticleFiltre);


        } else if(action.equals("personnalise")) {
            response.sendRedirect("demandes-speciales.jsp");
        } else {
        listeArticleFiltre = articleDAO.findByCategorie(action);
        request.setAttribute("listeArticleFiltre", listeArticleFiltre);
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}

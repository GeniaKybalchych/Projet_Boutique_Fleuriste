package com.book.tpa10bookstore.filtre;

import com.book.tpa10bookstore.dao.ClientDAO;
import com.book.tpa10bookstore.modele.Client;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.regex.Pattern;

public class FiltreCreation implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String action = httpRequest.getParameter("action");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        ClientDAO clientDAO = ClientDAO.getInstance();
        Client existingClient = clientDAO.findByUsername(username);

        if (existingClient != null) {
            // Vérification si le nom d'utilisateur ou le mot de passe existe déjà, sauf si le client souhaite conserver les mêmes informations
            HttpSession session = httpRequest.getSession();
            Client client = (Client) session.getAttribute("client");
            if (client == null || (!username.equals(client.getUsername()) && !password.equals(client.getPassword()))) {
                request.setAttribute("errMsg", "Le nom d'utilisateur ou le mot de passe est déjà utilisé");
                redirectToPage(request, response, determinePage(action));
                return;
            }
        }


        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
    private void redirectToPage(ServletRequest request, ServletResponse response, String page) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(page);
        rd.include(request,response);
    }

    private String determinePage(String action) {
        return "create".equals(action) ? "creationCompte2.jsp" : "modifierClient.jsp";
    }
}
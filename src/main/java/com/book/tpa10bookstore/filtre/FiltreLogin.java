package com.book.tpa10bookstore.filtre;

import com.book.tpa10bookstore.dao.ClientDAO;
import com.book.tpa10bookstore.modele.Client;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;

public class FiltreLogin implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

            String userName = request.getParameter("username");
            String password = request.getParameter("password");
            ClientDAO clientDAO = ClientDAO.getInstance();
                // vérifiez si les informations d'identification existent dans la BD
                if (clientDAO.findByUsername(userName)==null) { // Vous devez remplacer checkUserInDB par votre méthode de vérification réelle
                    request.setAttribute("errMsg","Les informations d'identification fournies ne correspondent à aucun compte existant");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.include(request,response);
                }else if(!clientDAO.findByUsername(userName).getPassword().equals(password)){  // vérification du mot de passe
                    request.setAttribute("errMsg","Le mot de passe entré est incorrect");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.include(request,response);

                }
                else {
                    chain.doFilter(request,response);
                }
            }



    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
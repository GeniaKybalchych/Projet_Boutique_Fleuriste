<%--
  Created by IntelliJ IDEA.
  User: Askeladd
  Date: 2023-06-12
  Time: 1:50 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="./images/assets/css/catalogue.css" rel="stylesheet">
    <title>Catalogue</title>

</head>
<html>
<jsp:include page="header.jsp" /> <!-- le header se trouve dans le fichier -->

<body>

<div style="padding-top: 10vh;">
    <button class="btn filter-button" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
            aria-controls="offcanvasScrolling" style="position: fixed; right: 20px; top: 50%;">
        <img src="${pageContext.request.contextPath}/images/filter-square.svg" style="width: 75%;">
    </button>
    <button class=" filter-button-floating" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
            aria-controls="offcanvasScrolling">
            <img src="${pageContext.request.contextPath}/images/filter-square.svg" style="width: 75%; ">
    </button>

    <div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1"
         id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel" style="max-width: 40vw;">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Faire une recherche</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <form id="filterForm">
                <div class="mb-3">
                    <label for="price" class="form-label">Plage de prix</label>
                    <select id="price" name="price" class="form-select">
                        <option value="">Tous</option>
                        <option value="0-100">Moins de 100$</option>
                        <option value="100-200">Entre 100$ et 200$</option>
                        <option value="200-999">200$ et plus</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="size" class="form-label">Plage de taille</label>
                    <select id="size" name="size" class="form-select">
                        <option value="">Toutes</option>
                        <option value="0-20">Moins de 20 cm</option>
                        <option value="20-50">20 à 50 cm</option>
                        <option value="50-150">50 à 150 cm</option>
                        <option value="150-999">150 cm et plus</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="difficulty" class="form-label">Plage de difficulté</label>
                    <select id="difficulty" name="difficulty" class="form-select">
                        <option value="">Toutes</option>
                        <option value="1-3">Facile</option>
                        <option value="4-7">Modérée</option>
                        <option value="7-10">Difficile</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="occasion" class="form-label">Occasion :</label>
                    <select id="occasion" name="occasion" class="form-select">
                        <option value="">Tous</option>
                        <option value="Anniversaire">Anniversaire</option>
                        <option value="Bon Rétablissement">Bon Rétablissement</option>
                        <option value="Mariage">Mariage</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="category" class="form-label">Catégorie :</label>
                    <select id="category" name="category" class="form-select">
                        <option value="">Toutes</option>
                        <option value="bouquet">Bouquets</option>
                        <option value="plantes">Plantes</option>
                        <option value="vases">Vases</option>
                        <option value="livres">Livres</option>
                        <option value="occasions">Occasions</option>
                        <option value="demandes-speciales">Demandes spéciales</option>
                    </select>
                </div>

                <input type="button" value="Rechercher" onclick="applyFilters()" class="btn-custom">
            </form>
        </div>
    </div>
</div>

<style>
    #articlesContainer {
        display: grid;
        grid-gap: 15px;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    }

    @media screen and (min-width: 576px) {
        #articlesContainer {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media screen and (min-width: 768px) {
        #articlesContainer {
            grid-template-columns: repeat(3, 1fr);
        }
    }

    @media screen and (min-width: 992px) {
        #articlesContainer {
            grid-template-columns: repeat(4, 1fr);
        }
    }
    .card {
        display: flex;
        flex-direction: column;
        min-height: 100%;
    }
    .price {
        font-size: 1.25em;
        font-weight: bold;
        color: #f57c00; /* Example of orange color */
    }

    .price-container {
        margin-bottom: 20px; /* Or whatever fixed distance you want */
    }
</style>

<div class="container my-3" style="width: 100vw;">
    <div id="articlesContainer">
        <c:forEach var="article" items="${listeArticleFiltre}">
            <div class="card">
                <img src="${article.imgPath}" class="card-img-top" alt="${article.nomArticle}">
                <div class="card-body d-flex flex-column justify-content-between">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="card-title">${article.nomArticle}</h5>
                        <span class="badge bg-dark-subtle">${article.categorie}</span>
                    </div>
                    <div class="mt-auto">
                        <div class="price-container">
                            <p class="card-text"><span class="price">${String.format("%.2f$", article.prix)}</span></p>
                        </div>
                        <div class="d-flex flex-column align-items-stretch">
                            <div id="buttonGroup_${article.id}" class="btn-group w-100 mb-1" role="group">
                                <button type="button" class="btn btn-custom w-100" id="addToCart_${article.id}" onclick="addToCart('${article.id}')">Ajouter au panier</button>
                            </div>
                            <form action="article.jsp" method="post">
                                <input type="hidden" name="productId" value="${article.id}">
                                <button type="submit" class="btn btn-custom btn-block w-100">Détails</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>



<jsp:include page="footer.jsp" /> <!-- le footer se trouve dans le fichier footer.jsp-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="./scripts/CatalogScript.js" ></script>
</body>
</html>

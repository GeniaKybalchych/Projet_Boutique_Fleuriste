<%--
  Created by IntelliJ IDEA.
  User: Tima
  Date: 2023-06-30
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Article</title>

    <link href="./assets/css/header.css" rel="stylesheet">
    <link href="./assets/css/footer.css" rel="stylesheet">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>

<body>
<jsp:include page="header.jsp" />  <!-- le header se trouve dans le fichier -->
<br><br><br><br><br>
<main class="form-signin w-100 m-auto">



    <div class="container ">

        <div class=" container py-4">
            <div class="pb-3 mb-4 border-bottom" >
                <h2 class="fs-4"> ${article.nomArticle} </h2>
            </div>
        </div>

        <div class="row">

            <div class="col-md-6  mb-5  mt-5 mb-5">

                <img src="${article.imgPath}" alt="${article.nomArticle}" class="img-fluid">
            </div>
            <div class="col-md-6 mt-5 mb-5 ">
                <h2 class="fs-4"> Caratéristiques</h2>
                <ul>
                    <li>${article.prix}</li>
                    <li>${article.taille}</li>
                    <li>${article.categorie}</li>
                    <li>${article.difficulteEntretien}</li>
                    <li>${article.occasion}</li>
                </ul>

                <h2 class="fs-4 "> Description </h2>
                <p>${article.description}</p>

            </div>

            <div class="row mt-4 ">
                <div class="col-md-12 d-flex justify-content-center mt-5 mb-5">
                    <div id="buttonGroup_${article.id}" class=" " role="group">
                        <button type="button"  class="btn btn-outline-success" id="addToCart_${article.id}"
                                onclick="addToCart('${article.id}')">Ajouter au panier</button>
                        <button href="/catalogue.jsp"  class="btn btn-outline-success">Retour au catalogue</button>
                    </div>


                </div>
            </div>
        </div>

    </div>

</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/scripts/CatalogScript.js" ></script>

</body>
</html>

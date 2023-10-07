<%--
  Created by IntelliJ IDEA.
  User: Askeladd
  Date: 2023-06-12
  Time: 8:57 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>Profil Client</title>

    <link href="${pageContext.request.contextPath}/images/assets/css/checkout.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/images/assets/css/Style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/images/assets/css/footer.css">
    <style>
        /* Ajoutez votre style CSS personnalisé ici */

        body {
            padding-top: 60px;
        }

        h1 {
            margin-top: 30px;
        }

        .card {
            margin-top: 20px;
            background-color: rgba(108, 156, 115, 0.0); /* Couleur de fond semi-transparente */
        }

        .card-header {
            background-color: rgba(108, 156, 115, 0.0); /* Couleur de fond semi-transparente */        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            margin-bottom: 20px;
        }

        .card-text {
            margin-bottom: 10px;
        }

        .custom-table {
            background-color: rgba(108, 156, 115, 0.0);/* Remplacez cette valeur par la couleur verte souhaitée */
        }



    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container">
    <div class="row">
        <div class="col-lg-8 offset-lg-2">
            <div class="card">
                <div class="card-header">
                    <h1 class="text-center">Profil Client</h1>
                </div>
                <div class="card-body">
                    <h2>Informations Personnelles</h2>
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Nom:</strong> ${client.nom}, ${client.prenom}</p>
                            <p><strong>Email:</strong> ${client.courriel}</p>
                            <p><strong>Téléphone:</strong> ${client.telephone}</p>
                        </div>
                    </div>

                    <h2>Adresse</h2>
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Rue:</strong> ${client.adresse.rue}</p>
                            <p><strong>Ville:</strong> ${client.adresse.ville}</p>
                            <p><strong>Code Postal:</strong> ${client.adresse.codePostal}</p>
                        </div>
                    </div>

                    <h2>Historique de Commande</h2>
                    <table class="custom-table">
                        <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="commande" items="${client.historiqueCommande}">
                            <tr>
                                <td>${commande.id}</td>
                                <td>${commande.dateCommande}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="text-center">
                        <button class="btn btn-success" onclick="location.href='modifierClient2.jsp'">Modifier</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</body>
</html>
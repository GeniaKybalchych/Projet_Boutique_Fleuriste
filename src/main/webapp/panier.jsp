<%--
  Created by IntelliJ IDEA.
  User: eugen
  Date: 2023-06-06
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .container {
            min-height: 100%;
            position: relative;
            padding-bottom: 50px; /* Adjust this value to match the height of your footer */
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 90px; /* Adjust this value based on your footer's height */
            background-color: #f5f5f5; /* Set your desired background color */
        }
    </style>
    <title>Panier</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity=
            "sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/Images/assets/css/creationCompte.css" rel="stylesheet">
<%--    <link href="${pageContext.request.contextPath}/assets/css/Style.css" rel="stylesheet">--%>
</head>
<body>
<jsp:include page="header.jsp" /> <!-- le header se trouve dans le fichier -->
<br><br><br>
<div class="container">
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Votre Panier</th>
            <th scope="col"> </th>
            <th scope="col"></th>
            <th> Quantité</th>
            <th scope="col">Prix</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="article" items="${articles}">
            <tr>
                <td>
                    <img src="${article.article.imgPath}" class="rounded" style="max-height: 16vh;">
                </td>
                <td class="align-middle">${article.article.nomArticle}</td>
                <td class="align-middle">${article.article.description}</td>
                <td class="align-middle">${article.quantity}</td>
                <td class="align-middle">
                <span id="total-${article.article.id}" class="font-weight-bold">
                  <fmt:formatNumber value="${article.quantity * article.article.prix}" type="currency"
                                    currencySymbol="$" maxFractionDigits="2"/>
                </span>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4"></td>
            <td>
                <div class="row">
                    <div class="col-8">
                        <strong>Subtotal: </strong>
                    </div>
                    <div class="col-4 text-right">
                        <span id="subtotal" class="font-weight-bold"></span>$
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4"></td>
            <td>
                <div class="row">
                    <div class="col-8">
                        <strong>Total after Taxes: </strong>
                    </div>
                    <div class="col-4 text-right">
                        <span id="totalAfterTaxes" class="font-weight-bold"></span>$
                    </div>
                </div>
            </td>
        </tr>
    </tbody>
</table>
    <div class="container text-center">
    <button class="btn-custom" onclick="checkout()">Payer la facture</button>
    </div>
</div>

<jsp:include page="footer.jsp" /> <!-- le footer se trouve dans le fichier footer.jsp-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/scripts/PanierScript.js" ></script>
</body>
</html>

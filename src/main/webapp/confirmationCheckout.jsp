<%--
  Created by IntelliJ IDEA.
  User: Tima
  Date: 2023-06-30
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Confirmation de commande</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link href="${pageContext.request.contextPath}/Images/assets/css/checkout.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/Images/assets/css/footer.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/Images/assets/css/header.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" /> <!-- le header se trouve dans le fichier -->
<br><br><br><br><br><br>
<div class="container">


  <div class="d-flex justify-content-center">
    <p>
    <h2 class="h3 mb-3 mt-5 fw-medium text-uppercase fs-4">✨ Confirmation de commande ✨</h2>
    </p>
  </div>

  <div class="alert alert-success mt-4">
    <p class="text-justify text-break fs-5 lh-lg">
      Un immense merci pour votre récente commande sur notre boutique en ligne !<br>
      Votre confiance et votre soutien font fleurir notre cœur de joie.
      Nous tenons à vous informer que votre paiement a été reçu avec gratitude.
      Votre commande sera dorlotée avec tout notre amour et expédiée dans les plus brefs délais.<br>
      Si vous avez la moindre question ou la moindre demande spéciale, notre équipe chaleureuse est à votre disposition.
      Nous mettons un point d'honneur à vous offrir un service personnalisé.<br>
      Encore une fois, un grand merci de nous avoir choisi pour fleurir votre quotidien.<br>
      Avec toute notre reconnaissance, xoxo
    </p>

  </div>
  <div class="d-flex justify-content-center mt-5 mb-5">
    <a class="btn btn-primary mt-4" href="index.jsp">Retour à l'accueil</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a class="btn btn-primary mt-4"href="ma facture.pdf">&nbsp;&nbsp;Ma facture&nbsp;&nbsp;</a><!-- Lien pour retourner à la page d'accueil -->
  </div>
</div>
<jsp:include page="footer.jsp" /> <!-- le footer se trouve dans le fichier footer.jsp-->
<!-- Inclure ici les liens vers les fichiers JavaScript de Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>


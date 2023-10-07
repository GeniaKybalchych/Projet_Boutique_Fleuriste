<%--
  Created by IntelliJ IDEA.
  User: Askeladd
  Date: 2023-06-21
  Time: 7:58 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">


<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <link href="images/assets/css/footer.css" rel="stylesheet">
    <link href="images/assets/css/header.css" rel="stylesheet">

    <title>Demandes Spéciales</title>
</head>

<body>
<header class="mb-5">
    <jsp:include page="header.jsp" /> <!-- le header se trouve dans le fichier -->
</header>
<br><br><br>

<div class="d-flex justify-content-center">
    <p>
    <h2 class="h3 mb-3 mt-5 fw-medium text-uppercase text-center fs-4">Formulaire de Consultation Créative<br>
    Un Monde de Fleurs à Votre Image</h2>
    </p>
</div>


<form class="form" name="SurMesureForm" method="post">
    <div class="container-xl">

        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">À propos de vous</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Vos besoins</label>
            <textarea class="form-control" id="exampleFormControlTextarea2" rows="3"
                      placeholder="Parlez-nous de l'occasion ou de l'événement pour lequel vous souhaitez le service sur mesure :
Quels sont vos principaux besoins et attentes pour cet arrangement floral personnalisé ?
Quelles sont vos motivations ou inspirations derrière ce choix floral ?"></textarea>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Vos préférences</label>
            <textarea class="form-control" id="exampleFormControlTextarea3" rows="4"
                      placeholder="Type d'arrangement souhaité (bouquet, centre de table, couronne, composition murale, etc.)
Style préféré (moderne, champêtre, romantique, minimaliste, etc.)
Couleurs préférées (tons pastel, couleurs vives, nuances de blanc, etc.)
Quels sont les éléments ou les thèmes importants à prendre en compte dans la conception de l'arrangement floral ?"></textarea>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Écoresponsabilité</label>
            <textarea class="form-control" id="exampleFormControlTextarea4" rows="1"
                      placeholder="Avez-vous des préférences en termes d'écoresponsabilité ? (Fleurs de saison, fleurs cultivées localement, matériaux recyclables, etc.) :"></textarea>
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Détails supplémentaire</label>
            <textarea class="form-control" id="exampleFormControlTextarea5" rows="5"
                      placeholder="Y a-t-il des fleurs ou des plantes spécifiques que vous souhaitez inclure ou éviter ?
Avez-vous des préférences en termes de contenant (vase, pot, support) ?
Avez-vous des directives particulières concernant la présentation ou le style de l'arrangement ?
Y a-t-il des éléments supplémentaires que vous souhaitez inclure, tels que des accessoires, des rubans, etc. ?
Y a-t-il des contraintes spécifiques à prendre en compte (allergies, espaces restreints, etc.) ?"></textarea>
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Votre bugdet</label>
            <input type="text" class="form-control" id="exampleFormControlTextarea6" rows="3">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Commentaires</label>
            <textarea class="form-control" id="exampleFormControlTextarea7" rows="3"></textarea>
        </div>

        <div class="d-flex justify-content-center mt-5 mb-5">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Envoyer ma demande
        </button>

        <!-- Modal -->
        <div class="modal fade   " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h1 class="modal-title fs-5 text-center" id="exampleModalLabel">💌 Demande bien Reçue !</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body ">
                        Un grand merci d'avoir soumis votre demande de service sur mesure !<br>
                        Votre confiance nous fait chaud au cœur. <br> Notre équipe passionnée plonge déjà dans
                        les détails fleuris de votre demande.<br> Nous serons en contact très rapidement pour échanger et peaufiner les moindres pétales de votre arrangement.
                    </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-outline-success" data-bs-dismiss="modal">Fermer</button>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</form>

<jsp:include page="footer.jsp" /> <!-- le footer se trouve dans le fichier footer.jsp-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>


</body>
</html>

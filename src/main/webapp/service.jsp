<%--
  Created by IntelliJ IDEA.
  User: Tima
  Date: 2023-07-01
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Nos services</title>
  <link rel="stylesheet" href="./images/assets/css/service.css" >

  <link rel="stylesheet" href="${pageContext.request.contextPath}/images/assets/css/footer.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>

<body>
<jsp:include page="header.jsp" />  <!-- le header se trouve dans le fichier -->
<br><br><br><br><br>
<main>

  <section class="py-5 text-center container ">
    <div class="row py-lg-5">
      <div class="col-lg-9 col-md-8 mx-auto">
        <h1 class="fw-light mb-3">Nos services</h1>
        <p class="lead text-body-secondary textSection">Bienvenue dans notre univers floral écoresponsable ! <br>
          Chez Fleuriste BdeB, nous sommes des amoureux de la nature et de la flore. Nous sommes fiers de vous proposer une sélection soigneusement choisie de plantes, de bouquets et de produits en lien avec notre merveilleux monde végétal. En accord avec nos valeurs, nous mettons l'écoresponsabilité au cœur de notre démarche.
          <br>Découvrez nos services sur mesure</p>

      </div>
    </div>
  </section>

  <div class="album py-5 bg-body-tertiary">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-2 g-3 d-flex">
        <div class="col">
          <div class="card shadow-sm h-100">

            <div class="card-body">
              <p class="card-text"> <h6 class="mb-3 text-uppercase">Vente de plantes</h6>  Nous vous offrons une large variété de plantes vertes, fleuries et exotiques, toutes sélectionnées avec soin pour leur beauté et leur durabilité. Que vous soyez à la recherche d'une plante d'intérieur pour égayer votre salon ou d'un spécimen rare pour votre collection, nous avons ce qu'il vous faut.</p>
              <div class="d-flex justify-content-between align-items-center">


              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm h-100">
            <div class="card-body">
              <p class="card-text"><h6 class="mb-3 text-uppercase">Bouquets écoresponsables</h6>  Nos fleuristes passionnés créent des bouquets uniques, conçus avec des fleurs de saison, locales et issues de l'agriculture biologique. Chaque bouquet est une véritable œuvre d'art qui émerveillera vos sens tout en respectant la nature. </p>
              <div class="d-flex justify-content-between align-items-center">
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm h-100">
            <div class="card-body">
              <p class="card-text"><h6 class="mb-3 text-uppercase">Vases et pots durables</h6> Nous avons sélectionné des vases et des pots de qualité, fabriqués à partir de matériaux durables tels que le verre recyclé, le bambou ou la céramique écoresponsable. Ils mettront en valeur vos plantes tout en reflétant votre engagement envers l'environnement.</p>
              <div class="d-flex justify-content-between align-items-center">
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm h-100">
            <div class="card-body">
              <p class="card-text"><h6 class="mb-3 text-uppercase ">Livraison respectueuse de l'environnement  </h6>Nous proposons un service de livraison écoresponsable, utilisant des véhicules écologiques ou favorisant les modes de transport doux. Ainsi, vous pouvez recevoir votre commande chez vous tout en contribuant à la préservation de notre planète.</p>
              <div class="d-flex justify-content-between align-items-center">

              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm h-100">
            <div class="card-body">
              <p class="card-text"><h6 class="mb-3 text-uppercase">Ateliers botaniques</h6>Vous souhaitez en apprendre davantage sur l'univers fascinant de la botanique ? Nous organisons régulièrement des ateliers où vous pourrez développer vos connaissances et vos compétences en matière de jardinage écologique. Que vous soyez débutant ou passionné, nos experts seront là pour vous guider.</p>
              <div class="d-flex justify-content-between align-items-center">

              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm h-100">
            <div class="card-body">
              <p class="card-text"><h6 class="mb-3 text-uppercase">Service sur mesure</h6> Nous comprenons que chaque client est unique. C'est pourquoi nous proposons un service personnalisé pour répondre à vos besoins spécifiques. Que ce soit pour un événement spécial, une décoration florale pour votre entreprise ou un cadeau personnalisé, notre équipe créative est là pour réaliser vos souhaits les plus exigeants.</p>
              <div class="d-flex justify-content-between align-items-center">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
  </div>

</main>


<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>

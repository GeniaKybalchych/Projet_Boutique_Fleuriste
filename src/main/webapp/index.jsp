<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en" data-bs-theme="auto">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <fmt:setLocale value="${sessionScope.langue}" />
    <fmt:setBundle basename="ApplicationResource" />
    <title><fmt:message key="page.title"/></title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="images/assets/css/Style.css" rel="stylesheet">
    <link href="images/assets/css/footer.css" rel="stylesheet">



    
    <!-- Custom styles -->
    <link href="images/assets/css/carousel.css" rel="stylesheet">
  </head>
  <body>

    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
      <symbol id="check2" viewBox="0 0 16 16">
        <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"></path>
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"></path>
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"></path>
        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"></path>
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"></path>
      </symbol>
    </svg>

    
 <!-- barre de navigation
  ================================================== -->

    <jsp:include page="header.jsp" /> <!-- le header se trouve dans le fichier -->

<main>

 <!-- carrousel de présentation
  ================================================== -->

  <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel" data-bs-theme="light">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
<%--        Dans une page JSP on met le path relatif au contexte par bonne pratque--%>
        <img src="${pageContext.request.contextPath}/images/Caroussel/C04.png" width="100%" height="100%" alt="Image de l'atelier d'un fleuriste">
        <div class="container">
          <div class="carousel-caption text-start">
            <h1><fmt:message key="caroussel.services.title"/></h1>
            <p class="opacity-75"><fmt:message key="caroussel.services.text"/></p>
            <p><a class="btn btn-lg btn-primary" href="service.jsp"><fmt:message key="button.readMore" /></a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img src="${pageContext.request.contextPath}/images/Caroussel/C02.png" class="bd-placeholder-img" width="100%" height="100%" alt="Image de fleur">
        <div class="container">
          <div class="carousel-caption">
            <h1><fmt:message key="caroussel.fleurs.title"/></h1>
            <p><fmt:message key="caroussel.fleurs.text"/></p>
            <p><a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/MagasinServlet?action=bouquet"><fmt:message key="button.discover"/></a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img src="${pageContext.request.contextPath}/images/Caroussel/C03.png" class="bd-placeholder-img" width="100%" height="100%" alt="Intérieur avec des plantes et une personne qui médite">
        <div class="container">
          <div class="carousel-caption text-end">
            <h1><fmt:message key="caroussel.plantes.title"/></h1>
            <p><fmt:message key="caroussel.plantes.text"/></p>
            <p><a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/MagasinServlet?action=plantes"><fmt:message key="caroussel.voir"/></a></p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden"><fmt:message key="button.previous"/></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden"><fmt:message key="button.next"/></span>
    </button>
  </div>
  


  <!-- filtres de catégories
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

<br><br>                                              <!-- faut revoir le style ici -->
  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
        <img src="<c:url value="/images/filtres/img1.png"/>" alt="Bouquet" width="140" height="140" />
        <h2 class="fw-normal"><fmt:message key="category.bouquets.title"/></h2>
        <p><fmt:message key="category.bouquets.description"/></p>
        <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/MagasinServlet?action=bouquet"><fmt:message key="button.shop"/> &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="<c:url value="/images/filtres/img2.png"/>" alt="Plantes" width="140" height="140"/>
        <h2 class="fw-normal"><fmt:message key="category.plantes.title"/></h2>
        <p><fmt:message key="category.plantes.description"/> </p>
        <p><a class="btn btn-secondary" href="MagasinServlet?action=plantes"><fmt:message key="button.shop"/> &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="<c:url value="/images/filtres/img3.png"/>" alt="contenant" width="140" height="140" />
        <h2 class="fw-normal"><fmt:message key="category.pots.title"/></h2>
        <p><fmt:message key="category.pots.description"/></p>
        <p><a class="btn btn-secondary" href="MagasinServlet?action=vases"><fmt:message key="button.shop"/> &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="<c:url value="/images/filtres/img6.png"/>" alt="livre" width="140" height="140"/>
        <h2 class="fw-normal"><fmt:message key="category.livres.title"/></h2>
        <p><fmt:message key="category.livres.description"/></p>
        <p><a class="btn btn-secondary" href="MagasinServlet?action=livres"><fmt:message key="button.shop"/> &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="<c:url value="/images/filtres/img4.png"/>" alt="Occasions" width="140" height="140" />
        <h2 class="fw-normal"><fmt:message key="category.occasions.title"/></h2>
        <p><fmt:message key="category.occasions.description"/></p>
        <p><a class="btn btn-secondary" href="MagasinServlet?action=occasions"><fmt:message key="button.shop"/> &raquo;</a></p>
      </div>
      <div class="col-lg-4">
        <img src="${pageContext.request.contextPath}/images/filtres/img5.png" alt="SurMesure" width="140" height="140" />
        <h2 class="fw-normal"><fmt:message key="category.surMesure.title"/></h2>
        <p><fmt:message key="category.surMesure.description"/></p>
        <p><a class="btn btn-secondary" href="MagasinServlet?action=personnalise"><fmt:message key="button.learnMore"/> &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
  </div>
</main>
    <jsp:include page="footer.jsp" /> <!-- le footer se trouve dans le fichier footer.jsp-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>

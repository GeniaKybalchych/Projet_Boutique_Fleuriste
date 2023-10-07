<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link href="${pageContext.request.contextPath}/images/assets/css/checkout.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/images/assets/css/footer.css" rel="stylesheet">

  <title>Creation</title>
</head>
<body class="bg-body-tertiary">
<jsp:include page="header.jsp" /> <!-- le header se trouve dans le fichier header.jsp-->

<div class="container" style="margin-top: 75px;>
  <div class="content mt-5 p-5">
    <main>
      <div class="d-flex justify-content-center"><p>
        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
          <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
          <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
        </svg>
      </p></div>
      <div class="py-3 text-center">

        <h2>Créer un compte</h2><br>
      </div>



      <div class="row g-3 justify-content-center ">

        <div class="col-md-7 col-lg-8">
          <form class="needs-validation" novalidate method="post" action="ClientServlet" name="CreateForm">
            <div class="col-12" style="color: red;">
              <c:if test="${not empty errMsg}">
                <c:out value="${errMsg}" />
              </c:if>
            </div>
            <div class="row g-3">
              <div class="col-sm-6">
                <label for="prenom" class="form-label">Prenom</label>
                <input type="text" class="form-control" id="prenom"  name="prenom" value="" pattern="[A-Za-z]{2,}" required>
                <div class="invalid-feedback">
                  Veuillez saisir votre prénom.
                </div>
              </div>

              <div class="col-sm-6">
                <label for="nom" class="form-label">Nom</label>
                <input type="text" class="form-control" id="nom" name="nom" placeholder="" value=""
                       pattern="[A-Za-z]{2,}"  required>
                <div class="invalid-feedback">
                  Veuillez saisir votre nom de famille.
                </div>
              </div>


              <div class="col-sm-6">
                <label for="email" class="form-label">Courriel </label>
                <input type="email" required class="form-control" id="email" name="email"
                       placeholder="application.web@bded.com" value="">
                <div class="invalid-feedback">
                  Veuillez saisir une adresse courriel valide.
                </div>
              </div>

              <div class="col-sm-6">
                <label for="telephone" class="form-label">Téléphone </label>
                <input type="tel" required class="form-control" pattern="^(\d{3}-\d{3}-\d{4}|\d{10})$" id="telephone" name="telephone"
                       placeholder="5144567890" value="">
                <div class="invalid-feedback">
                  Veuillez saisir un numéro de téléphone valide.
                </div>
              </div>

              <div class="col-12">
                <p style="font-size: 0.8em; color: green;">
                  ***Votre mot de passe doit contenir au moins une lettre minuscule, une lettre majuscule, un chiffre, un caractère spécial et 6 caractères de longueur.***
                </p>
              </div>

              <div class="col-sm-6">
                <label for="username" class="form-label">Username </label>
                <input type="username" minlength="1" required class="form-control" id="username" name="username"
                       placeholder="username" value="">
                <div class="invalid-feedback">
                  Veuillez saisir un username valide.
                </div>
              </div>


              <div class="col-sm-6">
                <label for="password" class="form-label">Mot de passe </label>
                <input type="password" required class="form-control" id="password" name="password"
                       placeholder="password" value="" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$">
                <div class="invalid-feedback">
                  Veuillez saisir un mot de passe valide.
                </div>
              </div>

              <div class="col-md-3">
                <label for="noCivique" class="form-label">No civique</label>
                <input type="text" class="form-control" id="noCivique" name="noCivique"
                       placeholder="7260  " pattern="\d+$" value="" required>
                <div class="invalid-feedback">
                  Veuillez saisir un numéro civique valide.
                </div>
              </div>

              <div class="col-md-9">
                <label for="address" class="form-label">Rue</label>
                <input type="text" class="form-control" id="address" name="rue"
                       placeholder="Rue Saint-Urbain " pattern="^[A-Za-z\u00C0-\u017F\s-]+$" value="" required>
                <div class="invalid-feedback">
                  Veuillez saisir un nom de rue valide.
                </div>
              </div>

              <div class="col-sm-6">
                <label for="address2" class="form-label">Complément d'adresse</label>
                <input type="text" class="form-control" id="address2" name="address2"
                       placeholder="Appartement, bureau, etc." value="">
              </div>

              <div class="col-sm-6">
                <label for="ville" class="form-label">Ville</label>
                <input type="text" pattern="^[A-Za-z\u00C0-\u017F\s-]+$" class="form-control" id="ville" name="ville"
                       placeholder="Montréal" value="" required>
                <div class="invalid-feedback">
                  Veuillez saisir un nom de ville valide.
                </div>
              </div>

              <div class="col-md-5">
                <label for="pays" class="form-label">Pays</label>
                <select class="form-select" id="pays" name="pays" value="" required>
                  <option value="">Sélectionner ...</option>
                  <option value="CA">Canada</option>
                  <option value="US">État-Unis</option>
                </select>
                <div class="invalid-feedback">
                  Veuillez choisir un pays.
                </div>
              </div>

              <div class="col-md-4">
                <label for="province" class="form-label">Province</label>
                <select class="form-select" id="province" name="province" value="" required>
                                <option value="Selectionner">Sélectionner ...</option>
                <option value="AL">Alberta</option>
                <option value="CB">Colombie-Britannique</option>
                <option value="IPE">Île-du-Prince-Édouard</option>
                <option value="MA">Manitoba</option>
                <option value="NB">Nouveau-Brunswick</option>
                <option value="NE">Nouvelle-Écosse</option>
                <option value="ON">Ontario</option>
                <option value="QC">Québec</option>
                <option value="SA">Saskatchewan</option>
                <option value="TNL">Terre-Neuve-et-Labrador</option>
                <option value="autre">autre</option>
                </select>
                <div class="invalid-feedback">
                  Veuillez choisir une province.
                </div>
              </div>

              <div class="col-md-3">
                <label for="codePostal" class="form-label">Code postal</label>
                <input type="text" class="form-control" id="codePostal" name="codePostal"
                       placeholder="H2R 2Y6" pattern="[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d" value="" required>
                <div class="invalid-feedback">
                  Veuillez choisir un code postal valide avec un espace entre les deux parties du code postal.
                </div>
              </div>
            </div>

            <hr class="my-4">

            <button class="w-100 btn btn-primary btn-lg" type="submit">Créer un compte</button>
            <input type="hidden" name="action" value="create">
          </form>
        </div>
      </div>
    </main>
  </div>
</div>
<jsp:include page="footer.jsp" /> <!-- le footer se trouve dans le fichier footer.jsp-->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="./scripts/checkout.js"></script>
</body>
</html>

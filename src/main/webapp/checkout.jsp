<%--
  Created by IntelliJ IDEA.
  User: eugen
  Date: 2023-06-06
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">



    <link href="${pageContext.request.contextPath}/Images/assets/css/checkout.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/Images/assets/css/footer.css" rel="stylesheet">

    <title>Checkout</title>
</head>
<body class="bg-body-tertiary">
<jsp:include page="header.jsp" /> <!-- le header se trouve dans le fichier header.jsp-->

<div class="container">
    <div class="content mt-4 p-3">
    <main>
        <div class="py-5 text-center">

            <h2>Passer votre commande</h2><br>
            <p class="lead justify-content-between"> Vous avez choisi notre fleuriste écoresponsable,
                et nous sommes super heureux ! <br>
                Poursuivez cette aventure florale en finalisant votre commande d'un simple clic. <br>
                Nous avons hâte de préparer votre commande avec soin et amour &#128522; &#127802;
            </p>
        </div>

        <div class="row g-5 justify-content-center ">

            <div class="col-md-7 col-lg-8">
                <h4 class="mb-3">Formulaire de facturation</h4>
                <form class="needs-validation" novalidate method="post" action="CheckoutServelet" name="CheckoutForm">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label for="prenom" class="form-label">Prenom</label>
                            <input type="text" class="form-control" id="prenom"  name="prenom" value="${client.prenom}" pattern="[A-Za-z]{2,}" required>
                            <div class="invalid-feedback">
                                Veuillez saisir votre prénom.
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label for="nom" class="form-label">Nom</label>
                            <input type="text" class="form-control" id="nom" name="nom" placeholder="" value="${client.nom}"
                                   pattern="[A-Za-z]{2,}"  required>
                            <div class="invalid-feedback">
                                Veuillez saisir votre nom de famille.
                            </div>
                        </div>



                        <div class="col-12">
                            <label for="email" class="form-label">Courriel </label>
                            <input type="email" required class="form-control" id="email" name="email"
                                   placeholder="application.web@bded.com" value="${client.courriel}">
                            <div class="invalid-feedback">
                                Veuillez saisir une adresse courriel valide.
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="noCivique" class="form-label">No civique</label>
                            <input type="text" class="form-control" id="noCivique" name="noCivique"
                                   placeholder="7260  " pattern="\d+$" value="${client.adresse.noCivique}" required>
                            <div class="invalid-feedback">
                                Please enter your shipping address.
                            </div>
                        </div>

                        <div class="col-md-9">
                            <label for="address" class="form-label">Addresse</label>
                            <input type="text" class="form-control" id="address" name="address"
                                   placeholder="7260 Rue Saint-Urbain " pattern="[\w\s\p{P}]{2,}" value="${client.adresse.rue}" required>
                            <div class="invalid-feedback">
                                Please enter your shipping address.
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="address2" class="form-label">Addresse  <span class="text-body-secondary">(complementaire)</span></label>
                            <input type="text" class="form-control" id="address2" name="address2"
                                   placeholder="Appartement, bureau, etc." value="${client.adresse.complementAdresse}">
                        </div>

                        <div class="col-md-5">
                            <label for="pays" class="form-label">Pays</label>
                            <select class="form-select" id="pays" name="pays" value="${client.adresse.pays}" required>
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
                            <select class="form-select" id="province" name="province" value="${client.adresse.province}" required>
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
                                   placeholder="H2R 2Y6" pattern="[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d" value="${client.adresse.codePostal}" required>
                            <div class="invalid-feedback">
                                Veuillez choisir un code postal valide avec un espace entre les deux parties du code postal.
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">



                    <h4 class="mb-3">Paiement</h4>

                    <div class="my-3">
                        <div class="form-check">
                            <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
                            <label class="form-check-label" for="credit" value="credit">Carte de crédit</label>
                        </div>
                        <div class="form-check">
                            <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
                            <label class="form-check-label" for="debit" value="debit">Carte de débit</label>
                        </div>

                    </div>

                    <div class="row gy-3">
                        <div class="col-md-6">
                            <label for="nomCarte" class="form-label">Nom</label>
                            <input type="text" class="form-control" id="nomCarte" name="nomCarte" placeholder="" required>
                            <small class="text-body-secondary">nom complet figurant sur la carte</small>
                            <div class="invalid-feedback">
                                Veuillez saisir le nom figurant sur la carte.
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="numeroCarte" class="form-label">Numéro de carte</label>
                            <input type="text" class="form-control" id="numeroCarte" name="numeroCarte" placeholder="0000000000000000" pattern="\d{16}" required>
                            <div class="invalid-feedback">
                                Veuillez saisir un numéro de carte valide.
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="dateExpiration" class="form-label">Expiration</label>
                            <input type="text" class="form-control" id="dateExpiration" name="dateExpiration" placeholder="MM/AAAA" pattern="(0[1-9]|1[0-2])\/\d{4}" required>
                            <div class="invalid-feedback">
                                Veuillez saisir une date d'expiration valide.
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="cvv" class="form-label">CVV</label>
                            <input type="text" class="form-control" id="cvv" name="cvv" placeholder="123"pattern="\d{3}" required>
                            <div class="invalid-feedback">
                                Veuillez saisir un numéro valide.
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <button class="w-100 btn btn-primary btn-lg" type="submit">Payer</button>
                </form>
            </div>
        </div>
    </main>
</div>
</div>
<jsp:include page="footer.jsp" /> <!-- le footer se trouve dans le fichier footer.jsp-->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/scripts/checkout.js"></script>
</body>


</html>

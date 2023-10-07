<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Page de Connexion</title>
    <link href="${pageContext.request.contextPath}/Images/assets/css/Style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Images/assets/css/creationCompte.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>

<body>
<jsp:include page="header.jsp" />  <!-- le header se trouve dans le fichier -->
<br><br><br><br><br>
<main class="form-signin w-100 m-auto position-absolute top-50 start-50 translate-middle">


    <div class="d-flex justify-content-center"><p>
        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
        </svg>
    </p></div>

    <div class="d-flex justify-content-center">
        <p>
            <h1 class="h3 mb-3 fw-normal">Connectez-vous</h1>
        </p>
    </div>

    <form class="form" name="loginForm" id="loginForm" action="LoginServlet" method="post">
        <div class="form-floating">
            <input type="text" class="form-control" id="username" name="username" placeholder="name@example.com" >
            <label for="username">Nom d'utilisateur</label>
        </div>

        <div class="form-floating">
            <input type="password" class="form-control" id="password" name="password" placeholder="password">
            <label for="password">Mot de passe</label>
        </div>

        <button class="btn btn-primary w-100 py-2" type="submit">Se connecter</button>

        <p id="error-message" style="color: red; display: none;">Veuillez remplir tous les champs</p>
    </form>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const username = document.getElementById('username').value.trim(); // Trim whitespace from username
            const password = document.getElementById('password').value;

            if (!username || !password) {
                document.getElementById('error-message').style.display = 'block';
                return;
            }

            fetch('LoginServlet', {
                method: 'POST',
                body: new URLSearchParams({
                    username: username,
                    password: password
                })
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    } else {
                        return response.text();
                    }
                })
                .then(responseText => {
                    if (responseText === 'success') {
                        // Redirect to profil.jsp or wherever you want
                        window.location.href = 'profil.jsp';
                        showAlert(username);
                    } else {
                        // Show error message or handle unsuccessful login
                        document.getElementById('error-message').innerText = 'Nom d\'utilisateur ou mot de passe incorrect.';
                        document.getElementById('error-message').style.display = 'block';
                    }
                })
                .catch(error => {
                    console.log('There was a problem with the fetch operation: ' + error.message);
                });
        });

        function showAlert(username) {
            setTimeout(() => {
                alert('Bonjour ' + username);
            }, 0);
        }
    </script>

</main>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
</body>
</html>
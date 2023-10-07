function deconnexion() {
    fetch('LogoutServlet', {
        method: 'GET',
    })
        .then(response => {
            if (response.status === 409) {
                // If the server responds with a 409 Conflict status, alert the user they are not connected
                alert("Vous n'êtes pas connecté");
            } else if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            } else if (response.ok) {
                localStorage.clear(); // clear local storage
                alert("Déconnecté avec succès");
                window.location.href = 'login.jsp';
            }
        })
        .catch(e => {
            console.log('There was a problem with the fetch operation: ' + e.message);
        });
}

function sendCartContent() {
    let cart = JSON.parse(localStorage.getItem('cart')) || {};
    fetch('/PanierServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(cart)
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("HTTP error " + response.status);
            }
            // Redirect to panier.jsp when the server response is successful
            window.location.href = '/panier.jsp';
        })
        .catch(e => {
            console.log("Error: " + e);
        });
}

// cart.js

document.addEventListener('DOMContentLoaded', (event) => {
    updateCartDisplay();
});

function updateCartDisplay() {
    const cart = JSON.parse(localStorage.getItem('cart')) || {};
    const itemCount = Object.values(cart).reduce((a, b) => a + b, 0);
    const cartItemCountElement = document.querySelector('.badge.text-bg-danger');
    const cartBtn = document.getElementById('cartIcon');

    cartItemCountElement.textContent = itemCount;

    if (itemCount > 0) {
        cartBtn.style.display = 'block';
    } else {
        cartBtn.style.display = 'none';
    }
}



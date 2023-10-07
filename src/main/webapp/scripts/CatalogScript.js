let bsOffcanvas;
document.addEventListener('DOMContentLoaded', (event) => {
    let offcanvasElement = document.getElementById('offcanvasScrolling');
    bsOffcanvas = new bootstrap.Offcanvas(offcanvasElement);

    if(!localStorage.getItem('cart')) {

    document.getElementById('cartIcon').style.display = 'none';
    }
});

// function sendCartContent() {
//     let cart = JSON.parse(localStorage.getItem('cart')) || {};
//     fetch('/PanierServlet', {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json'
//         },
//         body: JSON.stringify(cart)
//     })
//         .then(response => {
//         if (!response.ok) {
//             throw new Error("HTTP error " + response.status);
//         }
//         // Redirect to panier.jsp when the server response is successful
//         window.location.href = '/panier.jsp';
//     })
//         .catch(e => {
//         console.log("Error: " + e);
//     });
// }

function initializeCart() {
    let cart = JSON.parse(localStorage.getItem('cart')) || {};
    for (let articleId in cart) {
        updateAddToCartButton(articleId, cart[articleId]);
    }
        updateCartDisplay();
}
window.onload = initializeCart;

function addToCart(articleId) {
    // Get the current cart from localStorage
    let cart = localStorage.getItem('cart');

    // If the cart doesn't exist, create a new object
    if (!cart) {
        cart = {};
    } else {
        // If the cart does exist, parse it into a JavaScript object
        cart = JSON.parse(cart);
    }

    // Convert the articleId to a string
    const articleIdStr = articleId.toString();

    // If the article is already in the cart, increment its quantity
    if (cart[articleIdStr]) {
        cart[articleIdStr] ++;
    } else {
        // If the article is not in the cart, add it with a quantity of 1
        cart[articleIdStr] = 1;
    }

    // Save the updated cart back to localStorage as a JSON string
    localStorage.setItem('cart', JSON.stringify(cart));

    updateAddToCartButton(articleId, cart[articleIdStr]);
    updateCartDisplay();

}

function updateAddToCartButton(articleId, quantity) {
    var button = document.getElementById(`buttonGroup_` + articleId);
    button.outerHTML =
        `<div id="buttonGroup_${articleId}" class="input-group w-100 mb-1">
    <button class="btn btn-custom" onclick="decrementFromCart('${articleId}')">-</button>
    <input id="quantity_${articleId}" type="text" class="form-control" value="${quantity}" readonly>
    <button class="btn btn-custom " onclick="increaseQuantity('${articleId}')">+</button>
</div>`;
}

function increaseQuantity(articleId) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    const articleIdStr = articleId.toString();

    cart[articleIdStr]++;
    localStorage.setItem('cart', JSON.stringify(cart));

    let input = document.getElementById(`quantity_${articleId}`);
    input.value = cart[articleIdStr];
    updateCartDisplay();
}

function decrementFromCart(articleId) {
    let cart = JSON.parse(localStorage.getItem('cart')) || {};
    const articleIdStr = articleId.toString();
    if (cart[articleIdStr]) {
        --cart[articleIdStr] ;
        if (cart[articleIdStr] <= 0) {
            Object.keys(cart).forEach(key => {
                if (key === articleIdStr) {
                    delete cart[key];
            revertAddToCartButton(articleId);
                }
            });
        } else {
            updateAddToCartButton(articleId, cart[articleIdStr]);
        }
    }
    localStorage.setItem('cart', JSON.stringify(cart));
    updateCartDisplay();
}

function revertAddToCartButton(articleId) {
    const buttonGroup = document.getElementById(`buttonGroup_${articleId}`);
    buttonGroup.outerHTML =
        `<button type="button" id="buttonGroup_${articleId}" class="btn btn-custom w-100 mb-1" 
                onclick="addToCart('${articleId}')">Ajouter au panier</button>`;
    updateCartDisplay()
}

function applyFilters() {
    // Récupérer les valeur des différents filtres
    var price = document.getElementById('price').value.split('-');
    var size = document.getElementById('size').value.split('-');
    var difficulty = document.getElementById('difficulty').value.split('-');
    var occasion = document.getElementById('occasion').value;
    var category = document.getElementById('category').value;

    // Preparer le JSON request body
    var filters = [];

    // Ajout des filtres s'ils sont valides
    if(price[0] && price[1]) {
        filters.push({type: "price", min: price[0], max: price[1]});
    }
    if(size[0] && size[1]) {
        filters.push({type: "size", min: size[0], max: size[1]});
    }
    if(difficulty[0] && difficulty[1]) {
        filters.push({type: "difficulty", min: difficulty[0], max: difficulty[1]});
    }
    if(occasion) {
        filters.push({type: "occasion", value: occasion});
    }
    if(category) {
        filters.push({type: "category", value: category});
    }

    fetch('/servletFiltre', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({filters: filters})
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("HTTP error " + response.status + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            return displayArticles(data);

        })
        .then(() => {
            initializeCart();
        })
        .catch(e => {
            console.log("Erreur: ", e);
            // TODO: Meilleure Gestion d'erreurs
        });

    console.log("Chargement de la liste");
}



function displayArticles(articles) {
    return new Promise((resolve) => {
        var articlesContainer = document.getElementById('articlesContainer');
        articlesContainer.innerHTML = '';
        bsOffcanvas.hide();
        articles.forEach(function(article) {
            var card = `<div class="card d-flex flex-column" style="min-height: 100%;">
    <img src="${article.imgPath}" class="card-img-top" alt="${article.nomArticle}">
    <div class="card-body d-flex flex-column justify-content-between">
        <div class="d-flex justify-content-between align-items-center">
            <h5 class="card-title">${article.nomArticle}</h5>
            <span class="badge bg-dark-subtle">${article.categorie}</span>
        </div>
        <div class="mt-auto">
            <div class="price-container">
                <p class="card-text"><span class="price">${article.prix.toFixed(2)}$</span></p>
            </div>
            <div class="d-flex flex-column align-items-stretch">
                <div id="buttonGroup_${article.id}" class="btn-group w-100 mb-1" role="group">
                    <button type="button" class="btn btn-custom w-100" id="addToCart_${article.id}" onclick="addToCart('${article.id}')">Ajouter au panier</button>
                </div>
                <form action="produitDetail.jsp" method="post">
                    <input type="hidden" name="productId" value="${article.id}">
                    <button type="submit" class="btn btn-custom btn-block w-100">Détails</button>
                </form>
            </div>
        </div>
    </div>
</div>`;
            ;
            articlesContainer.innerHTML += card;  // Add new article
        });
        resolve();
    });
}

function updateCartDisplay() {
    const cart = JSON.parse(localStorage.getItem('cart')) || {};
    const itemCount = Object.values(cart).reduce((a, b) => a + b, 0);
    const cartElement = document.getElementById('cartItems')
    const cartItemCountElement = document.querySelector('.badge.text-bg-danger');
    const cartBtn = document.getElementById('cartIcon');
    // const cartModalBody = document.getElementById('cartModalBody');

    cartItemCountElement.textContent = itemCount;

    if (itemCount > 0) {
        cartBtn.style.display = 'block';
        // cartElement.style.display = 'block';
    } else {
        cartBtn.style.display = 'none';
        // cartElement.style.display = 'none';
    }
}



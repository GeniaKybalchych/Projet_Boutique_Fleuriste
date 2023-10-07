
// Tax rate
var taxRate = 0.1;

// Initialize subtotal
var subtotal = 0;

// Sum up each article's total
Array.from(document.querySelectorAll('[id^="total-"]')).forEach(function(totalElem) {
    var totalText = totalElem.textContent.replace('$', '').trim();
    var total = parseFloat(totalText);

    if (!isNaN(total)) {
        subtotal += total;
    }
});

// Calculate total after taxes
var totalAfterTaxes = subtotal * (1 + taxRate);

// Display the subtotal and total after taxes
document.getElementById('subtotal').textContent = subtotal.toFixed(2);
document.getElementById('totalAfterTaxes').textContent = totalAfterTaxes.toFixed(2);

function checkout(){

    fetch('/PanierServlet', {
        method: 'GET'
    })
        .then(response => response.text())  // parse the response as text
        .then(responseText => {
            if (responseText === 'redirect') {
                window.location.href = 'checkout.jsp';
            } else if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
        })
        .catch(e => {
            console.log('There was a problem with the fetch operation: ' + e.message);
        });
}

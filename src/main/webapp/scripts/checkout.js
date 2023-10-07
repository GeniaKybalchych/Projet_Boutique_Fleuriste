(() => {
  'use strict'

  const forms = document.querySelectorAll('.needs-validation')

  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      } else {
        // Appeler la fonction de validation personnalisée avant la soumission du formulaire
        if (!validateForm(form)) {
          event.preventDefault()
          event.stopPropagation()
        }
      }

      form.classList.add('was-validated')
    }, false)
  })

  function validateForm(form) {
    // Récupérer les valeurs des champs de formulaire
    const prenom = form.querySelector('#prenom').value.trim()
    const nom = form.querySelector('#nom').value.trim()
    const address = form.querySelector('#address').value.trim()
    const codePostal = form.querySelector('#codePostal').value.trim()
    const telephone = form.querySelector('#telephone').value.trim();
    const ville = form.querySelector('#ville').value.trim();
    const username = form.querySelector('#username').value.trim();
    const password = form.querySelector('#password').value.trim();



    // Expression régulière pour vérifier si une chaîne est alphabétique
    const alphabeticRegex = /^[A-Za-z\u00C0-\u017F\s-]+$/

    // Expression régulière pour vérifier le format du code postal canadien
    const canadianPostalCodeRegex = /^[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d$/

    // Expression régulière pour vérifier le format du numéro de téléphone nord-américain
    const phoneNumberRegex = /^(\d{3}-\d{3}-\d{4}|\d{10})$/;

    // Expression régulière pour vérifier le format du numéro de téléphone nord-américain
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/;


    // Valider le champ prenom
    if (!alphabeticRegex.test(prenom) || prenom.length < 2) {
      setErrorState(form.querySelector('#prenom'))
      return false
    }

    // Valider le champ nom
    if (!alphabeticRegex.test(nom) || nom.length < 2) {
      setErrorState(form.querySelector('#nom'))
      return false
    }

    // Valider le champ address
    if (address.length < 2) {
      setErrorState(form.querySelector('#address'))
      return false
    }

    // Valider le champ codePostal
    if (!canadianPostalCodeRegex.test(codePostal)) {
      setErrorState(form.querySelector('#codePostal'))
      return false
    }


    // Valider le champ telephone
    if (!phoneNumberRegex.test(telephone)) {
      setErrorState(form.querySelector('#telephone'));
      return false;
    }

    if (!alphabeticRegex.test(ville) || ville.length < 2) {
      setErrorState(form.querySelector('#ville'));
      return false;
    }

    if (username.length < 1) {
      setErrorState(form.querySelector('#username'));
      return false;
    }

    if (!passwordRegex.test(password)) {
      setErrorState(form.querySelector('#password'));
      return false;
    }


    return true
  }

  function setErrorState(element) {
    element.classList.add('is-invalid')
  }
})()

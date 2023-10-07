var cryptage = true;

function changerAffichageMotDePasse(){

    if(cryptage==true){
        document.getElementById("password").setAttribute("type", "text");
        cryptage=false;
    }else{
        document.getElementById("password").setAttribute("type", "password");
        cryptage=true;
    }
}
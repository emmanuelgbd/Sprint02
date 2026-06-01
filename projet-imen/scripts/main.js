// ======================================
// Projet IMeN - Script JavaScript
// Sprint 01 - Programmation Web
// ======================================

// Confirmation que le fichier est bien chargé
console.log(" main.js chargé avec succès !");

// Attendre que la page soit entièrement chargée
document.addEventListener("DOMContentLoaded", function () {

    // Sélectionner le bouton
    const bouton = document.querySelector(".bouton");

    // Ajouter une action au clic sur le bouton
    if (bouton) {
        bouton.addEventListener("click", function (e) {
            e.preventDefault();
            alert(" Bienvenue dans le Projet IMeN !");
        });
    }

});

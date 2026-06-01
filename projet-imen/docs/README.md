# Documentation du fichier index_mardi.html

Ce document présente le contenu et l'organisation du fichier `src/index_mardi.html` du projet.

## Présentation
`index_mardi.html` est une page HTML statique construite en HTML5 sémantique. Elle contient un CV personnel pour Emmanuel Quentin GBODOU.

## Structure principale
- `<!DOCTYPE html>` : déclaration du document HTML5
- `<html lang="fr">` : page en français
- `<head>` : métadonnées, encodage UTF-8, viewport responsive et titre
- `<body>` : contenu principal de la page

## Sections du contenu
- `<header>` : informations personnelles, email, téléphone et adresse
- `<main>` : sections de contenu principal
  - `#experiences` : expérience professionnelle (stage académique)
  - `#formation` : parcours de formation et diplômes
- `<aside>` : contenu secondaire
  - photo de profil
  - profil personnel
  - compétences (langues, logiciels, permis)
  - qualités personnelles
  - centres d'intérêt
- `<footer>` : note de fin indiquant le format HTML5 et la date

## Points importants
- La page utilise des éléments sémantiques (`header`, `main`, `section`, `article`, `aside`, `footer`)
- Le balisage `<time>` est utilisé pour les dates
- Le fichier n'inclut pas de styles CSS ni de script JavaScript dans le HTML lui-même
- L'image de profil est référencée via `photo-profil.jpg` en source relative

## Usage
1. Ouvrir `src/index_mardi.html` dans un navigateur web
2. S'assurer que le fichier `photo-profil.jpg` est disponible dans le même dossier que l'HTML ou ajuster le chemin si nécessaire
3. Ajouter une feuille de style CSS et/ou un script JS si vous souhaitez enrichir la présentation

## Objectif
Ce fichier sert de CV en ligne simple et statique pour le projet de programmation web. Il est idéal pour démontrer l'utilisation de HTML sémantique et structurer des informations personnelles et professionnelles.

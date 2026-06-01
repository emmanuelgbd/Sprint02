#!/bin/bash

# ============================================================
#                       SCRIPT BASH FINAL
#               Projet IMeN - Programmation Web
#  Description : Crée automatiquement l'arborescence
#                complète d'un projet web standardisé
#                avec fichiers préremplis
# ============================================================

# --- Codes couleurs ANSI ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
NC='\033[0m'   # No Color : remet la couleur par défaut

# --- Nom du projet (tu peux le changer ici) ---
PROJECT_NAME="projet-imen"

# ============================================================
# BANNIERE D'ACCUEIL
# ============================================================
clear
echo ""
echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}${BOLD}║                                                      ║${NC}"
echo -e "${CYAN}${BOLD}║        FORGE — Script de Création Projet Web         ║${NC}"
echo -e "${CYAN}${BOLD}║                IMeN 2026                             ║${NC}"
echo -e "${CYAN}${BOLD}║                                                      ║${NC}"
echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}  Projet  : ${BOLD}$PROJECT_NAME${NC}"
echo -e "${YELLOW}  Auteur  : Emmanuel GBODOU${NC}"
echo -e "${YELLOW}  Date    : $(date '+%d/%m/%Y à %H:%M')${NC}"
echo ""
echo -e "${CYAN}──────────────────────────────────────────────────────${NC}"
echo ""

# ============================================================
# VERIFICATION 1 : est-ce que tree est installé ?
# ============================================================
echo -e "${BLUE} Vérification des outils nécessaires...${NC}"

if ! command -v tree &> /dev/null; then
    echo -e "${YELLOW}  La commande 'tree' n'est pas installée.${NC}"
    echo -e "${YELLOW}     Installation en cours...${NC}"
    sudo apt-get install -y tree &> /dev/null
    echo -e "${GREEN}  ✓  tree installé avec succès.${NC}"
else
    echo -e "${GREEN}  ✓  tree est disponible.${NC}"
fi

echo ""

# ============================================================
# VERIFICATION 2 : le dossier projet existe-t-il déjà ?
# ============================================================
echo -e "${BLUE} Vérification du dossier projet...${NC}"
echo ""

if [ -d "$PROJECT_NAME" ]; then
    echo -e "${RED}  Attention : Le dossier '$PROJECT_NAME' existe déjà !${NC}"
    echo ""
    echo -e "${YELLOW}  Voulez-vous le supprimer et tout recréer ? (oui/non) : ${NC}"
    read -r REPONSE

    if [ "$REPONSE" = "oui" ]; then
        rm -rf "$PROJECT_NAME"
        echo -e "${GREEN}  ✓  Ancien dossier supprimé. On repart de zéro.${NC}"
    else
        echo ""
        echo -e "${RED}  Opération annulée. Le script s'arrête.${NC}"
        echo -e "${RED}  Renomme ou supprime manuellement '$PROJECT_NAME' puis relance.${NC}"
        echo ""
        exit 1
    fi
else
    echo -e "${GREEN}  ✓  Aucun conflit détecté. On peut créer le projet.${NC}"
fi

echo ""
echo -e "${CYAN}──────────────────────────────────────────────────────${NC}"
echo ""

# ============================================================
# ETAPE 1 : CREATION DES 8 DOSSIERS
# ============================================================
echo -e "${BLUE}${BOLD} ÉTAPE 1 — Création des 8 dossiers...${NC}"
echo ""

mkdir -p "$PROJECT_NAME/src/pages"
echo -e "  ${GREEN}✓${NC}  /src/pages        → Pages HTML secondaires"

mkdir -p "$PROJECT_NAME/src/components"
echo -e "  ${GREEN}✓${NC}  /src/components   → Blocs HTML réutilisables"

mkdir -p "$PROJECT_NAME/assets/images"
echo -e "  ${GREEN}✓${NC}  /assets/images    → Images du projet"

mkdir -p "$PROJECT_NAME/assets/fonts"
echo -e "  ${GREEN}✓${NC}  /assets/fonts     → Polices de caractères"

mkdir -p "$PROJECT_NAME/assets/icons"
echo -e "  ${GREEN}✓${NC}  /assets/icons     → Icônes SVG et PNG"

mkdir -p "$PROJECT_NAME/styles"
echo -e "  ${GREEN}✓${NC}  /styles           → Feuilles de style CSS"

mkdir -p "$PROJECT_NAME/scripts"
echo -e "  ${GREEN}✓${NC}  /scripts          → Fichiers JavaScript"

mkdir -p "$PROJECT_NAME/docs"
echo -e "  ${GREEN}✓${NC}  /docs             → Documentation technique"

echo ""
echo -e "${CYAN}──────────────────────────────────────────────────────${NC}"
echo ""

# ============================================================
# ETAPE 2 : CREATION DU FICHIER index.html PREREMPLI
# ============================================================
echo -e "${BLUE}${BOLD} ÉTAPE 2 — Création de index.html...${NC}"
echo ""

cat > "$PROJECT_NAME/src/index.html" << 'EOF'
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV-Emmanuel GBODOU</title>
</head>
<body>
    <header>
        <h1>Emmanuel Quentin GBODOU</h1>
        <p>Développeur Web</p>
        <p>Né le 30 Avril 2005 à Cotonou</p>
        <address>
            <p>Email: <a href="mailto:emmanuelgbodou154@gmail.com">emmanuelgbodou154@gmail.com</a></p>
            <p>Téléphone: <a href="tel:+2290153972466">+229 0153972466</a> / <a href="tel:+2290140035512">+2290140035512</a></p>
            <p>Adresse: Abomey-Calavi, Fandji Maison GBODOU</p>
        </address>
    </header>

    <main>

        <section id="experiences">
            <h2>Expériences Professionnelles</h2>
            <article>
                <h3>Stage Académique</h3>
                <p>Direction des Collectivités Territoriales</p>
                <p>
                    De <time datetime="2025-05">Mai 2025</time> à <time datetime="2025-08">Août 2025</time>
                </p>
                <ul>
                    <li>Contribuer à la rédaction de messages radios et de comptes rendus de réunion</li>
                    <li>Participer à un projet d'élaboration d'un décret</li>
                    <li>Effectuer la traduction de documents de l'anglais vers le français</li>
                </ul>
            </article>
        </section>

        <section id="formation">
            <h2>Formation</h2>
            <ol>
                <li>
                    <h3>Programmation web</h3>
                    <p>Institut des Métiers du Numérique (IMeN)</p>
                    <p><time datetime="2026-05">Mai 2026</time> à ce jour</p>
                </li>
                <li>
                    <h3>Linguistic Staff Development Programme</h3>
                    <p><time datetime="2025-09">Septembre 2025</time> - <time datetime="2025-12">Décembre 2025</time></p>
                </li>
                <li>
                    <h3>Licence en Administration Générale et Territoriale (AGT)</h3>
                    <p>Ecole Nationale d'Administration (ENA)/Université d'Abomey-Calavi (UAC)</p>
                    <p><time datetime="2022">2022</time> - <time datetime="2025">2025</time></p>
                </li>
                <li>
                    <h3>Informatique/ Essentiels de l'ordinateur</h3>
                    <p><time datetime="2022">2022</time></p>
                </li>
                <li>
                    <h3>Baccalauréat Scientifique - Série D</h3>
                    <p><time datetime="2021">2021</time> - <time datetime="2022">2022</time></p>
                </li>
            </ol>
        </section>
    </main>

    <aside>
        <figure>
            <img src="photo-profil.jpg" alt="Photo de profil d'Emmanuel GBODOU" width="150" height="150">
        </figure>
        <section id="profil">
            <h2>Profil</h2>
            <p>Etudiant en Programmation web, je suis animé par une curiosité naturelle pour les technologies numériques et le monde du développement. Je suis motivé, investi et toujours désireux d'apprendre. Je cherche à acquérir de nouvelles compétences et à les mettre au service de projets concrets. </p>
        </section>
        <section id="competences">
            <h2>Compétences</h2>
            <section id="langues">
                <h3>Langues</h3>
                <ul>
                    <li>Français: Langue maternelle</li>
                    <li>Anglais: Niveau intermédiaire</li>
                    <li>Fon: Niveau intermédiaire</li>
                </ul>
            </section>
            <section id="logiciels">
                <h3>Logiciels maîtrisés</h3>
                <ul>
                    <li>Visual Studio Code</li>
                    <li>GitHub</li>
                    <li>Microsoft Office (Word, Excel, PowerPoint)</li>
                </ul>
            </section>
            <section id="permis">
                 <h3>Permis de conduire</h3>
                 <p>Permis de conduire de catégorie B</p>
            </section>
        </section>
        <section id="qualites">
            <h2>Qualités</h2>
            <ul>
                <li>Curiosité</li>
                <li>Motivation</li>
                <li>Investissement</li>
                <li>Esprit d'équipe</li>
                <li>Capacité d'adaptation</li>
            </ul>
        </section>
        <section id="centre-interet">
            <h2>Centres d'intérêt</h2>
            <ul>
                <li>Football</li>
                <li>Basketball</li>
                <li>Mangas</li>
                <li>Jeux vidéos</li>
                <li>Informatique</li>
                <li>Musique</li>
            </ul>
        </section>
    </aside>
    <footer>
        <p><small>CV créé en HTML5 sémantique pur - Sprint 02 - Programmation web <time datetime="2026-06-02">Juin 2026</time></small></p>
    </footer>
    
</body>
</html>
EOF

echo -e "  ${GREEN}✓${NC}  src/index.html créé et prérempli"

# ============================================================
# ETAPE 3 : CREATION DU FICHIER main.css
# ============================================================
echo ""
echo -e "${BLUE}${BOLD} ÉTAPE 3 — Création de main.css...${NC}"
echo ""

cat > "$PROJECT_NAME/styles/main.css" << 'EOF'
/* ======================================
   Projet IMeN - Feuille de style
   Sprint 01 - Programmation Web
   ====================================== */

/* --- Réinitialisation de base --- */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* --- Corps de la page --- */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 16px;
    color: #333333;
    background-color: #f9f9f9;
}

/* --- En-tête et navigation --- */
header {
    background-color: #1a1a2e;
    padding: 1rem 2rem;
}

header nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header h1 {
    color: #e94560;
    font-size: 1.5rem;
}

header ul {
    list-style: none;
    display: flex;
    gap: 1.5rem;
}

header a {
    color: #ffffff;
    text-decoration: none;
}

header a:hover {
    color: #e94560;
}

/* --- Section héro --- */
.hero {
    text-align: center;
    padding: 5rem 2rem;
}

.hero h2 {
    font-size: 2rem;
    margin-bottom: 1rem;
    color: #1a1a2e;
}

.hero p {
    color: #555555;
    margin-bottom: 2rem;
}

/* --- Bouton --- */
.bouton {
    display: inline-block;
    background-color: #e94560;
    color: white;
    padding: 0.8rem 2rem;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
}

.bouton:hover {
    background-color: #c73652;
}

/* --- Pied de page --- */
footer {
    text-align: center;
    padding: 2rem;
    background-color: #1a1a2e;
    color: #aaaaaa;
    margin-top: 3rem;
}
EOF

echo -e "  ${GREEN}✓${NC}  styles/main.css créé et prérempli"

# ============================================================
# ETAPE 4 : CREATION DU FICHIER main.js
# ============================================================
echo ""
echo -e "${BLUE}${BOLD} ÉTAPE 4 — Création de main.js...${NC}"
echo ""

cat > "$PROJECT_NAME/scripts/main.js" << 'EOF'
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
EOF

echo -e "  ${GREEN}✓${NC}  scripts/main.js créé et prérempli"

# ============================================================
# VERIFICATION FINALE : les 4 fichiers existent-ils vraiment ?
# ============================================================
echo ""
echo -e "${CYAN}──────────────────────────────────────────────────────${NC}"
echo ""
echo -e "${BLUE}${BOLD} VÉRIFICATION FINALE — Les 3 fichiers sont-ils là ?${NC}"
echo ""

FICHIERS_OK=0

for FICHIER in \
    "$PROJECT_NAME/src/index.html" \
    "$PROJECT_NAME/styles/main.css" \
    "$PROJECT_NAME/scripts/main.js"
do
    if [ -f "$FICHIER" ]; then
        echo -e "  ${GREEN}✓${NC}  $FICHIER  ${GREEN}[OK]${NC}"
        FICHIERS_OK=$((FICHIERS_OK + 1))
    else
        echo -e "  ${RED}✗  $FICHIER  [MANQUANT]${NC}"
    fi
done

echo ""

# Message selon le résultat
if [ "$FICHIERS_OK" -eq 3 ]; then
    echo -e "${GREEN}${BOLD}  Les 3 fichiers sont présents. Script validé !${NC}"
else
    echo -e "${RED}${BOLD}  Attention : seulement $FICHIERS_OK/3 fichiers créés.${NC}"
fi

# ============================================================
# AFFICHAGE DE L'ARBORESCENCE COMPLETE
# ============================================================
echo ""
echo -e "${CYAN}──────────────────────────────────────────────────────${NC}"
echo ""
echo -e "${YELLOW}${BOLD} Arborescence complète du projet :${NC}"
echo ""
tree "$PROJECT_NAME"

# ============================================================
# MESSAGE DE FIN
# ============================================================
echo ""
echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}${BOLD}║           PROJET CRÉÉ AVEC SUCCÈS !                ║${NC}"
echo -e "${CYAN}${BOLD}║    Ouvrez src/index.html dans votre navigateur.      ║${NC}"
echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════╝${NC}"
echo ""

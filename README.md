# 🕹️ Morpion — Projet THP W4 D4

Ce projet a été réalisé dans le cadre de la formation **The Hacking Project (THP)** lors de la **week 4, journée 4**.

---

## :dart: À propos

Morpion (Tic-Tac-Toe) codé en **Ruby** avec une architecture orientée objet.  
L’idée est de manipuler des classes, abstraire la logique du jeu, et offrir une interface console claire pour deux joueurs humains.

---

## :sparkles: Fonctionnalités

- Deux joueurs humains jouent en alternance.  
- Le programme demande le prénom des joueurs au début.  
- Le plateau est composé de 9 cases identifiées de “A1” à “C3”.  
- À chaque tour, le plateau est affiché dans le terminal, et le joueur est invité à choisir une case.  
- Détection automatique de victoire ou match nul.  
- Si la partie est terminée, l’utilisateur peut choisir de rejouer.  
- Efforts d’affichage stylé (bordures, clarté, éventuellement couleurs).

---

## :rocket: Technologies utilisées

- Ruby  
- Bundler (gestion des gems)  
- Gem « colorize » (optionnelle pour la coloration dans le terminal)

---

## 🛠️ Installation & usage

```bash
# Cloner le dépôt
git clone https://github.com/Madzy27-Ys/THP-W4-D4-Morpion.git

# Aller dans le dossier du projet
cd THP-W4-D4-Morpion

# Installer les dépendances (si Gemfile présent)
bundle install

# Lancer le jeu
ruby app.rb

THP-W4-D4-Morpion/
│
├── lib/
│   ├── app.rb
│   ├── game.rb
│   ├── player.rb
│   ├── board.rb
│   ├── board_case.rb
│   └── show.rb
│
├── Gemfile
├── Gemfile.lock
├── README.md
└── .gitignore

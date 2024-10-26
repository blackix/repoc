#!/bin/bash

# Chiedi il nome della repository all'utente
read -p "Inserisci il nome della nuova repository: " REPO_NAME

# Verifica se il nome è stato fornito
if [ -z "$REPO_NAME" ]; then
  echo "Errore: il nome della repository non può essere vuoto."
  exit 1
fi

# Crea la directory e spostati al suo interno
mkdir "$REPO_NAME"
cd "$REPO_NAME"

# Inizializza il repository locale
git init

# Crea un file README.md come file iniziale
echo "# $REPO_NAME" > README.md

# Aggiungi il file all'indice di Git e fai il primo commit
git add README.md
git commit -m "Prima versione del README per $REPO_NAME"

# Crea la repository remota su GitHub
gh repo create "$REPO_NAME" --public --source=. --remote=origin

# Rinomina il branch a 'main'
git branch -M main

# Esegui il push del branch principale
git push -u origin main

echo "Repository $REPO_NAME creata con successo e sincronizzata con GitHub!"


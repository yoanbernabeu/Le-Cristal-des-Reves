#!/bin/bash

# Définition des répertoires source et de destination
SOURCE_DIR="./_sources"
COMPRESS_DIR="./_compress"

# Création du répertoire de destination s'il n'existe pas
mkdir -p "$COMPRESS_DIR"

# Vérification de l'existence du répertoire source
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Le répertoire source $SOURCE_DIR n'existe pas."
    exit 1
fi

# Conversion des images PNG en JPG
for image in "$SOURCE_DIR"/*.png; do
    if [ -f "$image" ]; then
        # Extraction du nom de base de l'image
        base_name=$(basename "$image" .png)

        # Conversion et compression de l'image
        convert "$image" "$COMPRESS_DIR/${base_name}.jpg"
    fi
done

echo "Conversion terminée."

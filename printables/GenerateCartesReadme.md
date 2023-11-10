# Génération de Cartes PDF

le script CompressImages.sh est conçu pour compresser un ensemble d'images PNG en un ensemble d'images PNG plus petites. Cela permet de réduire la taille des images sans perte de qualité.

Le script GenerateCartes.sh est conçu pour convertir un ensemble d'images PNG en un document PDF, avec 9 images par page. Ce document est parfait pour imprimer des cartes ou des images carrées pour divers usages.

Vous devez d'abord compresser vos images PNG à l'aide du script CompressImages.sh, puis générer le PDF des cartes à l'aide du script GenerateCartes.sh.

## Dépendances

Le script nécessite les logiciels suivants:

* LaTeX avec le package pgffor (inclus dans la plupart des distributions LaTeX comme TeX Live)
* ImageMagick pour la manipulation d'images

### Installation des Dépendances sous Debian/Ubuntu

Ouvrez un terminal et exécutez les commandes suivantes pour installer les dépendances nécessaires:

```sh
sudo apt update
sudo apt install texlive texlive-pictures texlive-latex-extra imagemagick --no-install-recommends
```

Cela installera une version minimale de TeX Live avec les packages nécessaires et ImageMagick sans installer de logiciels supplémentaires non nécessaires.

## Compressez vos images

### Configuration du Script

Assurez-vous que le script CompressImages.sh est exécutable. Dans le terminal, naviguez vers le dossier contenant le script et exécutez :

```sh
chmod +x CompressImages.sh
```

### Utilisation

Pour compresser vos images, placez-les dans un dossier nommé `./_sources`. Les images doivent être nommées de manière séquentielle (par exemple, `carte_01.png`, `carte_02.png`, ..., `carte_99.png`).

Exécutez le script dans le terminal en utilisant la commande suivante:

```sh
./CompressImages.sh
```

## Génération du PDF des Cartes

### Configuration du Script

Assurez-vous que le script GenerateCartes.sh est exécutable. Dans le terminal, naviguez vers le dossier contenant le script et exécutez :

```sh
chmod +x GenerateCartes.sh
```

### Utilisation

Pour générer le document PDF, placez toutes vos images PNG dans un dossier nommé `./_sources`. Les images doivent être nommées de manière séquentielle (par exemple, `carte_01.png`, `carte_02.png`, ..., `carte_99.png`).

Exécutez le script dans le terminal en utilisant la commande suivante:

```sh
./GenerateCartes.sh
```

Le script traitera les images et produira un fichier `Cartes.pdf` dans le dossier courant.

## Problèmes connus et dépannage

Assurez-vous que toutes les images sont au format PNG et qu'elles sont nommées correctement.

Si LaTeX produit des erreurs, vérifiez que toutes les dépendances sont correctement installées et que votre distribution TeX est à jour.
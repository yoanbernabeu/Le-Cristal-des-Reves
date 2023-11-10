#!/bin/bash

# Création d'un répertoire temporaire pour le traitement des images
temp_dir=$(mktemp -d -t ci-XXXXXXXXXX)
processed_dir="${temp_dir}/processed_images"
mkdir -p "${processed_dir}"

# Copie des images originales vers le répertoire temporaire
cp ./_compress/carte_*.jpg "${processed_dir}"

# Génération du fichier LaTeX
tex_file="${temp_dir}/images.tex"
cat <<EOF > "$tex_file"
\documentclass[a4paper]{article}
\usepackage{graphicx}
\usepackage[margin=1cm]{geometry}
\usepackage{pgffor}
\usepackage{grffile}
\pagestyle{empty}

\begin{document}

\centering
\newcounter{imagecounter}

\foreach \x in {01,02,03,04,05,06,07,08,09,10,...,99} { % Assurez-vous que cela couvre la plage de vos images
  \def\filename{carte_\x.jpg}%
  \IfFileExists{${processed_dir}/\filename}{%
    \includegraphics[width=60mm]{${processed_dir}/\filename}%
    \stepcounter{imagecounter}%
    \ifnum\value{imagecounter}=9%
        \clearpage
        \setcounter{imagecounter}{0}%
    \else
        % Ajoute un espace vertical après l'image si ce n'est pas la dernière de la page
        \vspace{10mm} % Ajustez la valeur ici pour augmenter la marge entre les lignes
    \fi
  }{}
}

\end{document}
EOF

# Compilation du fichier LaTeX en PDF
pdflatex -output-directory "${temp_dir}" "$tex_file"
mv "${temp_dir}/images.pdf" ./Cartes.pdf

# Nettoyage
rm -r "${temp_dir}"

echo "Le fichier PDF 'Cartes.pdf' a été généré avec succès."

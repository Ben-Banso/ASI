#!/bin/bash

# Récupération des paramètres
url=$1
pattern=$2

# Création d'un fichier temporaire pour la page téléchargée
tmp_file=$(mktemp)

# On regarde l'heure, à la milliseconde près
begin_time=$(date +%s%N | cut -b1-13)

# Téléchargement
wget $url -q -O $tmp_file

# Récupération du code de retour de wget
# 0 : Tout s'est bien passé
# Autre valeur : quelque chose à mal tourné
# https://www.gnu.org/software/wget/manual/html_node/Exit-Status.html
return_code=$?

# On regarde l'heure
end_time=$(date +%s%N | cut -b1-13)
# La différence des deux nous donne le temps que ça a prit
duration=$(expr $end_time - $begin_time)

# Si la page s'est téléchargé correctement
if [ $return_code == 0 ]; then

	# Vérification de la présence du pattern dans la page
	grep -q $pattern $tmp_file

	# Récupération de la valeur de retour de grep
	# 0 : La valeur a été trouvé au moins une fois
	# 1 : La valaur n'a pas été trouvé
	return_code=$?

	if [ $return_code == 0 ]; then
		status="OK"
	else
		status="KO"
	fi
else
	status="KO";
fi

# Nettoyage
rm $tmp_file

# Affichage du résultat
echo $status $duration

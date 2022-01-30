# Projet 3 : Dashboard NodeRed | Raphaël GANDUS, Instrumentation 2


Vous trouverez dans le fichier projet3_nodered.json le code javascript édité automatiquement par NodeRed.

Mon dashboard contient 2 fenêtres. 

Celle de droite indique la température du CPU de la raspberry, et l'affiche de 2 manières : par texte et par jauge. 
Elle est actualisée toutes les secondes.
Cette température est accessible grâce au fichier /sys/class/thermal/thermal_zone0/temp dont on va lire le contenu.

Celle de gauche affiche sur un graphique la température à Paris.
Elle est actualisée toutes les 5min.
Elle est obtenue grâce à une requête http et une clé API fournie gratuitement par openweathermap.org

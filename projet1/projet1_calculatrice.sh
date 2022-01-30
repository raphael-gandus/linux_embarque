#!/bin/bash

#Projet 1 : programme bash pour une calculatrice simple
#Raphaël GANDUS, Instrumentation 2

#Demande à l'utilisateur de choisir deux nombres (entiers ou décimaux)
echo "Entrez deux nombres :"
read -p "a :" a
echo
read -p "b :" b
echo

#Demande à l'utilisateur l'opération qu'il souhaite effectuer entre ces deux nombres
echo "Quelle opération souhaitez-vous effectuer ?"
echo "  1- Addition de a et b"
echo "  2- Soustraction de a et b"
echo "  3- Multiplication de a et b"
echo "  4- Division de a par b"
read -p "Choix : " choix
echo

#Tant que l'utilisateur ne choisit pas un choix compris entre 1 et 4 on lui demande à nouveau son choix
while [ $choix -lt 1 ] || [ $choix -gt 4 ];do
    read -p "Choix : " choix
    echo
done
# echo $choix

#Opérations à effecteur selon le choix de l'utilisateur
case $choix in
    1)
    echo "$a+$b ="
    echo "scale=3; $a+$b" | bc   #La commande scale eprmet de choisir le nombres de décimales à afficher
    ;;
    2)
    echo "$a-$b = "
    echo "scale=3; $a-$b" | bc   #La commande bc permet d'effecteur des opérations mathématiques
    ;;
    3)
    echo "$a*$b = "
    echo "scale=3; $a*$b" | bc
    ;;
    4)
    echo "$a/$b = "
    echo "scale=3; $a/$b" | bc
    ;;
esac

#Fin du programme

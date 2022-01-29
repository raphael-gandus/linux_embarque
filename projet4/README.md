# Projet 4 : Hicham GHANEM et Raphaël GANDUS

## Installation des paquets nécessaires au projet : 
- Mosquitto :
```bash
sudo apt-get update
sudo apt-get install mosquitto
sudo apt-get install mosquitto mosquitto-clients python-mosquitto
```

- Python 3.7 :
```bash
sudo apt-get install build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev -y
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
tar xf Python-3.7.0.tar.xz
cd Python-3.7.0
./configure
make -j 4
sudo make altinstall
sudo apt-get install python3-pip
```

- Pilotes python SenseHat :
```bash
sudo apt-get update
sudo apt-get install sense-hat
sudo pip3 install pillow
```

Après ces installations, nous n'avons pas pu installer le node node-red-node-pi-sense-hat sur NodeRed.
Il y avait une erreur avec les librairies Python du SenseHat.
Nous avons finalement trouvé la solution, il fallait ouvrir le fichier suivant :
```bash
sudo nano ~/.node-red/node_modules/node-red-node-pi-sense-hat/sensehat.js
``` 
Puis changer la ligne 10 :
```javascript
if (!fs.existsSync('/usr/lib/python2.7/dist-packages/sense_hat')) {
```
en : 
```javascript
 if (!fs.existsSync('/usr/lib/python3/dist-packages/sense_hat')) {
```
Pour faire en sorte que SenseHat utilise Python 3.
Une fois ce changement fait, nous avons pu installer le node sur NodeRed.

## Descriptif 
Vous trouverez les deux fichiers .json de nos deux NodeRed (projet4_raphael_RP1.json et projet4_hicham_RP2.json) pour dans le GitHub du projet.

En utilisant seulement les noeuds de la librairie node-red-node-pi-sense-hat, nous n'avons pas pu obtenir en même temps les données d'environnement et de mouvement.

Nous avons donc décidé d'utiliser des scripts python pour obtenir les données d'environnement, et les noeuds de node-red-node-pi-sense-hat pour les données de mouvement.

Vous pouvez trouver les scripts python utilisés sur le GitHub du projet (temperature.py, humidite.py et pression.py).

La première Raspberry RP1 (celle de Raphaël) capte toutes les données et les transmet via MQTT à la deuxème Raspberry RP2 (celle d'Hicham).

La RP2 recoit les données et les affiche sur un dashboard. L'ui du NodeRed de la RP2 contient également une fenêtre qui permet de rédiger un texte à envoyer sur la RP1.

Une fois le texte envoyé, la RP1 l'affiche sur sa matrice LED.  

## Fonctionnement de MQTT
C'est la RP1 qui est le broker du MQTT. Afin que la RP2 puisse se connecter à ce broker, Raphaël a fait une redirection de ports sur sa box pour que les requêtes de la RP2 soient transmises sur la RP1.

De plus, comme nous n'étions pas sur le même réseau, nous avons dû créer un fichier de connection sur la RP2 :
```bash
cd /etc/mosquitto/conf.d
sudo nano connect.conf
```
Dans lequel on écrit :
```bash
listener 16384
allow_anonymous true
```
qui permet à MQTT d'utiliser le port 16384 (celui utilisé par la box du réseau dans lequel se trouve la RP1).

## Apercu du dashboard sur la RP2 : 
(./dashboard_RP2.jpg)

# Projet 2 : CV en ligne | Raphaël GANDUS, Instrumentation 2

Vous trouverez dans projet2_cv.html le code html utilisé pour éditer mon CV.

Afin de le mettre en ligne, j'ai utilisé Apache.

J'ai d'abord installé Apache sur ma raspberry grâce à : 
```bash
sudo apt install apache2
```

J'ai ensuite créé un répertoire pour mon site : 
```bash
sudo mkdir /var/www/mon_site
```

J'ai mis à jour le propriétaire et les droits d'accès à ce répertoire grâce aux commandes : 
```bash
sudo chown -R pi /var/www/mon_site
sudo chown -R 755 /var/www/mon_site
```
Je crée ensuite un fichier index.html dans le répertoire /var/www/mon_site, en copiant dans ce fichier le contenu de projet2_cv.html (mon CV).

Il faut ensuite créer l'hôte virtuel. On se rend dans /etc/apache2/sites-available, et on crée un fichier mon_site.conf dans lequel j'écris le code suivant :
```bash
	<VirtualHost *:80>
		ServerAdmin r.gandus@yahoo.com				#Adresse mail du propriétaire
		ServerName mon_site.test				#Accessibilité http
		ServerAlias www.mon_site.test				#Autre nom possible pour http
		DocumentRoot /var/www/mon_site				#Chemin d'accès au répertoire contenant index.html
		ErrorLog ${APACHE_LOG_DIR}/error.log			#Stockage des journaux
		CustomLog ${APACHE_LOG_DIR}/custom.log combined		#Stockage des journaux
	</VirtualHost>
```

J'ai ensuite activé l'hôte virtuel grâce à : 
```bash
sudo a2ensite mon_site.conf
```
J'ai verifié l'état des fichiers grâce à : 
```bash
sudo apache2ctl configtest
```
La console me renvoie le message "SYNTAX OK"

Enfin je recharge apache avec : 
```bash
systemctl reload apache2
```
Afin d'accéder à ce site depuis un ordinateur de mon réseau local, il faut que j'ajoute manuellement dans le fichier hosts de Windows qui se trouve
dans Windows/System32/drivers/etc la ligne :
						192.168.0.254 www.mon_site.test  
						#IP locale de ma raspberry

Une fois cette opération effectuée, je peux accéder à mon CV en écrivant http://www.mon_site.test dans la barre de recherche du navigateur.
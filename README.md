Pour commencer il vous faut :

-   Docker Toolbox basé sur Virtual Box (version 5.2.4 ou supérieure)
-   Oracle VM VirtualBox Extension Pack

Ensuite, récupérez les fichiers contenus dans le dossier Docker/

-   Lancez le DockerQuickstart Terminal
-   Allez dans votre espace contenant le DockerFile puis faites "docker build -t [image_name] ." 
      (L'étape est longue, si elle s'arrête sur une erreur de clé ssh, coupez et relancez la commande jusqu'à que cela passe)
-   Ouvrez votre .yml et changer la ligne 9 qui donne le nom de l'image.
-   Modifiez également le "login" ligne 13 et créez le dossier 40_MY_WORK à l'endroit correspondant.
      Il permettra de transmettre facilement des fichiers entre votre pc et le docker. 
-   Faites un "docker-compose up -d"

En suivant ce lien vous devez trouver un bureau linux. http://192.168.99.100:6901/vnc.html

Si votre docker n'a pas l'ip 192.168.99.100, il faut la remplacer par l'ip donnée par la commande "docker-machine ip"

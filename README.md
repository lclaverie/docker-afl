# Pré-Requis

Les pré-requis sur la machine hôte sont les suivants :

- [docker](https://www.docker.com/products/overview)
- [docker-compose](https://docs.docker.com/compose/install/)
- configuration DNS correcte dans /etc/docker/daemon.json

## configuration DNS

Avec les droits de root, créer le fichier /etc/docker/daemon.json et y insérer la chaîne suivante :

```
{
    "dns": ["10.33.34.111", "10.33.34.112", "192.168.2.1", "8.8.8.8"]
}
```

## Recommandé : ajouter l'utilisateur courant au groupe `docker`

```
sudo usermod -a -G docker $USER
```

# Installation

Après avoir cloné ce dépôt, y lancer la construction et le démarrage des conteneurs :

```
docker-compose up --build
```

Docker va procéder à l'Installation de tous les conteneurs et tous les lancer. A la fin, le conteneur web-afl répond une 403 sur le port 80 : http://localhost

Pour procéder à la suite des opérations, il est préférable de démarrer un autre terminal pour y lancer les commandes à venir.

## Bases de données

Les bases de données doivent être importées depuis le serveur mabwaf-bdd1. Les scripts  export-all.sh et import-all.sh prennent en charge la récupération des bases et leurs imports dans le conteneur localdb.

```
./export-all.sh
```

```
./import-all.sh
```

## /etc/hosts

Spécifier les nouveaux noms réseaux dans le fichier /etc/hosts

```
127.0.0.1	localhost afl.wkf.net.dev bo.wkf.net.dev ws.wkf.net.dev aflpro.wkf.net.dev

```

# Outils mis à disposition

## Maildev

L'outil Maildev permettant de développer de manière les mails avec un serveur de mails local est disponible à l'adresse :

```
http://localhost:1080
```

## PhpMyAdmin

PhpMyAdmin est disponible via le port 8000.

```
http://localhost:8000/
```

L'utilsateur par défaut est `root`, le mot de passe étant défini directement dans le fichier `docker-compose.yml` (`root` par défaut)

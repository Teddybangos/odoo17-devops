# 🚀 Odoo 17 DevOps — Docker Compose

![Odoo](https://img.shields.io/badge/Odoo-17.0-714B67?style=for-the-badge\&logo=odoo\&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-336791?style=for-the-badge\&logo=postgresql\&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?style=for-the-badge\&logo=docker\&logoColor=white)
![Git](https://img.shields.io/badge/Git-Version_Control-F05032?style=for-the-badge\&logo=git\&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge\&logo=github)

> Projet DevOps personnel visant à déployer et administrer une instance **Odoo 17** conteneurisée avec **PostgreSQL 15**, Docker Compose, volumes persistants et Git/GitHub.

---

## 📋 Table des matières

* [Présentation](#-présentation)
* [Objectifs](#-objectifs)
* [Architecture](#-architecture)
* [Technologies](#-technologies)
* [Structure du projet](#-structure-du-projet)
* [Prérequis](#-prérequis)
* [Configuration](#-configuration)
* [Installation](#-installation)
* [Accès à Odoo](#-accès-à-odoo)
* [Gestion Docker](#-gestion-docker)
* [Base de données](#-base-de-données)
* [Sauvegarde et restauration](#-sauvegarde-et-restauration)
* [Sécurité](#-sécurité)
* [Dépannage](#-dépannage)
* [Roadmap DevOps](#-roadmap-devops)
* [Compétences développées](#-compétences-développées)
* [Auteur](#-auteur)

---

# 📌 Présentation

Ce projet consiste à mettre en place une architecture conteneurisée pour **Odoo 17** avec **PostgreSQL 15**.

L'objectif est de reproduire une approche proche d'un environnement professionnel :

* séparation des services ;
* communication entre conteneurs ;
* persistance des données ;
* gestion de la configuration ;
* sauvegardes PostgreSQL ;
* versionnement avec Git ;
* hébergement du projet sur GitHub ;
* préparation à l'intégration CI/CD.

Le projet constitue une base pratique pour évoluer progressivement vers une architecture **Cloud / DevOps**.

---

# 🎯 Objectifs

Les principaux objectifs sont :

* Déployer Odoo 17 avec Docker.
* Utiliser PostgreSQL comme base de données.
* Comprendre Docker Compose.
* Mettre en place des volumes persistants.
* Configurer un réseau Docker dédié.
* Mettre en place des sauvegardes PostgreSQL.
* Versionner l'infrastructure avec Git.
* Publier le projet sur GitHub.
* Préparer une pipeline CI/CD.
* Préparer ultérieurement un déploiement Cloud.

---

# 🏗️ Architecture

```text
                    ┌──────────────────────┐
                    │       Client         │
                    │   Navigateur Web     │
                    └──────────┬───────────┘
                               │
                               │ HTTP :8069
                               ▼
                    ┌──────────────────────┐
                    │      Odoo 17         │
                    │    Container         │
                    │      odoo17           │
                    └──────────┬───────────┘
                               │
                               │ PostgreSQL :5432
                               ▼
                    ┌──────────────────────┐
                    │    PostgreSQL 15     │
                    │      Container       │
                    │    postgres-odoo      │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │    postgres_data     │
                    │   Volume persistant  │
                    └──────────────────────┘


             Docker Network: odoo-network
```

### Flux applicatif

```text
Utilisateur
     │
     ▼
Odoo 17
     │
     ▼
PostgreSQL 15
     │
     ▼
Données persistantes
```

---

# 🧰 Technologies

| Technologie    | Utilisation                      |
| -------------- | -------------------------------- |
| Odoo 17        | ERP / application métier         |
| PostgreSQL 15  | Base de données                  |
| Docker         | Conteneurisation                 |
| Docker Compose | Orchestration locale             |
| Git            | Versionnement                    |
| GitHub         | Hébergement du code              |
| Linux          | Système d'exploitation           |
| Bash           | Administration et automatisation |

---

# 📁 Structure du projet

```text
odoo17-devops/
│
├── compose.yaml
├── .env
├── .env.example
├── .gitignore
├── README.md
│
└── backups/
    ├── teddy07.sql
    └── postgres_backup.sql
```

> ⚠️ Les fichiers `.env` et les sauvegardes SQL ne doivent pas être versionnés sur GitHub.

---

# ⚙️ Prérequis

Avant de commencer, installer :

* Linux Ubuntu/Debian
* Docker
* Docker Compose
* Git
* Un compte GitHub

Vérifier les installations :

```bash
docker --version
docker compose version
git --version
```

---

# 🔐 Configuration

Le projet utilise un fichier `.env` pour les variables d'environnement.

Exemple :

```env
POSTGRES_USER=odoo
POSTGRES_PASSWORD=odoo
POSTGRES_DB=postgres
```

⚠️ Le fichier `.env` est volontairement exclu de Git grâce au `.gitignore`.

Pour un environnement de production, utiliser un mot de passe fort et un gestionnaire de secrets.

---

# 🚀 Installation

## 1. Cloner le projet

```bash
git clone https://github.com/Teddybangos/odoo17-devops.git
cd odoo17-devops
```

## 2. Vérifier la configuration

```bash
docker compose config
```

Cette commande permet de vérifier que le fichier Compose est valide.

## 3. Démarrer les services

```bash
docker compose up -d
```

## 4. Vérifier les conteneurs

```bash
docker compose ps
```

Résultat attendu :

```text
NAME             STATUS
postgres-odoo    Up (healthy)
odoo17           Up
```

## 5. Consulter les logs

```bash
docker compose logs -f
```

Pour uniquement Odoo :

```bash
docker compose logs -f odoo
```

Pour PostgreSQL :

```bash
docker compose logs -f postgres
```

---

# 🌐 Accès à Odoo

Une fois les conteneurs démarrés :

```text
http://localhost:8069
```

Odoo est exposé sur le port :

```text
8069
```

---

# 🐳 Gestion Docker

### Démarrer

```bash
docker compose up -d
```

### Arrêter

```bash
docker compose down
```

### Redémarrer

```bash
docker compose restart
```

### Voir les conteneurs

```bash
docker ps
```

### Voir les volumes

```bash
docker volume ls
```

### Voir les réseaux

```bash
docker network ls
```

### Voir les logs

```bash
docker compose logs -f
```

---

# 🗄️ Base de données

Le projet utilise PostgreSQL 15.

Pour accéder au conteneur PostgreSQL :

```bash
docker exec -it postgres-odoo bash
```

Puis :

```bash
psql -U odoo -d postgres
```

Lister les bases :

```sql
\l
```

Lister les tables :

```sql
\dt
```

Quitter PostgreSQL :

```sql
\q
```

---

# 💾 Sauvegarde et restauration

Les données PostgreSQL sont stockées dans un volume Docker persistant.

## Créer une sauvegarde

Exemple :

```bash
docker exec postgres-odoo \
pg_dump -U odoo -d teddy07 \
> backups/teddy07.sql
```

Vérifier :

```bash
ls -lh backups/
```

---

## Restaurer une base

Créer la base si nécessaire :

```bash
docker exec -it postgres-odoo \
psql -U odoo -d postgres
```

Puis :

```sql
CREATE DATABASE teddy07;
\q
```

Restaurer :

```bash
cat backups/teddy07.sql | \
docker exec -i postgres-odoo \
psql -U odoo -d teddy07
```

---

# 💽 Persistance des données

Le projet utilise plusieurs volumes Docker.

| Volume          | Destination                | Rôle                  |
| --------------- | -------------------------- | --------------------- |
| `postgres_data` | `/var/lib/postgresql/data` | Données PostgreSQL    |
| `odoo-data`     | `/var/lib/odoo`            | Données Odoo          |
| `odoo-config`   | `/etc/odoo`                | Configuration Odoo    |
| `odoo-addons`   | `/mnt/extra-addons`        | Modules personnalisés |

Cette architecture permet de supprimer/recréer les conteneurs sans supprimer automatiquement les données persistantes.

---

# 🔒 Sécurité

Les bonnes pratiques suivantes sont appliquées :

* `.env` exclu de Git ;
* sauvegardes SQL exclues de Git ;
* utilisation de variables d'environnement ;
* séparation Odoo / PostgreSQL ;
* réseau Docker dédié ;
* volumes persistants ;
* healthcheck PostgreSQL ;
* dépendance Odoo → PostgreSQL avec vérification de santé.

### ⚠️ Production

Pour un véritable environnement de production :

* utiliser des secrets sécurisés ;
* ne pas exposer directement PostgreSQL sur Internet ;
* utiliser HTTPS ;
* mettre un reverse proxy Nginx ou Traefik ;
* configurer un firewall ;
* mettre en place des sauvegardes automatisées ;
* surveiller les logs ;
* appliquer les mises à jour de sécurité.

---

# 🛠️ Dépannage

## Odoo ne démarre pas

Vérifier :

```bash
docker compose ps
```

Puis :

```bash
docker compose logs odoo
```

---

## PostgreSQL n'est pas healthy

Vérifier :

```bash
docker compose logs postgres
```

Tester :

```bash
docker exec postgres-odoo \
pg_isready -U odoo -d postgres
```

---

## Port 8069 déjà utilisé

Vérifier :

```bash
sudo ss -lntp | grep 8069
```

Ou :

```bash
docker ps
```

---

## Vérifier le réseau Docker

```bash
docker network inspect odoo-network
```

---

# 🔄 Roadmap DevOps

Le projet sera progressivement amélioré selon la roadmap suivante :

### Phase 1 — Conteneurisation

* [x] Docker
* [x] Docker Compose
* [x] Odoo 17
* [x] PostgreSQL 15
* [x] Volumes persistants
* [x] Réseau Docker
* [x] Healthcheck

### Phase 2 — Versionnement

* [x] Git
* [x] `.gitignore`
* [x] GitHub
* [x] Documentation README

### Phase 3 — CI/CD

* [ ] GitHub Actions
* [ ] Validation automatique
* [ ] Tests
* [ ] Build Docker
* [ ] Docker Hub
* [ ] Déploiement automatique

### Phase 4 — Production

* [ ] Nginx
* [ ] HTTPS / SSL
* [ ] Domaine
* [ ] Firewall
* [ ] Monitoring
* [ ] Sauvegardes automatisées

### Phase 5 — Cloud

* [ ] AWS EC2
* [ ] VPC
* [ ] Security Groups
* [ ] Terraform
* [ ] AWS RDS PostgreSQL
* [ ] S3 pour les sauvegardes
* [ ] CloudWatch
* [ ] Architecture hautement disponible

---

# 📚 Compétences développées

Ce projet permet de pratiquer :

### Linux

* Administration système
* Bash
* Gestion des services
* Gestion des fichiers et permissions

### Docker

* Images
* Containers
* Volumes
* Networks
* Docker Compose
* Healthchecks

### DevOps

* Git
* GitHub
* CI/CD
* Infrastructure as Code
* Automatisation

### Cloud

Préparation à :

* AWS EC2
* AWS RDS
* AWS S3
* VPC
* IAM
* Terraform

---

# 🎓 Objectif professionnel

Ce projet s'inscrit dans une démarche de transition vers les métiers :

* **DevOps Junior**
* **Cloud Engineer Junior**
* **System Administrator**
* **Cloud / DevOps Engineer**

Il constitue également un projet pratique pour démontrer des compétences en **Linux, Docker, Git, CI/CD et Cloud** dans un portfolio professionnel.

---

# 👨‍💻 Auteur

**Teddy Bangos**

Licence Télécommunications & Réseaux
Master DevOps

### Domaines d'intérêt

* Cloud Computing
* DevOps
* AWS
* Docker
* Kubernetes
* Terraform
* Linux
* CI/CD

---

# 📄 Licence

Projet réalisé dans un objectif d'apprentissage, de démonstration technique et de portfolio professionnel.

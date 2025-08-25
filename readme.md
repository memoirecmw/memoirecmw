
<h1 align="center">📚 Mémoire CMW</h1>

<p align="center">
  <a href="https://memoire.mastercmw.com/"><img src="https://img.shields.io/badge/Site%20en%20ligne-mastercmw.com-000?logo=google-chrome&logoColor=white" alt="Site en ligne"></a>
  <img src="https://img.shields.io/github/package-json/v/memoirecmw/memoirecmw?color=blue&label=version" alt="Version">
  <img src="https://img.shields.io/github/license/memoirecmw/memoirecmw?color=green" alt="License">
  <img src="https://img.shields.io/github/last-commit/memoirecmw/memoirecmw?color=orange" alt="Last commit">
</p>

<p align="center">
  Plateforme web de gestion et de suivi des mémoires pour étudiants et enseignants.<br>
  <a href="https://memoire.mastercmw.com/">🌐 Voir le site en ligne</a>
</p>

---

## 🛠️ Stack technique

| Frontend         | Backend | Base de données | Import/Export | Déploiement      |
|------------------|---------|-----------------|--------------|------------------|
| HTML5, CSS3, JS  | PHP 8+  | MySQL/MariaDB   | CSV/SQL      | Serveur mutualisé|

---

## 🚀 Installation & Lancement

### Prérequis

- Serveur local (MAMP, WAMP, XAMPP…)
- Client base de données (phpMyAdmin, Sequel Pro…)
- Fichiers de base de données `.sql` et/ou `.csv`

### Étapes

1. **Cloner le dépôt**
   ```bash
   git clone https://github.com/memoirecmw/memoirecmw.git
   ```
2. **Créer la base de données**
   - Créez une BDD nommée `memoirecmw`
   - Importez le fichier `memoirecmw.sql` (et autres fichiers SQL/CSV selon le besoin)
3. **Configurer la connexion**
   - Vérifiez les identifiants de la BDD dans les fichiers PHP concernés (`includes/`, `connexion.php`, etc.) :
     ```php
     $servername = "localhost";
     $database = "memoirecmw";
     $username = "root";
     $password = "root"; // généralement "root" sous MAMP
     ```
4. **Lancer le site**
   - Placez le dossier sur votre serveur local
   - Accédez à [http://localhost/memoirecmw](http://localhost/memoirecmw) via votre navigateur

---

## 🗂️ Structure du projet

```
memoirecmw/
│
├── css/                     # Feuilles de style
├── font/                    # Polices
├── img/                     # Images (dont logo & preview)
├── includes/                # Fichiers PHP inclus (fonctions, config, etc.)
├── js/                      # Scripts JavaScript
│
├── compte_etudiant.sql
├── connexion.php
├── documentation.php
├── etudiant.csv
├── index.php
├── memoirecmw.sql
├── module_connexion.php
├── profil.php
├── register.php
├── registerEnseignant.php
├── rendu-bibliographie.php
├── rendu-fiche-terrain.php
├── rendu-fiche-validation.php
├── rendu-mini-soutenance.php
├── rendu-plan.php
├── rendu.sql
├── reset.php
├── ressources.php
├── sujet.sql
└── README.md
```

---

## 👤 Auteur.ice.s

- **Xuan-Minh TRAN** — Développement & intégration du site web
- **Sakina DOUIOU** — Design, Conception & CSS


---

## ⚖️ Licence

Ce projet utilise plusieurs licences selon les composants (code, ressources, images).  
Pour plus d’informations, voir [LICENSE.md](https://github.com/memoirecmw/memoirecmw/LICENSE.md).

---

<p align="center">
  <img src="img/preview.png" alt="Aperçu du site" width="60%"/>
</p>

---

N’hésite pas à contribuer, signaler un bug ou proposer des idées d’amélioration !  
Pour toute question, contacte-moi sur GitHub.

---

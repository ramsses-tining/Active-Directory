# Active-Directory
markdown
Active Directory - Déploiement Automatisé 

Domaine
- Nom : aplateforme.io
- NetBIOS : `LAPLATEFORME`

Objectifs
Déployer un contrôleur de domaine Active Directory sur Windows Server 2022 avec :
- Création automatique du domaine `laplateforme.io`
- Import de tous les utilisateurs et groupes à partir d’un fichier `.csv`
- Assignation automatique des utilisateurs à leurs groupes
- Mot de passe par défaut : `Azerty_2025!` (à modifier à la première connexion)

Technologies utilisées
- Windows Server 2022
- PowerShell
- Active Directory DS / Domain Services

 Structure des fichiers


config/
│
├── CreateUsersAndGroups.ps1     # Script principal de création utilisateurs + groupes
├── users.csv                    # Fichier source des données utilisateurs
 Commandes utilisées
 Voir dans le fichier pdf (ram_test) exercice2
Lancement du script d’importation des utilisateurs :
powershell
.\CreateUsersAndGroups.ps1

Vérifications
- Get-ADUser -Filter 
- Get-ADGroup -Filter 

Tous les comptes et groupes sont bien créés dans AD, organisés selon le fichier CSV.

Créé par *Ramsses Tining* - 2025 

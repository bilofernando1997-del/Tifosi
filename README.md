# Tifosi - base de données MySQL

Projet de base de donnée pour le restaurant Tifosi (street-food italien).

## Fichiers

- `creation_tifosi.sql` : crée la base `tifosi`, l'utilisateur `tifosi` et toutes les tables
- `insertion_donnees.sql` : ajoute les données de test
- `backup_tifosi.sql` : sauvegarde complète de la base (structure + données)

## Utilisation

1. Créer la base (avec le compte root) :
```
mysql -u root -p < creation_tifosi.sql
```

2. Insérer les données :
```
mysql -u root -p < insertion_donnees.sql
```

L'utilisateur admin est `tifosi`, mot de passe `Tifosi2026!`

## Backup

Pour faire le backup :
```
mysqldump -u tifosi -p --databases tifosi --no-tablespaces > backup_tifosi.sql
```

Pour restaurer :
```
mysql -u root -p < backup_tifosi.sql
```

## Tables

- client, focaccia, ingredient, marque, boisson, menu
- tables de liaison : comprend (focaccia/ingredient), contient (menu/boisson), achete (client/focaccia), paye (client/menu)

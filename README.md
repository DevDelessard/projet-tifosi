# Tifosi Database

## Fichiers inclus :
- `create_tifosi.sql` : Contient le script pour créer la structure de la base de données.
- `insert_data_tifosi.sql` : Contient le script pour insérer les données de test.
- `backup_tifosi.sql` : Contient une sauvegarde complète (structure et données).

## Instructions :
1. **Créer la base de données :**
   Importez `create_tifosi.sql` dans phpMyAdmin pour créer la structure de la base.

2. **Insérer les données de test :**
   Exécutez `insert_data_tifosi.sql` dans phpMyAdmin pour insérer les données.

3. **Restaurer la base complète :**
   Utilisez `backup_tifosi.sql` si vous souhaitez restaurer la base avec structure et données.

## Remarques :
- Assurez-vous que MySQL est configuré correctement pour éviter des conflits de clés étrangères.
- Vérifiez les contraintes avant de modifier les données.

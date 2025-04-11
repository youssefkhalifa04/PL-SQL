Parfait ! Voici un **README.md** en français pour un dépôt GitHub PL/SQL, qui explique clairement la différence entre les **fonctions stockées**, **fonctions non stockées**, **procédures**, et **triggers**. Ce README est pédagogique, donc idéal si tu veux montrer de la théorie avec des exemples :

---

```markdown
# 📘 Introduction à PL/SQL : Fonctions, Procédures et Triggers

Ce dépôt contient des exemples et des explications autour des concepts fondamentaux de **PL/SQL** dans Oracle, notamment :

- Les **procédures stockées**
- Les **fonctions stockées**
- Les **fonctions non stockées**
- Les **triggers (déclencheurs)**

---

## 🔁 Procédures stockées

Une **procédure stockée** est un bloc PL/SQL nommé, stocké dans la base de données, qui peut effectuer une ou plusieurs opérations, mais **ne retourne pas de valeur directement** (elle peut retourner des résultats via des paramètres OUT).

### ✅ Exemple :
```sql
CREATE OR REPLACE PROCEDURE ajouter_etudiant(
    p_nom IN VARCHAR2,
    p_prenom IN VARCHAR2
) AS
BEGIN
    INSERT INTO etudiants(nom, prenom)
    VALUES (p_nom, p_prenom);
END;
```

### 📌 Appel :
```sql
BEGIN
  ajouter_etudiant('Dupont', 'Jean');
END;
```

---

## 🔢 Fonctions stockées

Une **fonction stockée** est un bloc PL/SQL qui retourne **une valeur unique**. Elle est également stockée dans la base de données et peut être utilisée dans des requêtes SQL (si elle ne contient pas de DML).

### ✅ Exemple :
```sql
CREATE OR REPLACE FUNCTION calcul_age(
    p_date_naissance DATE
) RETURN NUMBER AS
BEGIN
    RETURN FLOOR(MONTHS_BETWEEN(SYSDATE, p_date_naissance) / 12);
END;
```

### 📌 Utilisation :
```sql
SELECT nom, calcul_age(date_naissance) AS age
FROM etudiants;
```

---

## 📄 Fonctions non stockées (anonymes)

Une **fonction non stockée** est simplement un bloc de code PL/SQL (souvent une fonction ou procédure) qui n'est **pas enregistrée** dans la base. Elle est utilisée temporairement, par exemple dans un script.

### ✅ Exemple :
```sql
DECLARE
  FUNCTION dire_bonjour(nom VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN 'Bonjour ' || nom;
  END;
BEGIN
  DBMS_OUTPUT.PUT_LINE(dire_bonjour('Youssef'));
END;
```

---

## ⏰ Triggers (Déclencheurs)

Un **trigger** est un bloc PL/SQL qui s'exécute automatiquement **à la suite d’un événement** (INSERT, UPDATE, DELETE) sur une table ou vue.

### ✅ Exemple :
```sql
CREATE OR REPLACE TRIGGER maj_date_modif
BEFORE UPDATE ON etudiants
FOR EACH ROW
BEGIN
  :NEW.date_modification := SYSDATE;
END;
```

Ce trigger met à jour automatiquement le champ `date_modification` dès qu’un étudiant est modifié.

---

## 📂 Structure du Dépôt

```
.
PL-SQL/
├── README.md
├── les fonction et les procedures/
│   ├── fonction.sql
│   └── procedure.sql
├── revision sql et plSql/
│   ├── revision plSql.sql
│   └── revision sql.sql
└── serie triggers/
    └── trigger.sql

```

---

## 🎓 Objectif pédagogique

Ce projet vise à **comprendre les blocs PL/SQL** et leur utilisation dans Oracle, pour mieux structurer le code côté base de données, améliorer la réutilisabilité, et garantir l’intégrité des données.

---


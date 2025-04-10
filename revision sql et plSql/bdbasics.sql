DECLARE
v_number /*costant*/NUMBER(2)/*NOT NULL*/:=10;
v_char CHAR:='c';
v_chain VARCHAR2(20):='mohsen-tabes-tohsel'
salaire NUMBER(8,2);
v_boolean BOOLEAN/*:=TRUE,FALSE,NULL*/ ;
v_name emp.name%TYPE -- v_name de mem type que name dans le tab emp
v_emp emp%ROWTYPE --v_emp de mem type de ligne de tab emp
--creation d un enregistrement
TYPE enregistrement IS RECORD (nome VARCHAR2(30), matr INTEGER);
enregistr_emp enregistrement;
--creation d un arry/ tab
TYPE tabint IS ARRAY(5) OF NUMBER;
tab tabint;
moch_mawjoud EXCEPTION;
BEGIN
--test conditionnel
IF /*condition*/ THEN /*execution*/;
ELSE IF /*condition*/ THEN /*execution*/;
ELSE/*execution*/;
END IF;
--case 
val :=CASE /*section*/
WHEN /*condition*/ THEN /*execution*/
WHEN /*condition*/ THEN /*execution*/
WHEN /*condition*/ THEN /*execution*/
ELSE /*execution*/
END case;
--while loop
LOOP
/*execution*/
EXIT WHEN /*condition*/;
END LOOP;
-- for loop
FOR /*index*/ in /*index range*/ LOOP
/*execution*/;
END LOOP;
IF /*condition*/v_name=NULL RAISE moch_mawjoud/*nomz exception*/;
EXCEPTION 
WHEN /*nome exeption*/ moch_mawjoud THEN /*execution*/DBMS_OUTPUT.PUT_LINE('maw kolna moch mawjoud')
CREATE OR REPLACE PROCEDURE ex3(seuille IN NUMBER) IS
    CURSOR c IS 
        SELECT employee_id, salary 
        FROM EMPLOYEES 
        WHERE salary > seuille;

    v c%ROWTYPE;
    emp_count NUMBER := 0;

BEGIN
    FOR v IN c LOOP

        DBMS_OUTPUT.PUT_LINE(RPAD(v.employee_id, 10) || ' ' || RPAD(v.salary + 100, 10));

        emp_count := emp_count + 1;
    END LOOP;

    IF emp_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No data found');
    END IF;

EXCEPTION
    WHEN OTHERS THEN

        DBMS_OUTPUT.PUT_LINE('No data found');
END ex3;
/
SET SERVEROUTPUT ON;
DECLARE
    seuille EMPLOYEES.salary%TYPE := &seuille;
BEGIN
    ex3(seuille);
END;
/

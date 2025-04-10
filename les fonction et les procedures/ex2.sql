SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp IS SELECT EMPLOYEE_ID, SALARY FROM EMPLOYEES;

    v c_emp%ROWTYPE; 
    c NUMBER := 0;    
    
    FUNCTION F(x IN EMPLOYEES.salary%TYPE) RETURN EMPLOYEES.salary%TYPE IS
    BEGIN
        RETURN x * 0.2;
    END F;
    

BEGIN
    -- Loop through the cursor
    FOR v IN c_emp LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(v.employee_id, 10) || ' ' || RPAD(v.salary, 10) || ' ' || F(v.salary));
        c := c + 1;  -- Increment counter
    END LOOP;

    -- Raise an exception if no rows are processed
    IF c = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No data found');
    END IF;


EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('No data found');
END;
/

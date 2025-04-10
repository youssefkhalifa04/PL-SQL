CREATE OR REPLACE PROCEDURE test 
IS 
    CURSOR c IS SELECT EMPLOYEE_ID, EMPLOYEE_NAME, SALARY FROM employees;  -- Explicit column names
    v c%ROWTYPE;  -- Cursor row type for accessing columns
    emp_count NUMBER := 0;  -- Renamed to avoid conflict with COUNT
    e EXCEPTION;  -- Exception declaration
BEGIN
    FOR v IN c LOOP
        IF v.SALARY > 3000 THEN 
            DBMS_OUTPUT.PUT_LINE(RPAD(v.EMPLOYEE_ID, 10) || ' ' || RPAD(v.EMPLOYEE_NAME, 10) || ' ' || RPAD(v.SALARY, 10));
        END IF;
        emp_count := emp_count + 1;  -- Increment count
    END LOOP; 

    IF emp_count = 0 THEN
        RAISE e;  -- Raise exception if no records
    END IF;

EXCEPTION
    WHEN e THEN
        DBMS_OUTPUT.PUT_LINE('No data found');
END test;
/


set serveroutput on;

begin 
    test;
end;
/
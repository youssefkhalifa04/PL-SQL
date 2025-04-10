SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE ex4(department_id IN NUMBER) IS
    CURSOR c_emp IS 
        SELECT salary 
        FROM employees 
        WHERE department_id = department_id;

    v c_emp%ROWTYPE;

    total_salary NUMBER := 0;
    emp_count NUMBER := 0;
    avg_salary NUMBER;

    no_data_found EXCEPTION;

BEGIN
    FOR v IN c_emp LOOP
        total_salary := total_salary + v.salary;
        emp_count := emp_count + 1;
    END LOOP;

    IF emp_count = 0 THEN
        RAISE no_data_found;
    END IF;

    avg_salary := total_salary / emp_count;

    DBMS_OUTPUT.PUT_LINE('Department ID: ' || department_id);
    DBMS_OUTPUT.PUT_LINE('Average Salary: ' || avg_salary);

EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Department ID: ' || department_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred');
END ex4;
/
DECLARE
    department_id EMPLOYEES.department_id%TYPE := &department_id;
BEGIN
    ex4(department_id);
END;
/

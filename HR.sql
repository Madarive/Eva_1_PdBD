SET SERVEROUTPUT ON
DECLARE
    v_sal_min   NUMBER;
    v_sal_max   NUMBER;
    v_sal_total NUMBER;
    v_sal_prom  NUMBER;
    v_num_emp   NUMBER;
    v_fecha     VARCHAR2(10);
BEGIN
    SELECT TO_CHAR(SYSDATE, 'DD/MM/YY') INTO v_fecha FROM DUAL;
    SELECT MIN(salary), MAX(salary), SUM(salary), ROUND(AVG(salary)), COUNT(*)
    INTO v_sal_min, v_sal_max, v_sal_total, v_sal_prom, v_num_emp
    FROM employees
    WHERE salary > 8000;
    DBMS_OUTPUT.PUT_LINE('INFORME DE LA EMPRESA' || ' ' || v_fecha);
    DBMS_OUTPUT.PUT_LINE('Salario Máximo' || RPAD(' ', 35 - LENGTH('Salario Máximo'), ' ') || TO_CHAR(v_sal_max, '$999,999'));
    DBMS_OUTPUT.PUT_LINE('Salario Promedio' || RPAD(' ', 35 - LENGTH('Salario Promedio'), ' ') || TO_CHAR(v_sal_prom, '$999,999'));
    DBMS_OUTPUT.PUT_LINE('Salario Mínimo' || RPAD(' ', 35 - LENGTH('Salario Mínimo'), ' ') || TO_CHAR(v_sal_min, '$999,999'));
    DBMS_OUTPUT.PUT_LINE('Salario Total' || RPAD(' ', 35 - LENGTH('Salario Total'), ' ' )|| TO_CHAR(v_sal_total, '$999,999'));
    DBMS_OUTPUT.PUT_LINE('Los valores calculados están efectuados sobre' || ' ' || v_num_emp || ' ' || 'empleados.');
END;
/
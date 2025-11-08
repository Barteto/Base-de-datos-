-- Punto 3
CREATE PROCEDURE VerCuentas()
    SELECT numero_cuenta, saldo
    FROM cuentas;
    
CALL VerCuentas();
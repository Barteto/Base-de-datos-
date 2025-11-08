-- Punto 4
DELIMITER $$

CREATE PROCEDURE CuentasConSaldoMayorQue(IN limite DECIMAL(10,2))
BEGIN
    SELECT 
        c.numero_cuenta,
        cl.nombre AS nombre_cliente,
        cl.apellido AS apellido_cliente,
        c.saldo
    FROM cuentas c
    INNER JOIN clientes cl ON c.numero_cliente = cl.numero_cliente
    WHERE c.saldo > limite
    ORDER BY c.saldo DESC;
END$$

DELIMITER ;
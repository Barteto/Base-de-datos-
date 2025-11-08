-- Punto 6
DELIMITER $$

CREATE PROCEDURE Depositar(IN cuenta INT, IN monto DECIMAL(10,2))
BEGIN

    UPDATE cuentas
    SET saldo = saldo + monto
    WHERE numero_cuenta = cuenta;
END$$

DELIMITER ;
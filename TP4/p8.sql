-- Punto 8
DELIMITER $$

CREATE TRIGGER ActualizarSaldo
AFTER INSERT ON movimientos
FOR EACH ROW
BEGIN
    IF NEW.tipo IN ('CREDITO', 'credito') THEN
        UPDATE cuentas
        SET saldo = saldo + NEW.importe
        WHERE numero_cuenta = NEW.numero_cuenta;
    ELSEIF NEW.tipo IN ('DEBITO', 'debito') THEN
        UPDATE cuentas
        SET saldo = saldo - NEW.importe
        WHERE numero_cuenta = NEW.numero_cuenta;
    END IF;
END$$

DELIMITER ;

-- test 
SELECT * FROM cuentas WHERE numero_cuenta = 1001;


INSERT INTO movimientos (numero_cuenta, fecha, tipo, importe)
VALUES (1001, CURDATE(), 'CREDITO', 500);


INSERT INTO movimientos (numero_cuenta, fecha, tipo, importe)
VALUES (1001, CURDATE(), 'DEBITO', 200);

SELECT * FROM cuentas WHERE numero_cuenta = 1001;
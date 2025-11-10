DELIMITER $$

CREATE TRIGGER ActualizarSaldo
AFTER INSERT ON movimientos
FOR EACH ROW
BEGIN
    DECLARE saldo_anterior DECIMAL(10,2);

    
    SELECT saldo INTO saldo_anterior
    FROM cuentas
    WHERE numero_cuenta = NEW.numero_cuenta;

   
    IF NEW.tipo IN ('CREDITO', 'credito') THEN
        UPDATE cuentas
        SET saldo = saldo + NEW.importe
        WHERE numero_cuenta = NEW.numero_cuenta;
    ELSEIF NEW.tipo IN ('DEBITO', 'debito') THEN
        UPDATE cuentas
        SET saldo = saldo - NEW.importe
        WHERE numero_cuenta = NEW.numero_cuenta;
    END IF;


    INSERT INTO historial_movimientos (
        id, numero_cuenta, numero_movimiento, saldo_anterior, saldo_actual
    )
    VALUES (
        (SELECT IFNULL(MAX(id),0)+1 FROM historial_movimientos),  
        NEW.numero_cuenta,
        NEW.id_movimiento,
        saldo_anterior,
        (SELECT saldo FROM cuentas WHERE numero_cuenta = NEW.numero_cuenta)
    );
END$$

DELIMITER ;

-- Punto 11
DELIMITER $$

CREATE PROCEDURE AplicarInteres(
    IN p_porcentaje DECIMAL(5,2),
    IN p_saldoMin DECIMAL(10,2)
)
BEGIN
    -- Declaración de variables
    DECLARE v_numCuenta INT;
    DECLARE v_saldoActual DECIMAL(10,2);
    DECLARE fin_cursor BOOLEAN DEFAULT FALSE;

    -- Cursor para recorrer las cuentas que superen el saldo mínimo
    DECLARE curCuentas CURSOR FOR
        SELECT numero_cuenta, saldo
        FROM cuentas
        WHERE saldo > p_saldoMin;

    -- Handler para detectar fin del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor = TRUE;

    -- Abro el cursor
    OPEN curCuentas;

    leer: LOOP
        FETCH curCuentas INTO v_numCuenta, v_saldoActual;

        IF fin_cursor THEN
            LEAVE leer;
        END IF;

        -- Aplico el porcentaje de interés
        UPDATE cuentas
        SET saldo = saldo + (saldo * (p_porcentaje / 100))
        WHERE numero_cuenta = v_numCuenta;
    END LOOP;

    -- Cierro el cursor
    CLOSE curCuentas;
END$$

DELIMITER ;

-- Test
SELECT numero_cuenta, saldo FROM cuentas WHERE saldo > 100000;

CALL AplicarInteres(2, 100000);

SELECT numero_cuenta, saldo FROM cuentas WHERE saldo > 100000;

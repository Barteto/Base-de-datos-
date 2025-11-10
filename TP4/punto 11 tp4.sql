-- Punto 11
DELIMITER $$

CREATE PROCEDURE AplicarInteres(
    IN p_porcentaje DECIMAL(5,2),
    IN p_saldoMin DECIMAL(10,2)
)
BEGIN
   
    DECLARE v_numCuenta INT;
    DECLARE v_saldoActual DECIMAL(10,2);
    DECLARE fin_cursor BOOLEAN DEFAULT FALSE;

  
    DECLARE curCuentas CURSOR FOR
        SELECT numero_cuenta, saldo
        FROM cuentas
        WHERE saldo > p_saldoMin;


    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor = TRUE;

    OPEN curCuentas;

    leer: LOOP
        FETCH curCuentas INTO v_numCuenta, v_saldoActual;

        IF fin_cursor THEN
            LEAVE leer;
        END IF;

     
        UPDATE cuentas
        SET saldo = saldo + (saldo * (p_porcentaje / 100))
        WHERE numero_cuenta = v_numCuenta;
    END LOOP;


    CLOSE curCuentas;
END$$

DELIMITER ;

-- Test
SELECT numero_cuenta, saldo FROM cuentas WHERE saldo > 100000;

CALL AplicarInteres(2, 100000);

SELECT numero_cuenta, saldo FROM cuentas WHERE saldo > 100000;

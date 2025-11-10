-- Punto 10
DELIMITER $$

CREATE PROCEDURE TotalMovimientosDelMes(
    IN p_cuenta INT,
    OUT p_total DECIMAL(10,2)
)
BEGIN
    -- Declaración de variables locales
    DECLARE v_importe DECIMAL(10,2);
    DECLARE v_tipo ENUM('CREDITO', 'DEBITO');
    DECLARE fin_cursor BOOLEAN DEFAULT FALSE;

    -- Cursor para recorrer los movimientos del mes actual de la cuenta recibida
    DECLARE curMov CURSOR FOR
        SELECT tipo, importe
        FROM movimientos
        WHERE numero_cuenta = p_cuenta
          AND MONTH(fecha) = MONTH(CURDATE())
          AND YEAR(fecha) = YEAR(CURDATE());

    -- Handler que detecta el final del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor = TRUE;

    -- Inicializo el total
    SET p_total = 0;

    -- Abro el cursor
    OPEN curMov;

    leer: LOOP
        FETCH curMov INTO v_tipo, v_importe;

        IF fin_cursor THEN
            LEAVE leer;
        END IF;

        -- Sumo o resto según el tipo de movimiento
        IF UPPER(v_tipo) = 'CREDITO' THEN
            SET p_total = p_total + v_importe;
        ELSEIF UPPER(v_tipo) = 'DEBITO' THEN
            SET p_total = p_total - v_importe;
        END IF;
    END LOOP;

    -- Cierro el cursor
    CLOSE curMov;
END$$

DELIMITER ;

-- Test
SET @totalMes := 0;
CALL TotalMovimientosDelMes(1001, @totalMes);
SELECT @totalMes AS Total_Movimientos_Mes;

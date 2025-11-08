-- Punto 7
DELIMITER $$
CREATE PROCEDURE Extraer (IN p_cuenta INT, IN p_monto DECIMAL(10,2))
BEGIN
	DECLARE saldo_actual DECIMAL(10,2);
    DECLARE nuevo_saldo DECIMAL(10,2);
    DECLARE id_mov INT;
    DECLARE next_hist_id INT;
    
    -- traigo saldo
    SELECT saldo 
	INTO saldo_actual
    FROM cuentas
    WHERE numero_cuenta=p_cuenta
    FOR UPDATE ;
    
    IF saldo_actual IS NULL THEN
        SELECT 'La cuenta no existe' AS mensaje;
    ELSEIF saldo_actual < p_monto THEN
		SELECT 'Fondos insuficientes' AS mensaje;
    ELSE
		SET nuevo_saldo = saldo_actual - p_monto;
        
	UPDATE cuentas   
	SET saldo = nuevo_saldo
	WHERE numero_cuenta = p_cuenta;
        
	 INSERT INTO movimientos (numero_cuenta, fecha, tipo, importe)
        VALUES (p_cuenta, CURDATE(), 'DEBITO', p_monto);
        
	SET id_mov = LAST_INSERT_ID();
    
    -- saco el max xq la tabla no tiene AUTO INCREMENT
    SELECT IFNULL(MAX(id), 0) + 1
        INTO next_hist_id
        FROM historial_movimientos;
        
	INSERT INTO historial_movimientos (
            id, numero_cuenta, numero_movimiento, saldo_anterior, saldo_actual
        ) VALUES (
            next_hist_id, p_cuenta, id_mov, saldo_actual, nuevo_saldo
        );
    END IF;
END $$

DELIMITER ;

-- Ejemplo
CALL Extraer(1001, 200.00);

-- Punto 5
DELIMITER $$

CREATE PROCEDURE TotalMovimientosDelMe(
    IN p_cuenta INT,
    OUT p_total DECIMAL(10,2)
)
BEGIN
    SELECT 
        COALESCE(SUM(
            CASE 
                WHEN UPPER(m.tipo) = 'CREDITO' THEN m.importe
                WHEN UPPER(m.tipo) = 'DEBITO' THEN -m.importe
                ELSE 0
            END
        ), 0)
    INTO p_total
    FROM movimientos m 
    JOIN cuentas c ON c.numero_cuenta = m.numero_cuenta
    WHERE c.numero_cuenta = p_cuenta
      AND MONTH(m.fecha) = MONTH(CURDATE())
      AND YEAR(m.fecha) = YEAR(CURDATE());
END $$

DELIMITER ;

SET @Movimientos := 0;
CALL TotalMovimientosDelMe(1001, @Movimientos);
SELECT @Movimientos AS Movimientos_Cuenta;

    
    
    
       
	
        



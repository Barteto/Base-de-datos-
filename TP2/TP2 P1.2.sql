-- USANDO JOIN
-- ¿Qué socios tienen barcos amarrados en un número de amarre mayor que 10?
SELECT s.nombre
FROM Socios s
JOIN Barcos b  ON s.id_socio = b.id_socio
WHERE b.numero_amarre > 10

-- ¿Cuáles son los nombres de los barcos y sus cuotas de aquellos barcos cuyo socio se llama 'Juan Pérez'?
SELECT Barcos.nombre,Barcos.cuota
FROM Barcos
JOIN Socios ON Barcos.id_socio = Socios.id_socio
WHERE Socios.nombre = 'Juan Pérez';

-- ¿Cuántas salidas ha realizado el barco con matrícula 'ABC123'?
SELECT COUNT(*) AS cantidad_salidas
FROM Salidas
JOIN Barcos on Salidas.matricula=Barcos.Matricula
WHERE Barcos.matricula="ABC123"

-- Lista los barcos que tienen una cuota mayor a 500 y sus respectivos socios.
SELECT b.nombre AS barco, s.nombre AS socio
FROM Barcos b
JOIN Socios s ON b.id_socio=s.id_socio
where b.cuota > 500;

-- ¿Qué barcos han salido con destino a 'Mallorca'?
SELECT nombre AS nombre_barco
FROM Barcos
JOIN Salidas ON Barcos.matricula = Salidas.matricula
WHERE Salidas.destino = 'Mallorca';

-- ¿Qué patrones (nombre y dirección) han llevado un barco cuyo socio vive en 'Barcelona'?
SELECT sa.patron_nombre,sa.patron_direccion
FROM Salidas sa
JOIN Barcos b ON sa.matricula=b.matricula
JOIN Socios s ON b.id_socio=s.id_socio
WHERE s.direccion LIKE '%Barcelona%';

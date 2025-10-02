-- ¿Cuál es el nombre y la dirección de los procuradores que han trabajado en un asunto abierto?
SELECT p.nombre,p.direccion
FROM Procuradores p
JOIN Asuntos_Procuradores ap ON p.id_procurador=ap.id_procurador
JOIN Asuntos a ON ap.numero_expediente = a.numero_expediente
WHERE a.estado = 'Abierto';

-- ¿Qué clientes han tenido asuntos en los que ha participado el procurador Carlos López?
Select Clientes.nombre 
FROM Clientes 
JOIN Asuntos ON Clientes.dni = Asuntos.dni_cliente
JOIN Asuntos_Procuradores ON Asuntos.numero_expediente = Asuntos_Procuradores.numero_expediente
JOIN Procuradores ON Asuntos_Procuradores.id_procurador = Procuradores.id_procurador
WHERE Procuradores.nombre = 'Carlos López';

-- ¿Cuántos asuntos ha gestionado cada procurador?
SELECT p.nombre, COUNT(ap.numero_expediente) AS cantidad_asuntos
FROM Procuradores p
JOIN Asuntos_Procuradores ap ON p.id_procurador=ap.id_procurador
GROUP BY p.nombre;

-- Lista los números de expediente y fechas de inicio de los asuntos de los clientes que viven en Buenos Aires.
SELECT a.numero_expediente, a.fecha_inicio
FROM Asuntos a
JOIN Clientes c ON a.dni_cliente=c.dni
WHERE c.direccion LIKE '%Buenos Aires%'
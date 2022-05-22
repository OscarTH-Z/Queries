
#1.¿Cual es el nombre del aeropuerto que ha tenido mayor movimiento durante el año?
SELECT NOMBRE_AEROPUERTO FROM AEROPUERTOS WHERE ID_AEROPUERTO IN (
	SELECT ID_AEROPUERTO
	FROM VUELO
	GROUP BY ID_AEROPUERTO
	HAVING COUNT(*) = 
	(
		SELECT MAX(total_movimientos) FROM (
			SELECT 
				ID_AEROPUERTO,
				COUNT(*) AS total_movimientos
			FROM VUELO
			GROUP BY 1
			ORDER BY 2 DESC
			LIMIT 1
		) AS conteo
	)	
);

#2.¿Cual es el nombre de la aerolinea que ha realizado mayor numero de vuelos durante el año?
SELECT NOMBRE_AEROLINEA FROM AEROLINEA WHERE ID_AEROLINEA IN (
	SELECT ID_AEROLINEA
	FROM VUELO
	GROUP BY ID_AEROLINEA
	HAVING COUNT(*) = 
	(
		SELECT MAX(total_movimientos) FROM (
			SELECT 
				ID_AEROLINEA,
				COUNT(*) AS total_movimientos
			FROM VUELO
			GROUP BY 1
			ORDER BY 2 DESC
			LIMIT 1
		) AS conteo
	)	
);

#3.¿Em que dia se ha tenido mayor numero de vuelos?
SELECT DIA
FROM VUELO
GROUP BY DIA
HAVING COUNT(*) = 
(
	SELECT MAX(total_movimientos) FROM (
		SELECT 
			DIA,
			COUNT(*) AS total_movimientos
		FROM VUELO
		GROUP BY 1
		ORDER BY 2 DESC
		LIMIT 1
	) AS conteo
);

#4.¿Cuales son las aerolineas que tienen mas de dos vuelos por dia?
SELECT NOMBRE_AEROLINEA FROM AEROLINEA WHERE ID_AEROLINEA IN(
SELECT ID_AEROLINEA
FROM VUELO
GROUP BY ID_AEROLINEA, DIA
HAVING COUNT(ID_AEROLINEA) > 2);

        

        

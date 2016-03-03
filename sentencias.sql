-- Uso de comodines en sentencia con LIKE en Mysql

SELECT * FROM usuarios WHERE login LIKE "admin%"
-- obtenemos los registros cuyo login comience con ‘admin’ y continúe con 0 o más caracteres.
-- En nuestro caso: ‘admin’, ‘admin1’, ‘admin2’, ‘admin_3’, ‘admin_4’ y ‘administrador’ (todos los registros).

SELECT * FROM usuarios WHERE login LIKE "admin_"
-- obtenemos los registros cuyo login comience con ‘admin’ y tenga un único carácter a continuación.
-- En nuestro caso: ‘admin1’ y ‘admin2’ (requiere que exista un único carácter luego del texto ‘admin’).


-- Qué sucede si quisiéramos obtener los registros cuyo login comience con ‘admin_’ (tienen un guión bajo luego del texto ‘admin’
SELECT * FROM usuarios WHERE login LIKE "admin_%"
-- obtenemos los registros cuyo login comience con ‘admin’, tenga un carácter a continuación y luego 0 o más caracteres.
-- En nuestro caso: ‘admin1’, ‘admin2’, ‘admin_3’, ‘admin_4’ y ‘administrador’.

-- Asignacion de variables
SET variable = (SELECT COUNT (*) FROM Tabla);
SELECT nombre INTO @mivariable FROM una_tabla WHERE id = 1;

SELECT @variable:= campo FROM  TABLA WHERE campo='algun valor'
DELETE FROM TABLA WHERE campo= @variable
-- Uno de los usos más comunes es la de almacenar el resultado del ultimo indice creado en una tabla.
SELECT @id := LAST_INSERT_ID();

SET @suma = 4 + 7;
SELECT @SUM;

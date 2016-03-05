-- VISTAS
/*
 * Una vista es una relación virtual, especificada con una instrucción SELECT de sql. No es una tabla temporal. En lugar de ello
 * el DBMS fusiona la definición de vista con el resto de cualquiera intruccioón de SQL en donde aparece, lo cual  resulta en
 * una nueva expresión que comprende sólo las tablas base. Cualquier cambio en estas últimas se refleja de inmediato en la vista
 * las tablas reales son tablas Base(posee una representación concreta), y las vistas son tablas virtuales.
 * Formato general de la instrucción
 * CREATE VIEW NOMBRE_VISTA AS ( INSTRUCCION SELECT SQL)
 */


 CREATE TABLE usuarios(
   id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
   nombre varchar(40) NOT NULL,
   rango varchar (50) NOT NULL
 ) ENGINE=INNODB;

 INSERT INTO usuarios VALUES (null, 'Andrés', 'novato');
 INSERT INTO usuarios VALUES (null, 'Luís', 'medio');
 INSERT INTO usuarios VALUES (null, 'Juan', 'experto');

 CREATE TABLE comentarios(
   id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
   usuario_id int(11) NOT NULL,
   titulo varchar(40) NOT NULL,
   comentario varchar (50) NOT NULL,
   FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
 ) ENGINE=INNODB;

 INSERT INTO comentarios VALUES (null, 1, 'titulo 1', 'comentario 1');
 INSERT INTO comentarios VALUES (null, 2, 'titulo 2', 'comentario 2');
 INSERT INTO comentarios VALUES (null, 3, 'titulo 3', 'comentario 3');

SELECT nombre, rango, titulo, comentario
FROM usuarios
  INNER JOIN comentarios
  ON usuarios.id = comentarios.usuario_id

CREATE VIEW usuarios_comentarios AS
  SELECT usuarios.id,nombre, rango, titulo, comentario
  FROM usuarios
    INNER JOIN comentarios
    ON usuarios.id = comentarios.usuario_id;

SELECT * FROM usuarios_comentarios;

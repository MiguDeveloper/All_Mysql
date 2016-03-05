-- VISTAS
/*
 * Una vista es una relación virtual, especificada con una instrucción SELECT de sql. No es una tabla temporal. En lugar de ello
 * el DBMS fusiona la definición de vista con el resto de cualquiera intruccioón de SQL en donde aparece, lo cual  resulta en
 * una nueva expresión que comprende sólo las tablas base
 * las tablas reales son tablas Base(posee una representación concreta), y las vistas son tablas virtuales
 * Formato general de la instrucción
 * CREATE VIEW NOMBRE_VISTA AS ( INSTRUCCION SELECT SQL)

 */

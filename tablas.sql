DROP TABLE IF EXISTS IMP_USUARIO_PROCESO;
CREATE TABLE IMP_USUARIO_PROCESO (
  ID_REGISTRO INT NOT NULL AUTO_INCREMENT,

  ID_EMPRESA INT,
  ID_USUARIO INT NULL,
  ID_CONFIGURACION_CAMPOS INT NULL,
  TIPO_IMPRESORA INT NULL,
  IP_NOMBRE VARCHAR(100) NULL,

  PRIMARY KEY(ID_REGISTRO)
);

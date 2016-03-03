
-- EJEMPLO DE UN SOLO CURSOR

BEGIN
  DECLARE v_foo INT;
  DECLARE no_more_rows BOOLEAN:= FALSE;     -- variable de control del loop
  DECLARE cursor1 CURSOR FOR                -- definimos el cursor
    SELECT col1 FROM table;                 -- le asignamos una consulta

  DECLARE CONTINUE HANDLER FOR NOT FOUND    -- Capturamos el final del cursor y cambiamos la variable de control
    set no_more_rows := TRUE;

  OPEN cursor1;                             -- Ejecutamos la query del cursor
  LOOP1: loop

    fetch cursor1 into v_foo;               -- Mapeamos la actual tupla en variables
      if no_more_rows then
        close cursor1;
        leave LOOP1;
      end if;

      --
      -- Codigo del procedimiento
      --
  end loop LOOP1;
end;

-- EJEMPLO DE CURSORES ANIDADOS

BEGIN
  DECLARE no_more_rows BOOLEAN DEFAULT false;
  DECLARE v_col1 INT;
  DECLARE v_col2 INT;
  DECLARE cursor1 CURSOR FOR        -- Declaramos el primer cursor
    SELECT col1 FROM table;

  DECLARE cursor2 CURSOR FOR        -- Declaramos el segundo cursor
    SELECT col2 FROM table2;

  DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET v_done := true;                     -- Importante solo usar una y ponerla en cero luego de terminar un loop

  OPEN cursor1;
  LOOP1: LOOP
    FETCH cursor1 INTO v_col1;
    IF v_done THEN
      CLOSE cursor1;
      LEAVE LOOP1;
    END IF;

    OPEN cursor2;
    LOOP2: LOOP
      FETCH cursor2 INTO v_col2;
        IF v_done THEN
          SET v_done := false;
          CLOSE cursor2;
          LEAVE LOOP2;
        END IF;
    END LOOP LOOP2;
  END LOOP LOOP1;
END;

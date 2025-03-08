/////// Insertar Datos Aleatorios en Clientes
DECLARE @i INT = 1;
WHILE @i <= 20
BEGIN
    INSERT INTO Clientes (Nombre, Email, FechaNacimiento)
    VALUES (
        'Cliente' + CAST(@i AS VARCHAR(10)), 
        'cliente' + CAST(@i AS VARCHAR(10)) + '@correo.com',
        DATEADD(DAY, - (RAND() * 10000), GETDATE()) -- Fecha de nacimiento aleatoria
    );
    SET @i = @i + 1;
END;
GO

////Insertar Cuentas Aleatorias

DECLARE @ClienteID INT, @Random INT;
DECLARE cuentas_cursor CURSOR FOR SELECT ClienteID FROM Clientes;

OPEN cuentas_cursor;
FETCH NEXT FROM cuentas_cursor INTO @ClienteID;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Generar entre 1 y 3 cuentas por cliente
    SET @Random = 1 + CAST(RAND() * 3 AS INT);

    WHILE @Random > 0
    BEGIN
        INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo)
        VALUES (@ClienteID, CASE WHEN RAND() > 0.5 THEN 'Ahorro' ELSE 'Corriente' END, RAND() * 10000);

        SET @Random = @Random - 1;
    END;

    FETCH NEXT FROM cuentas_cursor INTO @ClienteID;
END;

CLOSE cuentas_cursor;
DEALLOCATE cuentas_cursor;
GO

//// Insertar Transacciones Aleatorias
DECLARE @CuentaID INT, @Random INT;
DECLARE cuentas_cursor CURSOR FOR SELECT CuentaID FROM Cuentas;

OPEN cuentas_cursor;
FETCH NEXT FROM cuentas_cursor INTO @CuentaID;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Generar entre 5 y 15 transacciones por cuenta
    SET @Random = 5 + CAST(RAND() * 10 AS INT);

    WHILE @Random > 0
    BEGIN
        INSERT INTO Transacciones (CuentaID, Tipo, Monto, Fecha)
        VALUES (
            @CuentaID, 
            CASE WHEN RAND() > 0.5 THEN 'Ingreso' ELSE 'Retiro' END, 
            RAND() * 500, 
            DATEADD(DAY, - (RAND() * 365), GETDATE())
        );

        SET @Random = @Random - 1;
    END;

    FETCH NEXT FROM cuentas_cursor INTO @CuentaID;
END;

CLOSE cuentas_cursor;
DEALLOCATE cuentas_cursor;
GO


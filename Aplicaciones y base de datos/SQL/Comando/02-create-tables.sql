USE BancoSeguridad;
GO

-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    FechaNacimiento DATE
);
GO

-- Tabla de Cuentas
CREATE TABLE Cuentas (
    CuentaID INT IDENTITY(1000,1) PRIMARY KEY,
    ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
    TipoCuenta VARCHAR(50) CHECK (TipoCuenta IN ('Ahorro', 'Corriente')),
    Saldo DECIMAL(10,2) DEFAULT 0.00
);
GO

-- Tabla de Transacciones
CREATE TABLE Transacciones (
    TransaccionID INT IDENTITY(1,1) PRIMARY KEY,
    CuentaID INT FOREIGN KEY REFERENCES Cuentas(CuentaID),
    Tipo VARCHAR(10) CHECK (Tipo IN ('Ingreso', 'Retiro')),
    Monto DECIMAL(10,2) NOT NULL,
    Fecha DATETIME DEFAULT GETDATE()
);
GO

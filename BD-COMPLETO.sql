CREATE DATABASE ProjectUrba

use ProjectUrba

CREATE TABLE ROLES (
	RolID INT IDENTITY (1,1),
	CONSTRAINT PK_RolID PRIMARY KEY (RolID),
	RolType VARCHAR(100) NOT NULL,

)

CREATE TABLE ESTADO (
	StatusID INT IDENTITY(1,1),
	CONSTRAINT PK_StatusID PRIMARY KEY (StatusID),
	StatusName VARCHAR(50) NOT NULL
)



CREATE TABLE USUARIO (
	UserID INT IDENTITY (1,1) ,
	CONSTRAINT PK_UserID PRIMARY KEY (UserID),
	UserName VARCHAR (50),
	Email VARCHAR(50) NOT NULL,
	AGE INT  NOT NULL,
	PhoneNumber INT NOT NULL,
	PasswordUser VARCHAR (16) NOT NULL,
	RolID int,
	CONSTRAINT FK_Usuario_ROLES FOREIGN KEY (RolID) REFERENCES ROLES(RolID),
	StatusID int,
	CONSTRAINT FK_Usuario_ESTADO FOREIGN KEY (StatusID) REFERENCES ESTADO(StatusID)
)

CREATE TABLE APARTMENTS (
	ApartmentID INT IDENTITY (1,1) PRIMARY KEY,
	ApartmentNumber VARCHAR (10),
	UserID int,
	CONSTRAINT FK_APARTMENTS_USUARIO FOREIGN KEY (UserID) REFERENCES USUARIO(UserID),
	
)

CREATE TABLE ANNOUNCEMENTS (
	AnnouncID int IDENTITY (1,1),
	CONSTRAINT PK_AnnouncID PRIMARY KEY (AnnouncID),
	Title VARCHAR(200) NOT NULL,
	Descripcion VARCHAR(400) NOT NULL,
	FechaAnun DATE,
	UserID int,
	CONSTRAINT FK_Announcements_Usuario FOREIGN KEY (UserID) REFERENCES USUARIO(UserID),
	StatusID int,
	CONSTRAINT FK_Announcements_Estado FOREIGN KEY (StatusID) REFERENCES ESTADO(StatusID)
)

CREATE TABLE NOTIFICATIONS (
	NotificationID INT IDENTITY(1,1),
	CONSTRAINT PK_NotificationID PRIMARY KEY (NotificationID),
	Mensaje VARCHAR (300) NOT NULL,
	FechaNoti DATE,
	UserID int,
	CONSTRAINT FK_Notifications_Usuario FOREIGN KEY (UserID) REFERENCES USUARIO(UserID),
	StatusID int,
	CONSTRAINT FK_Notifications_Estado FOREIGN KEY (StatusID) REFERENCES ESTADO(StatusID)
)

CREATE TABLE RESERVATION_PLACES (
	ReservationPlacesID INT,
	CONSTRAINT PK_ReservationPlacesID PRIMARY KEY (ReservationPlacesID),
	Place_Name VARCHAR(20) 
)

CREATE TABLE RESERVATION (
	ReservationID INT IDENTITY (1,1),
	CONSTRAINT PK_ReservationID PRIMARY KEY (ReservationID),
	FechaRese DATE,
	ReservationPlacesID int,
	CONSTRAINT FK_Reservation_ReservationPlaces FOREIGN KEY (ReservationPlacesID) REFERENCES RESERVATION_PLACES(ReservationPlacesID),
	UserID int,
	CONSTRAINT FK_Reservation_Usuario FOREIGN KEY (UserID) REFERENCES USUARIO(UserID),
	StatusID int,
	CONSTRAINT FK_Reservation_Estado FOREIGN KEY (StatusID) REFERENCES ESTADO(StatusID)

)

CREATE TABLE REPORTS (
	ReportID INT IDENTITY(1,1),
	CONSTRAINT PK_ReportID PRIMARY KEY (ReportID),
	Descripcion VARCHAR(400) NOT NULL,
	Category VARCHAR(100) NOT NULL,
	FechaRepo DATE,
	StatusID int,
	CONSTRAINT FK_Reports_Estado FOREIGN KEY (StatusID) REFERENCES ESTADO(StatusID),
	UserID int,
	CONSTRAINT FK_Reports_Usuario FOREIGN KEY (UserID) REFERENCES USUARIO(UserID)	
)

CREATE TABLE GUEST_PARKING (
	GuestParkingID INT IDENTITY(1,1),
	CONSTRAINT PK_GuestParkingID PRIMARY KEY (GuestParkingID),
	SpotNumber VARCHAR(10) NOT NULL,
	UserID int,
	CONSTRAINT FK_GuestParking_Usuario FOREIGN KEY (UserID) REFERENCES USUARIO(UserID)
)


	CREATE TABLE VEHICLE (
    VehicleID INT IDENTITY(1,1),
    CONSTRAINT PK_VehicleID PRIMARY KEY (VehicleID),
    PlateNumber VARCHAR(20) NOT NULL,
    Model VARCHAR(25) NOT NULL,
    UserID INT, 
    CONSTRAINT FK_Vehicle_Usuario FOREIGN KEY (UserID) REFERENCES USUARIO(UserID)
)





--LOS INSERT PARA LAS TABLAS

INSERT INTO ROLES (RolType) VALUES
('Admin'), ('Resident'), ('Security'), ('Maintenance'), ('Guest');


INSERT INTO ESTADO (StatusName) VALUES
('Active'), ('Inactive'), ('Suspended'), ('Pending'), ('Banned');

INSERT INTO APARTMENTS (ApartmentNumber) VALUES
('101'), ('102'), ('103'), ('104' ), ('105'),
('201'), ('202'), ('203'), ('204'), ('205'),
('301'), ('302'), ('303'), ('304'), ('305'),
('401'), ('402'), ('403'), ('404'), ('405');



INSERT INTO USUARIO (UserName, Email, AGE, PhoneNumber, PasswordUser, RolID, StatusID) VALUES
('Juan Perez', 'juan@example.com', 30, 1234567, 'pass1234', 1, 1),
('Maria Lopez', 'maria@example.com', 25, 7654321, 'pass2345', 2, 1),
('Carlos Diaz', 'carlos@example.com', 40, 9876543, 'pass3456', 3, 2),
('Ana Torres', 'ana@example.com', 35, 3456789, 'pass4567', 4, 3),
('Pedro Ramos', 'pedro@example.com', 28, 6543210, 'pass5678', 5, 1),
('Laura Gómez', 'laura@example.com', 32, 2345678, 'pass6789', 2, 1),
('Santiago Ruiz', 'santiago@example.com', 27, 8765432, 'pass7890', 3, 1),
('Valeria Mendoza', 'valeria@example.com', 29, 4567890, 'pass8901', 4, 2),
('Fernando Castro', 'fernando@example.com', 33, 5678901, 'pass9012', 5,3),
('Isabela Vega', 'isabela@example.com', 24, 6789012, 'pass0123', 1, 1),
('Luis Herrera', 'luis@example.com', 31, 7890123, 'pass1234', 2, 1),
('Andrea Meza', 'andrea@example.com', 26, 8901234, 'pass2345', 3, 2),
('Ricardo Pineda', 'ricardo@example.com', 38, 9012345, 'pass3456', 4, 3),
('Sofia Martinez', 'sofia@example.com', 22, 9123456, 'pass4567', 5,  1),
('Diego Rojas', 'diego@example.com', 29, 9234567, 'pass5678', 1, 1),
('Natalia Castaño', 'natalia@example.com', 34, 9345678, 'pass6789', 2,  1),
('Miguel Salazar', 'miguel@example.com', 27, 9456789, 'pass7890', 3, 2),
('Camila Peña', 'camila@example.com', 30, 9567890, 'pass8901', 4, 3),
('Javier Núñez', 'javier@example.com', 23, 9678901, 'pass9012', 5, 1),
('Paula Fernández', 'paula@example.com', 26, 9789012, 'pass0123', 2, 1);


INSERT INTO GUEST_PARKING (SpotNumber, UserID) VALUES
('A1', 1), ('B2', 2), ('C3', 3), ('D4', 4), ('E5', 5),
('F6', 6), ('G7', 7), ('H8', 8), ('I9', 9), ('J10', 10),
('K11', 11), ('L12', 12), ('M13', 13), ('N14', 14), ('O15', 15),
('P16', 16), ('Q17', 17), ('R18', 18), ('S19', 19), ('T20', 20);

INSERT INTO VEHICLE (PlateNumber, Model, UserID) VALUES
('ABC123', 'Toyota Corolla', 1),
('DEF456', 'Honda Civic', 2),
('GHI789', 'Ford Focus', 3),
('JKL012', 'Chevrolet Cruze', 4),
('MNO345', 'Hyundai Elantra', 5),
('PQR678', 'Volkswagen Jetta', 6),
('STU901', 'Mazda 3', 7),
('VWX234', 'Nissan Sentra', 8),
('YZA567', 'Kia Forte', 9),
('BCD890', 'Subaru Impreza', 10),
('EFG123', 'Mitsubishi Lancer', 11),
('HIJ456', 'BMW Serie 3', 12),
('KLM789', 'Mercedes-Benz Clase C', 13),
('NOP012', 'Audi A4', 14),
('QRS345', 'Lexus IS', 15),
('TUV678', 'Tesla Model 3', 16),
('WXY901', 'Volvo S60', 17),
('ZAB234', 'Alfa Romeo Giulia', 18),
('CDE567', 'Cadillac ATS', 19),
('FGH890', 'Acura TLX', 20);


INSERT INTO RESERVATION_PLACES(ReservationPlacesID, Place_Name) VALUES 
(1, 'Pool'),
(2, 'SoccerField'),	
(3, 'EventSite'),
(4, 'Park'),
(5, 'Playground');

INSERT INTO ANNOUNCEMENTS (Title, Descripcion, UserID) VALUES
('Bienvenidos','Bienvenidos a la aplicacion dde Urbanizaciones mas grande',2)


--TODOS LOS SELECTS DE LAS TABLAS

SELECT *FROM USUARIO
SELECT *FROM ROLES
SELECT *FROM VEHICLE
SELECT *FROM ESTADO
SELECT *FROM ANNOUNCEMENTS
SELECT *FROM NOTIFICATIONS


--SP 
	
CREATE PROCEDURE InsertarUsuario --funciona
    @UserName VARCHAR(50),
    @Email VARCHAR(50),
    @AGE INT,
    @PhoneNumber VARCHAR(10),
    @PasswordUser VARCHAR(16),
    @RolID INT,
    @StatusID INT
AS
BEGIN
    INSERT INTO USUARIO (UserName, Email, AGE, PhoneNumber, PasswordUser, RolID, StatusID) 
    VALUES (@UserName, @Email, @AGE, @PhoneNumber, @PasswordUser, @RolID, @StatusID);
END;

EXEC InsertarUsuario 'Juans Perez', 'juans@example.com', 30, 1234567, 'pass1234', 1, 1;

CREATE PROCEDURE InsertarApartamento  --funciona
    @ApartmentNumber VARCHAR(10),
    @UserID INT
AS		
BEGIN
    INSERT INTO APARTMENTS (ApartmentNumber, UserID) VALUES (@ApartmentNumber, @UserID);
END;

CREATE PROCEDURE InsertarAnuncio  --funciona
    @Title VARCHAR(200),
    @Descripcion VARCHAR(400),
    @UserID INT,
    @StatusID INT
AS
BEGIN
    INSERT INTO ANNOUNCEMENTS (Title, Descripcion, UserID, StatusID) 
    VALUES (@Title, @Descripcion, @UserID, @StatusID);
END;

CREATE PROCEDURE InsertarNotificacion --FUNCIONA
    @Mensaje VARCHAR(300),
    @UserID INT,
    @StatusID INT
AS
BEGIN
    INSERT INTO NOTIFICATIONS (Mensaje, UserID, StatusID) 
    VALUES (@Mensaje, @UserID, @StatusID);
END;

CREATE PROCEDURE InsertarReserva --FUNCIONA
    @FechaRese DATE,   -- en el sp manual se introduce la fecha con comilla simple para que lo tome como string '2025-03-20'
    @ReservationPlacesID INT,
    @UserID INT,
    @StatusID INT
AS
BEGIN
    INSERT INTO RESERVATION (FechaRese, ReservationPlacesID, UserID, StatusID) 
    VALUES (@FechaRese, @ReservationPlacesID, @UserID, @StatusID);
END;

EXEC InsertarReserva '2025-03-20', 1, 10, 2;

CREATE PROCEDURE InsertarReporte --FUNCIONA
    @Descripcion VARCHAR(400),
    @Category VARCHAR(100),
    @StatusID INT,
    @UserID INT
AS
BEGIN
    INSERT INTO REPORTS (Descripcion, Category, StatusID, UserID) 
    VALUES (@Descripcion, @Category, @StatusID, @UserID);
END;

CREATE PROCEDURE InsertarParqueoInvitado --FUNCIONA
    @SpotNumber VARCHAR(10),
    @UserID INT
AS
BEGIN
    INSERT INTO GUEST_PARKING (SpotNumber, UserID) VALUES (@SpotNumber, @UserID);
END;


CREATE PROCEDURE InsertarVehiculo  --FUNCIONA
    @PlateNumber VARCHAR(20),
    @Model VARCHAR(25),
    @UserID INT
AS
BEGIN
    INSERT INTO VEHICLE (PlateNumber, Model, UserID) 
    VALUES (@PlateNumber, @Model, @UserID);
END;


	CREATE PROCEDURE GetActiveUsers -- obtener usuarios activos
AS
BEGIN
    SELECT UserID, UserName, Email, StatusID
    FROM USUARIO
    WHERE StatusID = 1;
END;                


EXEC GetActiveUsers;

	CREATE PROCEDURE GetInactiveUsers --obtener usuarios inactivos
AS
BEGIN
    SELECT UserID, UserName, Email, StatusID
    FROM USUARIO
    WHERE StatusID = 2;
END;                

EXEC GetInactiveUsers;


CREATE PROCEDURE GetTotalActiveUsers -- total activos
AS
BEGIN
    SELECT COUNT(*) AS TotalActiveUsers
    FROM USUARIO
    WHERE StatusID = 1;
END;

EXEC GetTotalActiveUsers;

CREATE PROCEDURE GetTotalInactiveUsers -- total activos
AS
BEGIN
    SELECT COUNT(*) AS TotalInactiveUsers
    FROM USUARIO
    WHERE StatusID = 2;
END;

EXEC GetTotalInactiveUsers;

CREATE PROCEDURE Nombre_apartamento 
AS
BEGIN
SELECT CONCAT(UserName,' ', ApartmentNumber) AS nombre_and_apartamento FROM USUARIO, APARTMENTS

WHERE UserName = 'Maria Lopez' ;

END;

EXEC Nombre_apartamento;

CREATE PROCEDURE ActualizarEstadoReserva
    @ReservationID INT,
    @NuevoEstadoID INT
AS
BEGIN
    UPDATE RESERVATION
    SET StatusID = @NuevoEstadoID
    WHERE ReservationID = @ReservationID;
END;


CREATE PROCEDURE EliminarVehiculoPorPlaca
    @PlateNumber VARCHAR(20)
AS
BEGIN
    DELETE FROM VEHICLE
    WHERE PlateNumber = @PlateNumber;
END;






--TRIGGERS

CREATE TRIGGER InsteadOfDeleteUsuario --para colocar un usuario en estado inactivo
ON USUARIO
INSTEAD OF DELETE
AS
BEGIN
    -- Actualizar el StatusID del usuario a 'Inactive' en lugar de eliminarlo
    UPDATE USUARIO
    SET StatusID = (SELECT StatusID FROM ESTADO WHERE StatusName = 'Inactive')
    FROM USUARIO u
    INNER JOIN DELETED d ON u.UserID = d.UserID;

    PRINT 'El usuario ha sido marcado como Inactivo en lugar de ser eliminado.';
END;

SELECT *FROM USUARIO
DELETE FROM USUARIO WHERE UserID = 5;





--Objetivo: Cada vez que se inserte un nuevo reporte, se creará una notificación para los administradores.
CREATE TRIGGER TR_NotificacionReporte
ON REPORTS
AFTER INSERT
AS
BEGIN
    INSERT INTO NOTIFICATIONS (Mensaje, UserID, StatusID)
    SELECT 
        CONCAT('Nuevo reporte creado: ', i.Descripcion), 
        i.UserID, 
        (SELECT StatusID FROM ESTADO WHERE StatusName = 'Pending')
    FROM INSERTED i;

    PRINT 'Se ha generado una notificación para el reporte nuevo.';
END;



--tabla para saber nuestro registro de cambios de contraseña de usuario 

CREATE TABLE PasswordHistory (
    HistoryID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    OldPassword NVARCHAR(255),
    NewPassword NVARCHAR(255),
    ChangeDate DATETIME DEFAULT GETDATE()
);



-- Trigger para registrar cambios de contraseña
CREATE TRIGGER RecordPasswordChange
ON USUARIO
AFTER UPDATE
AS
BEGIN
    INSERT INTO PasswordHistory (UserID, OldPassword, NewPassword)
    SELECT d.UserID, d.PasswordUser, i.PasswordUser
    FROM DELETED d
    JOIN INSERTED i ON d.UserID = i.UserID;
END;

ALTER TABLE USUARIO
ADD CreatedAt DATETIME;

SELECT *FROM PasswordHistory;
SELECT *FROM USUARIO

UPDATE USUARIO
SET PasswordUser = 'newpassword456'
WHERE UserID = 1;


CREATE TRIGGER TR_BloquearRolAdministrador
ON USUARIO
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM DELETED d
        JOIN ROLES r ON d.RolID = r.RolID
        WHERE r.RolName = 'Administrador'
    )
    BEGIN
        RAISERROR('No se puede eliminar un usuario con rol Administrador.', 16, 1);
    END
    ELSE
    BEGIN
        DELETE FROM USUARIO
        WHERE UserID IN (SELECT UserID FROM DELETED);
    END
END;


ALTER TABLE ANNOUNCEMENTS ADD FechaModificacion DATETIME NULL;

CREATE TRIGGER TR_ActualizarFechaModificacionAnuncio
ON ANNOUNCEMENTS
AFTER UPDATE
AS
BEGIN
    UPDATE ANNOUNCEMENTS
    SET FechaModificacion = GETDATE()
    FROM ANNOUNCEMENTS a
    JOIN INSERTED i ON a.AnnouncID = i.AnnouncID;
END;







--CURSORES
CREATE PROCEDURE notificar_anuncios_recientes
AS
BEGIN
  DECLARE @id_usuario INT;

  -- Cursor para usuarios que no han recibido notificaciones recientes sobre anuncios
  DECLARE cur CURSOR FOR
    SELECT DISTINCT u.UserID
    FROM USUARIO u
    WHERE u.UserID NOT IN (
      SELECT n.UserID
      FROM NOTIFICATIONS n
      WHERE n.Mensaje LIKE '%anuncio nuevo%'
        AND n.FechaNoti > DATEADD(DAY, -7, GETDATE())
    );

  OPEN cur;

  FETCH NEXT FROM cur INTO @id_usuario;

  WHILE @@FETCH_STATUS = 0
  BEGIN
    INSERT INTO NOTIFICATIONS (Mensaje, FechaNoti, UserID, StatusID)
    VALUES (
      'Hay anuncios nuevos que no has revisado. ¡Échales un vistazo!',
      GETDATE(),
      @id_usuario,
      1 -- Estado 'Active'
    );

    FETCH NEXT FROM cur INTO @id_usuario;
  END

  CLOSE cur;
  DEALLOCATE cur;
END

EXEC notificar_anuncios_recientes;

CREATE PROCEDURE notificar_reservas_pendientes
AS
BEGIN
  DECLARE @id_usuario INT;

  -- Cursor para usuarios con reservas en estado "Pending" (StatusID = 4 en ESTADO)
  DECLARE cur CURSOR FOR
    SELECT DISTINCT r.UserID
    FROM RESERVATION r
    WHERE r.StatusID = 4; -- "Pending"

  OPEN cur;

  FETCH NEXT FROM cur INTO @id_usuario;

  WHILE @@FETCH_STATUS = 0
  BEGIN
    INSERT INTO NOTIFICATIONS (Mensaje, FechaNoti, UserID, StatusID)
    VALUES (
      'Tienes una reserva pendiente. Por favor, confírmala o cancélala.',
      GETDATE(),
      @id_usuario,
      1 -- Estado 'Active'
    );

    FETCH NEXT FROM cur INTO @id_usuario;
  END

  CLOSE cur;
  DEALLOCATE cur;
END


CREATE PROCEDURE desactivar_anuncios_antiguos
AS
BEGIN
  DECLARE @id_anuncio INT;

  -- Cursor para anuncios con fecha de publicación mayor a 30 días
  DECLARE cur CURSOR FOR
    SELECT a.AnnouncID
    FROM ANNOUNCEMENTS a
    WHERE a.FechaAnun IS NOT NULL
      AND a.FechaAnun < DATEADD(DAY, -30, GETDATE())
      AND a.StatusID = 1; -- Solo anuncios que estén "Active" actualmente

  OPEN cur;

  FETCH NEXT FROM cur INTO @id_anuncio;

  WHILE @@FETCH_STATUS = 0
  BEGIN
    UPDATE ANNOUNCEMENTS
    SET StatusID = 2 -- "Inactive"
    WHERE AnnouncID = @id_anuncio;

    FETCH NEXT FROM cur INTO @id_anuncio;
  END

  CLOSE cur;
  DEALLOCATE cur;
END


CREATE PROCEDURE EnviarRecordatorioUsuariosInactivos
AS
BEGIN
    DECLARE @UserID INT;

    DECLARE cur CURSOR FOR
    SELECT UserID FROM USUARIO WHERE StatusID = 2;

    OPEN cur;
    FETCH NEXT FROM cur INTO @UserID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO NOTIFICATIONS (Mensaje, FechaNoti, UserID, StatusID)
        VALUES ('Tu cuenta está inactiva. Contáctanos para reactivarla.', GETDATE(), @UserID, 1);

        FETCH NEXT FROM cur INTO @UserID;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;


CREATE PROCEDURE ActualizarEstadosReportesAntiguos
AS
BEGIN
    DECLARE @ReportID INT;

    DECLARE cur CURSOR FOR
    SELECT ReportID FROM REPORTS
    WHERE FechaReporte < DATEADD(DAY, -15, GETDATE())
    AND StatusID = 1;

    OPEN cur;
    FETCH NEXT FROM cur INTO @ReportID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE REPORTS
        SET StatusID = 2
        WHERE ReportID = @ReportID;

        FETCH NEXT FROM cur INTO @ReportID;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;

USE [EMPLEADOS_DB]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 06/06/2023 02:02:23 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](100) NOT NULL,
	[DNI] [varchar](10) NOT NULL,
	[Edad] [int] NOT NULL,
	[Casado] [bit] NOT NULL,
	[Salario] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AltaEmpleado]    Script Date: 06/06/2023 02:02:26 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AltaEmpleado]
@NombreCompleto varchar(50)
,@DNI int
,@Edad int
,@Casado bit
,@Salario decimal

AS
BEGIN

INSERT INTO Empleados
(NombreCompleto
,DNI
,Edad
,Casado
,Salario)

VALUES
(@NombreCompleto
,@DNI
,@Edad
,@Casado
,@Salario)

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarEmpleado]    Script Date: 06/06/2023 02:02:26 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarEmpleado]
@Id int

AS
BEGIN

DELETE FROM Empleados
WHERE Id = @Id;

END


GO
/****** Object:  StoredProcedure [dbo].[ListarEmpleados]    Script Date: 06/06/2023 02:02:26 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarEmpleados] 
     @NombreCompleto varchar(50) = null
AS
BEGIN

SELECT
Id
,NombreCompleto
,DNI
,Edad
,Casado
,Salario

FROM Empleados
WHERE @NombreCompleto is null OR Upper(NombreCompleto) LIKE '%' +  Upper(@NombreCompleto) + '%';

END
GO
/****** Object:  StoredProcedure [dbo].[ModificarEmpleado]    Script Date: 06/06/2023 02:02:26 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarEmpleado]
@Id int
,@NombreCompleto varchar(50)
,@DNI int
,@Edad int
,@Casado bit
,@Salario decimal

AS
BEGIN

UPDATE Empleados
SET NombreCompleto = @NombreCompleto
,DNI = @DNI
,Edad = @Edad
,Casado = @Casado
,Salario = @Salario

WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEmpleado]    Script Date: 06/06/2023 02:02:26 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerEmpleado]
@Id int

AS
BEGIN

SELECT
Id
,NombreCompleto
,DNI
,Edad
,Casado
,Salario

FROM Empleados
WHERE Id = @Id;

END
GO

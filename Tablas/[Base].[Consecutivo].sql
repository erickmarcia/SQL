USE [DB_TEST];
GO

/****** Object:  Table [Base].[Consecutivo]    Script Date: 09/01/2022 02:16:14 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Base].[Consecutivo](
	[idConsecutivo] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](5) NOT NULL,
	[mascara] [varchar](50) NOT NULL,
	[valorInicial] [varchar](50) NOT NULL,
	[valorFinal] [varchar](50) NOT NULL,
	[ultimoValor] [varchar](50) NOT NULL,
	[longitud] [int] NOT NULL,
	[idUsuarioRegistro] [int] NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[idUsuarioModificacion] [int] NULL,
	[fechaModificacion] [datetime] NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_codigo] PRIMARY KEY CLUSTERED 
(
	[idConsecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_codigo_consecutivo] UNIQUE NONCLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Base].[Consecutivo] ADD  CONSTRAINT [DF__Consecuti__fecha__43D61337]  DEFAULT (getdate()) FOR [fechaRegistro]
GO

ALTER TABLE [Base].[Consecutivo] ADD  CONSTRAINT [DF__Consecuti__activ__45BE5BA9]  DEFAULT ((1)) FOR [activo]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave primaria de la tabla codigo. Campo autonum�rico. No permite valores NULL.' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'idConsecutivo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave Unica de la tabla Consecutivo. Campo varhar(5). No permite valores NULL.' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'codigo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mascara que tendra el Consecutivo. Ej. NN-0000. No permite valores NULL. Campo obligatorio. ' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'mascara'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor Inicial con el cual se comenzara el conteo. No permite valores NULL. Campo obligatorio. ' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'valorInicial'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor Final con el cual terminara el conteo. No permite valores NULL. Campo obligatorio. ' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'valorFinal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ltimo consecutivo utlizado No permite valores NULL. Campo obligatorio. ' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'ultimoValor'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Longitud que tendra el Consecutivo, Valor M�ximo de caracteres 50. No permite valores NULL. Campo obligatorio. ' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'longitud'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del Usuario que cre� el registro. No permite valores Null. Llave for�nea. Descripci�n detallada en la tabla Usuarios.' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'idUsuarioRegistro'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se cre� el registro. Corresponde a la fecha del servidor de base de datos. No permite valores Null.' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'fechaRegistro'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del �ltimo usuario que modific� el registro.Permite valores null. Llave for�nea. Descripci�n detallada en la tabla Usuarios.' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'idUsuarioModificacion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ltima fecha en que se modific� el registro. Corresponde a la fecha del servidor de base de datos. Permite valores Null, sin embargo al llenarse el dato UsuarioModificacion debe llenarse �ste tambi�n.' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'fechaModificacion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el registro est� activo. No permite NULL. 1 el registro est� activo. 0 el registro est� desactivado' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo', @level2type=N'COLUMN',@level2name=N'activo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Almac�n tipo cat�logo definido para el registro de los Concecutivos Personalizados en el sistema.' , @level0type=N'SCHEMA',@level0name=N'Base', @level1type=N'TABLE',@level1name=N'Consecutivo'
GO



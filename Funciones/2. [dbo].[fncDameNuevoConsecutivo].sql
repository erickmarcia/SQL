USE [DB_TEST];
GO
/*-- =================================================================================================
-- Author:		EMARCIA
-- Create date: 05/01/2022
-- Description: Obtiene el consecutivo de cobro siguiente y lo aumenta en 1.
-- @CODIGO = 'CON', Corresponde al código del consecutivo
-- =================================================================================================*/
CREATE FUNCTION [dbo].[fncDameNuevoConsecutivo] (@CODIGO NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN

	/*DECLARAMOS LAS VARIABLES A OCUPAR*/
    DECLARE @nuevo_consecutivo NVARCHAR(MAX);
	DECLARE @consecutivo_global NVARCHAR(MAX);
	DECLARE @consecutivo INT;

	-- OBTENER EL ÚLTIMO CONSECUTIVO UTILIZADO
	-- SET @consecutivo_global = 'CON-2022-000'
	SET @consecutivo_global = (SELECT [C].[ULTIMOVALOR] FROM [Base].[CONSECUTIVO] AS [C] WHERE [C].[CODIGO]  IN(@CODIGO))

   -- OBTENER EL VALOR DEL CONSECUTIVO DE DERECHA A IZQUIERDA QUE VAMOS A UTILIZAR Y LE AUMENTAMOS 1
	SET @consecutivo = RIGHT(@consecutivo_global,3) + 1

   --OBTENEMOS LA PARTE DEL CONSECUTIVO QUE NO VARIA QUE EN ESTE CASO SERIA DE IZQUIERA A DERECHA LOS PRIMERO 9 CARACTERES Y LUEGOS UNIMOS EL NUEVO CONSECUTIVO 
	SET @nuevo_consecutivo = LEFT(@consecutivo_global,9) + [dbo].[fncRellenarConCeros](@consecutivo, 3) 	
	
    RETURN @nuevo_consecutivo;

END


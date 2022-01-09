USE [DB_TEST];
GO
-- =========================================================================================================================
-- Author:		EMARCIA
-- Create date: 05/01/2022
-- Description: Rellena con ceros el [@numero] indicado, para completar el largo de la cadena hasta la [@longitudRequerida].
-- =========================================================================================================================
CREATE FUNCTION [dbo].[fncRellenarConCeros] (@numero INT, @longitudRequerida SMALLINT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @resultado NVARCHAR(MAX);
    --
    SET @resultado = REPLICATE('0', (@longitudRequerida - LEN(@numero))) + CONVERT(VARCHAR, @numero);
    --
    RETURN @resultado;
END;
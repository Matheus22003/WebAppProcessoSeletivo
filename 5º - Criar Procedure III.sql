/*Inicio AddEstado*/
CREATE PROCEDURE CriaEstado
       @vNomeEstado		varchar(30),
	   @vSigla			varchar(2)
AS
BEGIN
	DECLARE @vExisteEstado	int;
	DECLARE @vExisteSigla   int;

	SELECT @vExisteEstado = Estados.EstadoID from Estados where Estados.NomeEstado = @vNomeEstado;
	SELECT @vExisteSigla = Estados.EstadoID from Estados where Estados.Sigla= @vSigla;


	IF @vExisteEstado > 0 and @vExisteSigla > 0
		BEGIN
			SELECT 'Nome do Estado e Sigla já existem!' as retorno;
		END
	else
		BEGIN
			IF @vExisteEstado > 0 
				BEGIN
					SELECT 'Nome do Estado já existe no banco!' as retorno;
				END
			ELSE
				BEGIN
					IF @vExisteSigla > 0
						BEGIN
							SELECT 'Sigla já existe no banco!' as retorno;
						END
					ELSE
						BEGIN
							INSERT INTO Estados(NomeEstado,Sigla) VALUES(@vNomeEstado,@vSigla);
							SELECT 'UF criado com sucesso!' as retorno;
						END	
				END
		END
END;

/*Fim AddEstado*/
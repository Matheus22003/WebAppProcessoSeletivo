/*Inicio Exclusão de Pessoa*/
CREATE PROCEDURE ExcluirPessoa
	   @vCpf			varchar(100)
AS
BEGIN	
	UPDATE Pessoas SET Ativo = 0, data_exclusao = getdate() WHERE Pessoas.Cpf = @vCpf;
	SELECT 'Pessoa removida com sucesso!' as retorno;	
END;

/*Fim Exclusão de Pessoa*/
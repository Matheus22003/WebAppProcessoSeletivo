/*Inicio Criação de Pessoa*/
CREATE PROCEDURE CriarPessoa
       @vNome		    varchar(150),
	   @vCpf			varchar(100),
	   @vEstado         int,
	   @vGenero			int
AS
BEGIN
	DECLARE @vExistePessoa	int;
	DECLARE @vAtivo bit;

	SELECT @vExistePessoa = Pessoas.PessoasID from Pessoas where Pessoas.Cpf = @vCpf;
	SELECT @vAtivo = Pessoas.PessoasID from Pessoas where Pessoas.Cpf = @vCpf and Pessoas.Ativo = 0;

	IF @vAtivo > 0
		BEGIN
			UPDATE Pessoas SET Ativo = 1,Nome = @vNome ,Estado = @vEstado ,Genero = @vGenero, data_criacao = getdate() WHERE Pessoas.Cpf = @vCpf;
			SELECT 'A pessoa cadastrada estava inativa e  foi atualizada e ativada novamente!' as retorno
		END
	else
		BEGIN
			IF @vExistePessoa > 0 
				BEGIN
					UPDATE Pessoas SET Nome = @vNome ,Estado = @vEstado ,Genero = @vGenero WHERE Pessoas.Cpf = @vCpf;
					SELECT 'Pessoa atualizada com sucesso!' as retorno
				END
			ELSE
				BEGIN
			
					INSERT INTO Pessoas(Nome,Cpf,Estado,Genero)
						VALUES (@vNome, @vCpf, @vEstado, @vGenero);

					SELECT 'Pessoa criada com sucesso!' as retorno;

				END
		END
END;
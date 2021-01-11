<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="gerenciar.aspx.cs" Inherits="webAppProcessoSeletivo.Pages.gerenciar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Link CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <title></title>
</head>
<body>
    <!-- Inicio Menu -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand text-center lh-1" href="#"><span class="fw-bold">Confirp</span>
                <br />
                <small class="" style="font-size: small">Processo Seletivo</small> </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">



                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Cadastro
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/Pages/index.aspx">Pessoa</a></li>
                            <li><a class="dropdown-item" href="/Pages/addEstado.aspx">Estado</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item active" href="#">Gerenciar</a></li>
                        </ul>
                    </li>


                </ul>
            </div>

            <div>
                <a target="_blank" href="https://www.linkedin.com/in/matheus-simões-812139189/">
                    <img class="img-fluid" style="width: 5vh" src="https://image.flaticon.com/icons/png/512/174/174857.png" />
                </a>
            </div>
        </div>
    </nav>
    <!-- Fim Menu -->


    <div class="container mt-3">
        <form runat="server">
            <asp:GridView ID="grdPessoas" runat="server" class="table">
            </asp:GridView>
            <asp:TextBox ID="cpfHidden" class="invisible" Text="Ola" runat="server" OnTextChanged="cpfHidden_TextChanged"></asp:TextBox>

            <!-- Modal -->
            <div class="modal fade" id="modalEdicao" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Editar Pessoa</h5>

                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <label for="editNome" class="form-label">Nome completo:</label>
                                <asp:TextBox ID="editNome" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div>
                                <label for="editCpf" class="form-label">CPF:</label>
                                <input type="text" disabled class="form-control" id="editCpf">
                                <!-- <input type="text" disabled class="form-control position-fixed invisible" id="editBkpCpf">-->
                                <asp:TextBox ID="txtCpfHelp" class="invisible position-fixed" Text="Ola" runat="server"></asp:TextBox>

                                <div id="cpfHelp" class="form-text">CPF é um marcador único, não pode ser alterado</div>

                            </div>
                            <div class=" mb-3">
                                <label class="form-label" for="editEstado">Estado:</label>
                                <asp:DropDownList ID="editEstado" class="form-select" runat="server" OnLoad="editEstado_Load">
                                </asp:DropDownList>

                            </div>

                            <div class=" mb-3">
                                <label class="form-label" for="editGen">Gênero:</label>
                                <asp:DropDownList ID="editGen" class="form-select" runat="server" OnLoad="editGen_Load">
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="editFechar" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                            <asp:Button ID="salvarEdit" class="btn btn-primary" runat="server" Text="Salvar" OnClick="salvarEdit_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <asp:Label ID="lblTeste" runat="server"></asp:Label>
        </form>

    </div>

    <!-- Redes Sociais -->

    <!-- Link de Bibliotecas JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
    <script>

        //Inicio Botâo Deletar
        var td = document.createElement("td");
        td.className = 'btnRemove';
        var btn = document.createElement('button')
        btn.className = "btn btn-danger invisible ";
        btn.textContent = "Deletar";
        td.appendChild(btn)
        $('.table tbody tr')[0].appendChild(td);
        var qtdeLinhas = JSON.stringify($('.table tbody tr'));
        qtdeLinhas = JSON.parse(qtdeLinhas);
        for (var i = 1; Number(qtdeLinhas.length) > i; i++) {
            var linha = $('.table tbody tr')[i];
            var cpf = linha.cells[1].innerText;
            cpf = cpf.replace('.', '');
            cpf = cpf.replace('.', '');
            cpf = cpf.replace('-', '');
            var conteudo = `<td class="btnRemove">
                                <button onclick='enviarCpf(${cpf})' runat="server" ID="btnDel" class="btn btn-danger ">
                                        Deletar
                                </button>
                            </td>`

            linha.innerHTML += conteudo
        }
        function enviarCpf(cpf) {
            document.getElementById('cpfHidden').value = cpf;
        }

        // Fim Botâo deletar

        //Inicio botâo Editar
        var td = document.createElement("td");
        td.className = 'btnRemove';
        var btn = document.createElement('button')
        btn.className = "btn btn-danger invisible ";
        btn.textContent = "Editar";
        td.appendChild(btn)
        $('.table tbody tr')[0].appendChild(td);
        var qtdeLinhasEditar = JSON.stringify($('.table tbody tr'));
        qtdeLinhasEditar = JSON.parse(qtdeLinhasEditar);
        var nome = [];

        for (var i = 1; Number(qtdeLinhasEditar.length) > i; i++) {
            var linha = $('.table tbody tr')[i];
            var cpf = linha.cells[1].innerText;
            cpf = cpf.replace('.', '');
            cpf = cpf.replace('.', '');
            cpf = cpf.replace('-', '');
            nome[i] = linha.cells[0].innerText;

            var conteudo = `<td class="btnRemove">
                                <button ID="btnEdit" onclick="enviarDadosEdit(${cpf},'${nome[i]}')" type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modalEdicao">
                                        Editar
                                </button>
                            </td>`;
            linha.innerHTML += conteudo;

        }

        function enviarDadosEdit(cpf, nome) {
            mandarCpf(cpf);
            document.getElementById('editNome').value = nome;

        }
        function mandarCpf(cpf) {
            var cpf1 = cpf.toString().slice(0, 3);
            var cpf2 = cpf.toString().slice(3, 6);
            var cpf3 = cpf.toString().slice(6, 9);
            var cpf4 = cpf.toString().slice(9, 11);
            document.getElementById('editCpf').value = `${cpf1}.${cpf2}.${cpf3}-${cpf4}`;
            document.getElementById('txtCpfHelp').value = cpf;
        }

        function limparEdit() {
            document.getElementById('editCpf').value = '';
            document.getElementById('editNome').value = '';
        }


    </script>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="webAppProcessoSeletivo.Pages.index1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Link CSS -->
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
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
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Cadastro
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item active" href="#">Pessoa</a></li>
                            <li><a class="dropdown-item" href="/Pages/addEstado.aspx">Estado</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/Pages/gerenciar.aspx">Gerenciar</a></li>
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




    <!-- Inicio Formulario -->
    <div class="container w-25">
        <form id="regPessoa" runat="server">
            <asp:Label ID="lblTest" runat="server"></asp:Label>
            <div class="mb-4">
                <label for="txtNomeCompleto" class="form-label">Nome Completo:</label>
                <asp:TextBox ID='txtNomeCompleto' required class="form-control" runat="server"></asp:TextBox>

            </div>

            <div class="mb-4">
                <label for="txtCpf" class="form-label">CPF:</label>
                <asp:TextBox ID="txtCpf" runat="server" required class="form-control" data-mask="000.000.000-00"></asp:TextBox>

            </div>

            <div class=" mb-1">
                <label class="form-label" for="txtEstados">Estado:</label>
                <asp:DropDownList required ID="dplEstados" class="form-select" runat="server" placeholder="Teste" OnLoad="dplEstados_Load">
                    <asp:ListItem Selected hidden Value="-1" Text="Selecione o estado!"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator class="text-danger" ID="RequiredFieldValidator1" ControlToValidate="dplEstados" runat="Server" InitialValue="-1" ControlToCompare="ddl" Operator="Equal" ErrorMessage="Campo obrigatório!" />
            </div>

            <div class=" mb-1">
                <label class="form-label" for="dplGenero">Gênero:</label>
                <asp:DropDownList ID="dplGenero" required class="form-select" runat="server" OnLoad="dplGenero_Load">
                    <asp:ListItem Value="-1" Selected hidden Text="Selecione o gênero!"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator class="text-danger" ID="re1" ControlToValidate="dplGenero" runat="Server" InitialValue="-1" ControlToCompare="ddl" Operator="Equal" ErrorMessage="Campo obrigatório!" />


            </div>
            <div class=" row">
                <div class="col-6">
                    <button onclick="limparForm()" type="reset" class="btn btn-danger col-12">Limpar</button>
                </div>
                <div class="col-6 d-flex justify-content-end ">
                    <asp:Button Text="Cadastrar" ID="cadPessoa" type="button" runat="server" class="btn btn-primary col-12" OnClick="cadPessoa_Click" />
                </div>
            </div>
            <!--Inicio Aviso -->
            <div id="divAviso" class="alert container invisible mt-2" role="alert">
                <input id="txtAviso" onchange="" class="bg-transparent disabled text-center col-12 border-0" disabled runat="server" value="original" />
            </div>
            <!--Fim Aviso -->
        </form>

    </div>


    <!-- Inicio Formulario -->


    <!-- Link Bibliotecas JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>

    <script>
        document.getElementById('txtNomeCompleto').text = "";
        document.getElementById('txtCpf').text = "";
        //Aparecer Avisos
        setInterval(() => {
            var valorAtual = document.getElementById('txtAviso').value;

            if (valorAtual == "A pessoa cadastrada estava inativa e foi atualizada e ativada novamente!") {
                $('#divAviso').addClass('alert-danger');
                $('#divAviso').removeClass('invisible');
                $('#divAviso').addClass('animate__animated');
                $('#divAviso').addClass('animate__fadeInUp');
            } else if (valorAtual == "Pessoa atualizada com sucesso!") {
                $('#divAviso').addClass('alert-success')
                $('#divAviso').removeClass('invisible');
                $('#divAviso').addClass('animate__animated');
                $('#divAviso').addClass('animate__fadeInUp');
            } else if (valorAtual == "Pessoa criada com sucesso!") {
                $('#divAviso').addClass('alert-success')
                $('#divAviso').removeClass('invisible');
                $('#divAviso').addClass('animate__animated');
                $('#divAviso').addClass('animate__fadeInUp');
            }

        }, 500)

    </script>
</body>
</html>


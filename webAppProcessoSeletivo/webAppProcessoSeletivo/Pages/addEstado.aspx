<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addEstado.aspx.cs" Inherits="webAppProcessoSeletivo.Pages.addEstado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Links CSS-->
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
                            <li><a class="dropdown-item " href="/Pages/index.aspx">Pessoa</a></li>
                            <li><a class="dropdown-item active" href="#">Estado</a></li>
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
            <div class="mb-3">
                <label for="txtNomeEstado" class="form-label">Nome do Estado:</label>
                <asp:TextBox ID='txtNomeEstado' required class="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtSiglaEstado" class="form-label">Sigla:</label>
                <asp:TextBox ID="txtSiglaEstado" runat="server" required class="form-control" data-mask="AA"></asp:TextBox>
            </div>
            <div class=" row">
                <div class="col-6">
                    <button type="reset" class="btn btn-danger col-12">Limpar</button>
                </div>
                <div class="col-6 d-flex justify-content-end ">
                    <asp:Button Text="Cadastrar" ID="cadUF" runat="server" class="btn btn-primary col-12" OnClick="cadPessoa_Click" />
                </div>
            </div>
        </form>
        <!--Inicio Aviso -->
        <div id="divAviso" class="alert container invisible mt-2" role="alert">
            <input id="txtAviso" onchange="" class="bg-transparent disabled text-center col-12 border-0" disabled runat="server" value="original" />
        </div>
        <!--Fim Aviso -->
    </div>
    <!-- Inicio Formulario -->

    <!-- Link Bibliotecas JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
    <script>
        //Criação de avisos
        setInterval(() => {
            var valorAtual = document.getElementById('txtAviso').value;

            if (valorAtual == "Nome do Estado e Sigla já existem!") {
                $('#divAviso').addClass('alert-danger');
                $('#divAviso').removeClass('invisible');
                $('#divAviso').addClass('animate__animated');
                $('#divAviso').addClass('animate__fadeInUp');
            } else if (valorAtual == "Nome do Estado já existe no banco!") {
                $('#divAviso').addClass('alert-danger')
                $('#divAviso').removeClass('invisible');
                $('#divAviso').addClass('animate__animated');
                $('#divAviso').addClass('animate__fadeInUp');
            } else if (valorAtual == "Sigla já existe no banco!") {
                $('#divAviso').addClass('alert-danger')
                $('#divAviso').removeClass('invisible');
                $('#divAviso').addClass('animate__animated');
                $('#divAviso').addClass('animate__fadeInUp');
            } else if (valorAtual == "UF criado com sucesso!") {
                $('#divAviso').addClass('alert-success')
                $('#divAviso').removeClass('invisible');
                $('#divAviso').addClass('animate__animated');
                $('#divAviso').addClass('animate__fadeInUp');
            }

        }, 500)
    </script>
</body>
</html>

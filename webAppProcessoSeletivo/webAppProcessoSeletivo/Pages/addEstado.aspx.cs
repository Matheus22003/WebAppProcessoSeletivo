using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webAppProcessoSeletivo.Pages
{
    public partial class addEstado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cadPessoa_Click(object sender, EventArgs e)
        {
            //Botão cadastrar Pessoa
            string nome = txtNomeEstado.Text;
            string sigla = txtSiglaEstado.Text;

            /*Chamando classe*/
            Class.Crud crud = new Class.Crud();
            var dt = crud.AddEstado(nome, sigla);

            txtNomeEstado.Text = string.Empty;
            txtSiglaEstado.Text = string.Empty;

            /*Enviadndo aviso para o usuário*/
            txtAviso.Value = dt.Rows[0].ItemArray[0].ToString();
        }
    }
}
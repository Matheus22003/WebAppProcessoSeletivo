using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace webAppProcessoSeletivo.Pages
{
    public partial class index1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter sqa = new SqlDataAdapter();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.ConnectionString = "Data Source=localhost;Initial Catalog=ProcessoSeletivoBD;Integrated Security=True";
            con.Open();
        }


        protected void cadPessoa_Click(object sender, EventArgs e)
        {
            /*Cadastro de Pessoas*/

            Class.Crud crud = new Class.Crud();
            string cpf = txtCpf.Text.ToString();
            var listDel = new string[] { "-", "." };
            foreach (var c in listDel)
            {
                cpf = cpf.Replace(c, string.Empty);
            }

            var dt = crud.addPessoa(txtNomeCompleto.Text.ToString(), cpf, Convert.ToInt32(dplEstados.SelectedValue + 1), Convert.ToInt32(dplGenero.SelectedValue) + 1);
            txtNomeCompleto.Text = String.Empty;
            txtCpf.Text = String.Empty;

            txtAviso.Value = dt.Rows[0].ItemArray[0].ToString();
            dplGenero.Items.Clear();
            dplEstados.Items.Clear();
            dplEstados_Load(sender,e);
            dplGenero_Load(sender, e);
        }

        protected void dplEstados_Load(object sender, EventArgs e)
        {
            /*Listar e exibir Estados*/
            Class.Crud crud = new Class.Crud();
            DataTable dt = crud.listarEstados();
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                ListItem li = new ListItem();
                li.Text = dt.Rows[i].ItemArray.Select(x => x.ToString()).ToArray()[1].ToString();
                li.Value = i.ToString();
                dplEstados.Items.Add(li);

            }

        }

        protected void dplGenero_Load(object sender, EventArgs e)
        {
            /*Listar e exibir Generos*/
            
            Class.Crud crud = new Class.Crud();
            DataTable dt = crud.listarGeneros();
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                ListItem liGen = new ListItem();
                liGen.Text = dt.Rows[i].ItemArray.Select(x => x.ToString()).ToArray()[1].ToString();
                liGen.Value = i.ToString();
                dplGenero.Items.Add(liGen);

            }

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

namespace webAppProcessoSeletivo.Pages
{
    public partial class gerenciar : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter sqa = new SqlDataAdapter();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Conexão de BD*/
            con.ConnectionString = "Data Source=localhost;Initial Catalog=ProcessoSeletivoBD;Integrated Security=True";
            con.Open();

            /*Requisição e exibição de tabela Pessoas*/
            ds = new DataSet();
            cmd.CommandText = "SELECT Pessoas.Nome, Pessoas.Cpf, Estados.NomeEstado AS 'Estado',Generos.Genero FROM Pessoas INNER JOIN Estados ON Pessoas.Estado = Estados.EstadoID INNER JOIN Generos ON Pessoas.Genero = Generos.GeneroID WHERE Pessoas.Ativo = 1; ";
            cmd.Connection = con;
            sqa = new SqlDataAdapter(cmd);
            sqa.Fill(ds);
            cmd.ExecuteNonQuery();
            grdPessoas.DataSource = ds;
            grdPessoas.DataBind();
            for (int i = 0; grdPessoas.Rows.Count > i; i++)
            {
                grdPessoas.Rows[i].Cells[1].Text = Convert.ToInt64(grdPessoas.Rows[i].Cells[1].Text).ToString(@"000\.000\.000\-00");

            }
            
            con.Close();
        }

        protected void cpfHidden_TextChanged(object sender, EventArgs e)
        {
            //Remoção de Pessoa by CPF
            Class.Crud crud = new Class.Crud();
            crud.remPessoaByCpf(cpfHidden.Text);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);

        }

        protected void editEstado_Load(object sender, EventArgs e)
        {
            //Edição de Pessoa
            Class.Crud crud = new Class.Crud();
            DataTable dt = crud.listarEstados();
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                ListItem li = new ListItem();
                li.Text = dt.Rows[i].ItemArray.Select(x => x.ToString()).ToArray()[1].ToString();
                li.Value = i.ToString();
                editEstado.Items.Add(li);

            }
        }

        protected void editGen_Load(object sender, EventArgs e)
        {
            /*Exibição da lista Genero*/

            Class.Crud crud = new Class.Crud();

            DataTable dt = crud.listarGeneros();
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                ListItem liGen = new ListItem();
                liGen.Text = dt.Rows[i].ItemArray.Select(x => x.ToString()).ToArray()[1].ToString();
                liGen.Value = i.ToString();
                editGen.Items.Add(liGen);

            }
        }

        protected void salvarEdit_Click(object sender, EventArgs e)
        {
            /* Salvar edições de Pessoa*/
            string nome = editNome.Text;
            string cpf = txtCpfHelp.Text;
            int estado = Convert.ToInt32(editEstado.SelectedValue) + 1;
            int gen = Convert.ToInt32(editGen.SelectedValue) + 1;

            Class.Crud crud = new Class.Crud();
            crud.EditPessoaByCpf(cpf, nome, estado, gen);
            editNome.Text = String.Empty;
            txtCpfHelp.Text = string.Empty;

            Page.Response.Redirect(Page.Request.Url.ToString(), true);


        }
    }
}
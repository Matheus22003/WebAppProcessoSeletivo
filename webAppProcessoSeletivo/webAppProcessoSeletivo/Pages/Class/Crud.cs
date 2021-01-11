using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace webAppProcessoSeletivo.Pages.Class
{
    public class Crud
    {
        /* Declaração de Variaveis*/
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter sqa = new SqlDataAdapter();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();

        public void openConn()
        {
            /*Conexão com BD*/
            con.ConnectionString = "Data Source=localhost;Initial Catalog=ProcessoSeletivoBD;Integrated Security=True";
            con.Open();
        }


        /*Declaração de Classes*/
        public void remPessoaByCpf(string cpf)
        {
            openConn();
            dt = new DataTable();
            string command = string.Format("EXEC ExcluirPessoa '{0}'", cpf);
            cmd.CommandText = command;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

        }

        public void EditPessoaByCpf(string cpf, string nome, int estado, int genero)
        {
            openConn();
            dt = new DataTable();
            string command = string.Format("EXEC CriarPessoa '{0}' , '{1}', {2} ,{3}", nome, cpf, estado, genero);
            cmd.CommandText = command;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

        }

        public DataTable AddEstado(string nomeEstado, string siglaEstado)
        {
            openConn();
            dt = new DataTable();
            string command = string.Format("EXEC CriaEstado '{0}', '{1}'", nomeEstado, siglaEstado);
            cmd.CommandText = command;
            cmd.Connection = con;
            sqa = new SqlDataAdapter(cmd);
            sqa.Fill(dt);
            cmd.ExecuteNonQuery();
            return dt;
        }

        public DataTable listarEstados()
        {
            openConn();
            ds = new DataSet();
            cmd.CommandText = "SELECT * FROM Estados;";
            cmd.Connection = con;
            sqa = new SqlDataAdapter(cmd);
            sqa.Fill(dt);
            cmd.ExecuteNonQuery();
            return dt;
        }
        public DataTable addPessoa(string nome, string cpf, int estado, int genero)
        {
            openConn();
            dt = new DataTable();
            string command = string.Format("EXEC CriarPessoa '{0}' , '{1}', {2} ,{3}", nome, cpf, estado, genero);
            cmd.CommandText = command;
            cmd.Connection = con;
            sqa = new SqlDataAdapter(cmd);
            sqa.Fill(dt);
            cmd.ExecuteNonQuery();
            return dt;

        }
        public DataTable listarGeneros()
        {
            openConn();

            ds = new DataSet();
            cmd.CommandText = "SELECT * FROM Generos;";
            cmd.Connection = con;
            sqa = new SqlDataAdapter(cmd);
            sqa.Fill(dt);
            cmd.ExecuteNonQuery();
            return dt;
        }


    }
}
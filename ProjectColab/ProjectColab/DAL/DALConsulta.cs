﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALConsulta
    {
        string connectionString = "";

        public DALConsulta()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }
        public DataSet SelectPublishers()
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "  SELECT sala.id AS 'CODIGO',sala.nome AS 'NOME DA SALA',eq.id AS 'CODIGO DO EQUIPAMENTO',eq.modelo 'AS MODELO DOS EQUIPAMENTOS',eq.quantidade 'A QUANTIDADE DE EQUIPAMENTO'  FROM Salas sala INNER JOIN Equipamento eq ON eq.sala_id = sala.id";

            // Cria objeto DataAdapter para execução do comando e 
            // geração de dados para o Dataset
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            // Cria o objeto Dataset para armazernar o resultada da 
            // consulta SQL a ser executada
            DataSet ds = new DataSet();

            // Executa o comando SQL e tranfere o resultado para o DataSet
            da.Fill(ds);

            return ds;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataSet SelectImage(string id)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT * from usuario where id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            // Cria objeto DataAdapter para execução do comando e 
            // geração de dados para o Dataset
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            // Cria o objeto Dataset para armazernar o resultada da 
            // consulta SQL a ser executada
            DataSet ds = new DataSet();

            // Executa o comando SQL e tranfere o resultado para o DataSet
            da.Fill(ds);

            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataSet SelectChamados(int id)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT	count(case when (usuario_atribuido_id LIKE @id) and ((status like 1) or (status like 2) or (status like 4)) then 1 end) as myCount, " +
                "count(case when status like 1 or status like 2 or status like 4 then 1 end) as count, count(case when (usuario_atribuido_id IS NULL) and (statusEI = 1) then 1 end) as noCount FROM Chamado";
            cmd.Parameters.AddWithValue("@id", id);

            // Cria objeto DataAdapter para execução do comando e 
            // geração de dados para o Dataset
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            // Cria o objeto Dataset para armazernar o resultada da 
            // consulta SQL a ser executada
            DataSet ds = new DataSet();

            // Executa o comando SQL e tranfere o resultado para o DataSet
            da.Fill(ds);

            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataSet SelectChamadoDash()
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT COUNT(case when (status like 1) or (status like 2) then 1 end) as countAberto, count(case when status like 3 then 1 end) as countFechado FROM chamado";


            // Cria objeto DataAdapter para execução do comando e 
            // geração de dados para o Dataset
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            // Cria o objeto Dataset para armazernar o resultada da 
            // consulta SQL a ser executada
            DataSet ds = new DataSet();

            // Executa o comando SQL e tranfere o resultado para o DataSet
            da.Fill(ds);

            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataSet SelectEquipDash()
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT COUNT(*) as equipCount FROM equipamento";


            // Cria objeto DataAdapter para execução do comando e 
            // geração de dados para o Dataset
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            // Cria o objeto Dataset para armazernar o resultada da 
            // consulta SQL a ser executada
            DataSet ds = new DataSet();

            // Executa o comando SQL e tranfere o resultado para o DataSet
            da.Fill(ds);

            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataSet SelectSalaDash()
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT COUNT(*) as salaCount FROM Salas";


            // Cria objeto DataAdapter para execução do comando e 
            // geração de dados para o Dataset
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            // Cria o objeto Dataset para armazernar o resultada da 
            // consulta SQL a ser executada
            DataSet ds = new DataSet();

            // Executa o comando SQL e tranfere o resultado para o DataSet
            da.Fill(ds);

            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataSet SelecTutoAll()
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT COUNT(case when status like 2 then 1 end) as tutoCount, count(case when status like 1 then 1 end) as tutoCountAnalise FROM tutorial";

            // Cria objeto DataAdapter para execução do comando e 
            // geração de dados para o Dataset
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            // Cria o objeto Dataset para armazernar o resultada da 
            // consulta SQL a ser executada
            DataSet ds = new DataSet();

            // Executa o comando SQL e tranfere o resultado para o DataSet
            da.Fill(ds);

            return ds;
        }


        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Equipamento obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("Update Equipamento Set nome = @nome, sala_nome = @sala_nome , modelo = @modelo , quantidade = @quantidade   Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@sala_nome", obj.sala_nome);
            cmd.Parameters.AddWithValue("@modelo", obj.modelo);
            cmd.Parameters.AddWithValue("@quantidade", obj.quantidade);

            cmd.ExecuteNonQuery();
        }
    }
}
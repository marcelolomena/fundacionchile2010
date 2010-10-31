using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Collections.Specialized;
using System.Web.SessionState;
using System.Web;
using System.Text;

namespace GestionSostenedores.datos
{
    
    public class Resultados
    {
        private string strConexion;

        public Resultados()
        {
            this.strConexion =
                ConfigurationManager.ConnectionStrings["sostenedoresdb"].ConnectionString;
        }


        public string reporteInscritos(string codins,string codfor)
        {
            string consulta = "sp_reporte_inscritos_2";
            DataTable dtTemp = null;
            string resp = null;
            StringBuilder respuesta = new StringBuilder();
            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codins", OleDbType.Integer).Value = int.Parse(codins);
            sentencia.Parameters.Add("codfor", OleDbType.Char).Value = char.Parse(codfor);

            OleDbDataReader resultSet = null;

            try
            {
                conexion.Open();
                resultSet = sentencia.ExecuteReader();

                if (resultSet.HasRows)
                {
                    dtTemp = new DataTable();
                    dtTemp.Clear();

                    dtTemp.Load(resultSet, LoadOption.OverwriteChanges);
                    resp = SerializaJSON.CadenaDesdeDataTable(dtTemp);
                    respuesta.Append("{\"inscritos\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");
                }
                else
                {
                    respuesta.Append("{\"inscritos\":[]}");
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }


        public string reporteArea(string codins,string codfor)
        {
            string consulta = "sp_reporte_area";
            DataTable dtTemp = null;
            string resp = null;

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codins", OleDbType.Integer).Value = int.Parse(codins);
            sentencia.Parameters.Add("codfor", OleDbType.Char).Value = char.Parse(codfor);

            OleDbDataReader resultSet = null;

            try
            {
                conexion.Open();
                resultSet = sentencia.ExecuteReader();

                if (resultSet.HasRows)
                {
                    dtTemp = new DataTable();
                    dtTemp.Clear();

                    dtTemp.Load(resultSet, LoadOption.OverwriteChanges);
                    resp = SerializaJSON.CadenaDesdeDataTable(dtTemp);
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return resp;

        }

        public string reporteDimension(string codins,string codfor)
        {
            string consulta = "sp_reporte_dimension";
            DataTable dtTemp = null;
            string resp = null;

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codins", OleDbType.Integer).Value = int.Parse(codins);
            sentencia.Parameters.Add("codfor", OleDbType.Char).Value = char.Parse(codfor);

            OleDbDataReader resultSet = null;

            try
            {
                conexion.Open();
                resultSet = sentencia.ExecuteReader();

                if (resultSet.HasRows)
                {
                    dtTemp = new DataTable();
                    dtTemp.Clear();

                    dtTemp.Load(resultSet, LoadOption.OverwriteChanges);
                    resp = SerializaJSON.CadenaDesdeDataTable(dtTemp);
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return resp;

        }

        public string reporteMejoria(string codins)
        {
            string consulta = "sp_reporte_mejoria";
            DataTable dtTemp = null;
            string resp = null;

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codins", OleDbType.Integer).Value = int.Parse(codins);

            OleDbDataReader resultSet = null;

            try
            {
                conexion.Open();
                resultSet = sentencia.ExecuteReader();

                if (resultSet.HasRows)
                {
                    dtTemp = new DataTable();
                    dtTemp.Clear();

                    dtTemp.Load(resultSet, LoadOption.OverwriteChanges);
                    resp = SerializaJSON.CadenaDesdeDataTable(dtTemp);
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return resp;

        }

        public string reporteCartesiano(string codins, string nomsp)
        {
            //string consulta = "sp_reporte_area_cartesiano";
            DataTable dtTemp = null;
            string resp = null;

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(nomsp, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codins", OleDbType.Integer).Value = int.Parse(codins);
            OleDbDataReader resultSet = null;

            try
            {
                conexion.Open();
                resultSet = sentencia.ExecuteReader();

                if (resultSet.HasRows)
                {
                    dtTemp = new DataTable();
                    dtTemp.Clear();

                    dtTemp.Load(resultSet, LoadOption.OverwriteChanges);
                    resp = SerializaJSON.CadenaDesdeDataTable(dtTemp);
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return resp;

        }


    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Collections.Specialized;
using System.Web.SessionState;
using System.Web;
using System.Text;
using System.Text.RegularExpressions;
using System.Configuration;


namespace GestionSostenedores.datos
{
    public class Registro
    {

        private string strConexion;


        public Registro()
        {
            this.strConexion =
                ConfigurationManager.ConnectionStrings["sostenedoresdb"].ConnectionString;
        }

        public string ObtenerUsuariosPorInstitucion(string codins)
        {
            string consulta = "sp_obtener_usuario_establecimiento";
            DataTable dtTemp = null;
            string resp = null;
            StringBuilder respuesta = new StringBuilder();
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
                    respuesta.Append("{\"usuarios\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");
                }
                else
                {
                    respuesta.Append("{\"usuarios\":[]}");

                }

                resultSet.Close();

                conexion.Close();

            } catch (OleDbException ode)
            {

            }

            return respuesta.ToString();
        }

        public string ObtenerUsuario(string codusu)
        {
            string consulta = "sp_obtener_usuario";
            DataTable dtTemp = null;
            string resp = null;
            StringBuilder respuesta = new StringBuilder();
            OleDbConnection conexion = new OleDbConnection(strConexion);
            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;
            sentencia.Parameters.Add("codusu", OleDbType.Integer).Value = int.Parse(codusu);

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
                    respuesta.Append("{\"usuario\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");
                }
                else
                {
                    respuesta.Append("{\"usuario\":[]}");

                }

                resultSet.Close();

                conexion.Close();

            }
            catch (OleDbException ode)
            {

            }

            return respuesta.ToString();
        }

        public string ObtenerSostenedores(string coddep, string codcom)
        {
            string consulta = "sp_obtener_sostenedores";
            DataTable dtTemp = null;
            string resp = null;
            StringBuilder respuesta = new StringBuilder();
            OleDbConnection conexion = new OleDbConnection(strConexion);
            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;
            sentencia.Parameters.Add("coddep", OleDbType.Integer).Value = int.Parse(coddep);
            sentencia.Parameters.Add("codcom", OleDbType.Integer).Value = int.Parse(codcom);
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
                    respuesta.Append("{\"sostenedores\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");
                }
                else
                {
                    respuesta.Append("{\"sostenedores\":[]}");

                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }

        public string GuardarUsuario(string qsdecode, string codins)
        {
            StringBuilder respuesta = new StringBuilder();
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;

            try
            {

                NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);

                conexion = new OleDbConnection(strConexion);

                sentencia = new OleDbCommand("sp_guardar_usuario", conexion);
                sentencia.CommandType = CommandType.StoredProcedure;

                sentencia.Parameters.Add("codins", OleDbType.Integer).Value = int.Parse(codins);
                sentencia.Parameters.Add("codper", OleDbType.Integer).Value = int.Parse(sj.Get("actor"));
                sentencia.Parameters.Add("nomusu", OleDbType.VarChar).Value = sj.Get("nombre");
                sentencia.Parameters.Add("apepausu", OleDbType.VarChar).Value = sj.Get("apellido");
                sentencia.Parameters.Add("mailusu", OleDbType.VarChar).Value = sj.Get("email");
                sentencia.Parameters.Add("clausu", OleDbType.VarChar).Value = sj.Get("clave_1");
                conexion.Open();
                sentencia.ExecuteNonQuery();
                conexion.Close();
                respuesta.Append("{\"error\":false}");

                //Correo cro = new Correo();
                //cro.SendEmail("jcolguin@fundacionchile.cl", sj.Get("email"), "Inscripcion em sistema de sostenedores", "su usuario es " + sj.Get("email") + "y su clave es " + sj.Get("clave_1"));
            } catch (OleDbException ode){
                respuesta.Append("{\"error\":true,");
                respuesta.Append("\"msg\":\"");
                respuesta.Append(ode.Message);
                respuesta.Append("\"}");
            }
            return respuesta.ToString();
        }

    }
}
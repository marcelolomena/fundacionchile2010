using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Collections.Specialized;
using System.Web.SessionState;
using System.Web;

namespace GestionSostenedores.datos
{
    public class Instrumento
    {

        private string strConexion;


        public Instrumento()
        {
            this.strConexion =
                ConfigurationManager.ConnectionStrings["sostenedoresdb"].ConnectionString;
        }


        public string ObtenerInstrumento(int codper, int codusu,char codfor)
        {

            string resp = SerializaJSON.UnirCadenaDesdeDataTable(obtenerPregunta(codper,codusu, codfor), obtenerRol(codper));
            return resp;

        }

        public void GuardarInstrumento(string qsdecode, string codper, string codfor, string codusu)
        {
            string qsdecode2=null;
            OleDbConnection conexion=null;
            OleDbCommand sentencia=null;

            if (codfor.Equals("A"))
            {
                NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);
                string restxt = sj.Get("restxt");
                if (restxt != null && restxt.Trim().Length > 0)
                {
                    sj.Remove("restxt");
                    qsdecode2 = SerializaJSON.ConstructQueryString(sj);

                    conexion = new OleDbConnection(strConexion);

                    sentencia = new OleDbCommand("sp_guardar_instrumento_A", conexion);
                    sentencia.CommandType = CommandType.StoredProcedure;

                    sentencia.Parameters.Add("p_respuesta", OleDbType.VarChar).Value = qsdecode2;
                    sentencia.Parameters.Add("p_codper", OleDbType.Integer).Value = int.Parse(codper);
                    sentencia.Parameters.Add("p_codfor", OleDbType.Char).Value = codfor;
                    sentencia.Parameters.Add("p_codusu", OleDbType.Integer).Value = int.Parse(codusu);
                    sentencia.Parameters.Add("p_res", OleDbType.VarChar).Value = restxt;
                }
                else
                {
                    sj.Remove("restxt");
                    qsdecode2 = SerializaJSON.ConstructQueryString(sj);

                    conexion = new OleDbConnection(strConexion);

                    sentencia = new OleDbCommand("sp_guardar_instrumento_B", conexion);
                    sentencia.CommandType = CommandType.StoredProcedure;

                    sentencia.Parameters.Add("p_respuesta", OleDbType.VarChar).Value = qsdecode2;
                    sentencia.Parameters.Add("p_codper", OleDbType.Integer).Value = int.Parse(codper);
                    sentencia.Parameters.Add("p_codfor", OleDbType.Char).Value = codfor;
                    sentencia.Parameters.Add("p_codusu", OleDbType.Integer).Value = int.Parse(codusu);
                }
                
            } else if (codfor.Equals("B")) {
                conexion = new OleDbConnection(strConexion);

                sentencia = new OleDbCommand("sp_guardar_instrumento_B", conexion);
                sentencia.CommandType = CommandType.StoredProcedure;

                sentencia.Parameters.Add("p_respuesta", OleDbType.VarChar).Value = qsdecode;
                sentencia.Parameters.Add("p_codper", OleDbType.Integer).Value = int.Parse(codper);
                sentencia.Parameters.Add("p_codfor", OleDbType.Char).Value = codfor;
                sentencia.Parameters.Add("p_codusu", OleDbType.Integer).Value = int.Parse(codusu);
            }

            try
            {
                conexion.Open();
                sentencia.ExecuteNonQuery();
                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }
           
        }

      

        private DataTable obtenerPregunta(int codper, int codusu,char codfor)
        {
            string consulta = "sp_obtener_instrumento";
            DataTable dtTemp=null;

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("p_codper", OleDbType.Integer).Value = codper;
            sentencia.Parameters.Add("p_codusu", OleDbType.Integer).Value = codusu;
            sentencia.Parameters.Add("p_codfor", OleDbType.Char).Value = codfor;

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
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return dtTemp;

        }

        private DataTable obtenerRol(int codper)
        {
            string consulta = "sp_obtener_rol";
            DataTable dtTemp = null;

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("p_codper", OleDbType.Integer).Value = codper;

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
                    //resp = SerializaJSON.CadenaDesdeDataTable(dtTemp);
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return dtTemp;

        }

        private void actualizaEstado(int codusu, int codado)
        {
            string consulta = "sp_actualiza_estado";

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codusu", OleDbType.Integer).Value = codusu;
            sentencia.Parameters.Add("codado", OleDbType.Integer).Value = codado;


            try
            {
                conexion.Open();
                sentencia.ExecuteNonQuery();
                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }


        }

        private void actualizaEstado2(int codusu, int codado, string codfor)
        {
            string consulta = "sp_actualiza_estado2";

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codusu", OleDbType.Integer).Value = codusu;
            sentencia.Parameters.Add("codado", OleDbType.Integer).Value = codado;
            sentencia.Parameters.Add("codfor", OleDbType.Char).Value = char.Parse(codfor);


            try
            {
                conexion.Open();
                sentencia.ExecuteNonQuery();
                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }


        }

        public void actualizaForma(int codusu, string codfor)
        {
            string consulta = "sp_actualiza_forma";

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codusu", OleDbType.Integer).Value = codusu;
            sentencia.Parameters.Add("codfor", OleDbType.Char).Value = char.Parse(codfor);


            try
            {
                conexion.Open();
                sentencia.ExecuteNonQuery();
                conexion.Close();
                HttpContext.Current.Session["codfor"] = codfor;

            }

            catch (OleDbException ode)
            {


            }


        }

        public Boolean validaIngreso(string qsdecode)
        {
            string consulta = "sp_valida_ingreso";
            Boolean esValido = false;

            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);
            string rut = sj.Get("email").Trim();
            string password = sj.Get("password").Trim();

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("UserName", OleDbType.VarChar).Value = rut;
            sentencia.Parameters.Add("Password ", OleDbType.VarChar).Value = password;

            OleDbDataReader resultSet = null;

            try
            {
                conexion.Open();
                resultSet = sentencia.ExecuteReader();

                if (resultSet.HasRows)
                {
                    while (resultSet.Read())
                    {
                        string codper =resultSet.GetString(0);
                        string codusu =resultSet.GetString(1);
                        string codins =resultSet.GetString(2);

                        HttpContext.Current.Session["codper"] = codper;
                        HttpContext.Current.Session["codusu"] = codusu;
                        HttpContext.Current.Session["codins"] = codins;
                        esValido = true;
                    }

                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {
            }

            return esValido;

        }


        
        public string validaForma(int codper, int codusu)
        {
            string rta=null;
            string consulta = "sp_valida_forma";
            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codusu", OleDbType.Integer).Value = codusu;
            OleDbDataReader resultSet = null;
            string[]  estadoX=null;
            string[] formaX = null;
            try
            {
                conexion.Open();
                resultSet = sentencia.ExecuteReader();

                if (resultSet.HasRows)
                {

                    if (codper == 1 || codper == 2 || codper == 3 || codper == 5)
                    {
                        while (resultSet.Read())
                        {
                            string estado = resultSet.GetString(0);
                            string forma = resultSet.GetString(1);

                            if (estado.CompareTo("1") == 0) // pendiente
                            {
                                // actualizar estado
                                actualizaEstado(codusu,2);
                                HttpContext.Current.Session["codfor"] = forma;
                                rta = "[{\"ESTADO\":\"I\"},{\"FORMA\":\""+ forma + "\"}]";
                            }
                            else if (estado.CompareTo("2") == 0) // iniciada 
                            {
                                HttpContext.Current.Session["codfor"] = forma;
                                rta = "[{\"ESTADO\":\"I\"},{\"FORMA\":\"" + forma + "\"}]";
                            }
                            else if (estado.CompareTo("3") == 0) // finalizada 
                            {
                                rta = "[{\"ESTADO\":\"F\"},{\"FORMA\":\"\"}]";
                            }

                        }
                    }
                    else if ( codper == 4 || codper == 6 || codper == 7 )
                    {
                        estadoX = new string[2];
                        formaX= new string[2];
                        int vuelta = 0;

                        while (resultSet.Read())
                        {

                            estadoX[vuelta] = resultSet.GetString(0);
                            formaX[vuelta] = resultSet.GetString(1);
                            vuelta++;
                        }

                        if (estadoX[0].CompareTo("1") == 0 && estadoX[1].CompareTo("1") == 0)
                        {
                            // letrerito forma A o B
                            rta = "[{\"ESTADO\":\"P\"},{\"FORMA\":\"\"}]";
                        }
                        else if (estadoX[0].CompareTo("2") == 0)
                        {
                            HttpContext.Current.Session["codfor"] = formaX[0]; //  sigue completando
                            rta = "[{\"ESTADO\":\"I\"},{\"FORMA\":\"" + formaX[0] + "\"}]";
                        }
                        else if (estadoX[1].CompareTo("2") == 0)
                        {
                            HttpContext.Current.Session["codfor"] = formaX[1]; //  sigue completando
                            rta = "[{\"ESTADO\":\"I\"},{\"FORMA\":\"" + formaX[1] + "\"}]";

                        } else if (estadoX[0].CompareTo("3") == 0 && estadoX[1].CompareTo("3") == 0)
                        {
                            // letrerito finalizada
                            rta = "[{\"ESTADO\":\"F\"},{\"FORMA\":\"\"}]";

                        } else if (estadoX[0].CompareTo("3") == 0 && estadoX[1].CompareTo("1") == 0)
                        {
                            HttpContext.Current.Session["codfor"] = formaX[1]; //  sigue completando la otra forma
                            actualizaEstado2(codusu, 2, formaX[1]);
                            rta = "[{\"ESTADO\":\"I\"},{\"FORMA\":\"" + formaX[1] + "\"}]";

                        } else if (estadoX[0].CompareTo("1") == 0 && estadoX[1].CompareTo("3") == 0)
                        {
                            HttpContext.Current.Session["codfor"] = formaX[0]; //  sigue completando la otra forma
                            actualizaEstado2(codusu, 2, formaX[0]);
                            rta = "[{\"ESTADO\":\"I\"},{\"FORMA\":\"" + formaX[0] + "\"}]";
                        }


                    }

                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {
            }

            return rta;

        }
        
    }
}
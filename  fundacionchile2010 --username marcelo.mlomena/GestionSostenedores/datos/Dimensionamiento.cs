using System;
using System.Data;
using System.Data.OleDb;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web;
using System.Web.SessionState;
using System.Text;
using System.Text.RegularExpressions;
using System.Configuration;

namespace GestionSostenedores.datos
{
    public class Dimensionamiento
    {

        private string strConexion;


        public Dimensionamiento()
        {
            this.strConexion =
                ConfigurationManager.ConnectionStrings["sostenedoresdb"].ConnectionString;
        }

        public void actualizarInstitucion(string qsdecode, string codusu)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;
            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);

            conexion = new OleDbConnection(strConexion);
            sentencia = new OleDbCommand("sp_actualizar_institucion", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;
            int p_codusu = int.Parse(codusu);
            int p_coddep = int.Parse(sj.Get("CODDEP"));
            int p_codcar = int.Parse(sj.Get("CODCAR"));
            int p_codcom = int.Parse(sj.Get("CODCOM"));
            string identificacion_nombre=sj.Get("IDENTIFICACION_NOMBRE");
            string identificacion_representantelegal=sj.Get("IDENTIFICACION_REPRESENTANTELEGAL");
            string identificacion_direccion=sj.Get("IDENTIFICACION_DIRECCION");
            int identificacion_fono1=int.Parse(sj.Get("IDENTIFICACION_FONO1"));
            int identificacion_fono2=int.Parse(sj.Get("IDENTIFICACION_FONO2"));
            int identificacion_fax=int.Parse(sj.Get("IDENTIFICACION_FAX"));
            int identificacion_celular=int.Parse(sj.Get("IDENTIFICACION_CELULAR"));
            string identificacion_email1=sj.Get("IDENTIFICACION_EMAIL1");
            string identificacion_email2 = sj.Get("IDENTIFICACION_EMAIL2");
            string identificacion_contacto_nombre=sj.Get("IDENTIFICACION_CONTACTO_NOMBRE");
            string identificacion_contacto_email=sj.Get("IDENTIFICACION_CONTACTO_EMAIL");
            int identificacion_contacto_fono= int.Parse(sj.Get("IDENTIFICACION_CONTACTO_FONO"));
            string identificacion_sitioweb=sj.Get("IDENTIFICACION_SITIOWEB");
            sentencia.Parameters.Add("CODUSU", OleDbType.Integer).Value = p_codusu;
            sentencia.Parameters.Add("CODDEP", OleDbType.Integer).Value = p_coddep;
            sentencia.Parameters.Add("CODCAR", OleDbType.Integer).Value = p_codcar;
            sentencia.Parameters.Add("CODCOM", OleDbType.Integer).Value = p_codcom;
            sentencia.Parameters.Add("IDENTIFICACION_NOMBRE", OleDbType.VarChar).Value = identificacion_nombre;
            sentencia.Parameters.Add("IDENTIFICACION_REPRESENTANTELEGAL", OleDbType.VarChar).Value = identificacion_representantelegal;
            sentencia.Parameters.Add("IDENTIFICACION_DIRECCION", OleDbType.VarChar).Value = identificacion_direccion;
            sentencia.Parameters.Add("IDENTIFICACION_FONO1", OleDbType.Integer).Value = identificacion_fono1;
            sentencia.Parameters.Add("IDENTIFICACION_FONO2", OleDbType.Integer).Value = identificacion_fono2;
            sentencia.Parameters.Add("IDENTIFICACION_FAX", OleDbType.Integer).Value = identificacion_fax;
            sentencia.Parameters.Add("IDENTIFICACION_CELULAR", OleDbType.Integer).Value = identificacion_celular;
            sentencia.Parameters.Add("IDENTIFICACION_EMAIL1", OleDbType.VarChar).Value = identificacion_email1;
            sentencia.Parameters.Add("IDENTIFICACION_EMAIL2", OleDbType.VarChar).Value = identificacion_email2;
            sentencia.Parameters.Add("IDENTIFICACION_CONTACTO_NOMBRE", OleDbType.VarChar).Value = identificacion_contacto_nombre;
            sentencia.Parameters.Add("IDENTIFICACION_CONTACTO_EMAIL", OleDbType.VarChar).Value = identificacion_contacto_email;
            sentencia.Parameters.Add("IDENTIFICACION_CONTACTO_FONO", OleDbType.Integer).Value = identificacion_contacto_fono;
            sentencia.Parameters.Add("IDENTIFICACION_SITIOWEB", OleDbType.VarChar).Value = identificacion_sitioweb;

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

        public void eliminarEstablecimiento(string codest, string codins)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;

            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_eliminar_establecimiento", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);
            sentencia.Parameters.Add("codins", OleDbType.Integer).Value = int.Parse(codins);


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



        public void guardarEstablecimiento(string qsdecode, string codins)
        {
            OleDbConnection conexion=null;
            OleDbCommand sentencia=null;
            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);
            //string restxt = sj.Get("restxt");

            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_guardar_establecimiento", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codins", OleDbType.Integer).Value = int.Parse(codins);
            sentencia.Parameters.Add("magnitud_nombre", OleDbType.VarChar).Value = sj.Get("magnitud_nombre");
            sentencia.Parameters.Add("magnitud_direccion", OleDbType.VarChar).Value = sj.Get("magnitud_direccion");// codfor;
            sentencia.Parameters.Add("magnitud_datoscontacto", OleDbType.VarChar).Value = sj.Get("magnitud_datoscontacto");// int.Parse(codusu);
            sentencia.Parameters.Add("magnitud_fechacreacion", OleDbType.Date).Value = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss");
            sentencia.Parameters.Add("magnitud_nombredirector", OleDbType.VarChar).Value = sj.Get("magnitud_nombredirector");// restxt;
            sentencia.Parameters.Add("magnitud_cantidadalumnos", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_cantidadalumnos"));
            sentencia.Parameters.Add("magnitud_superficie", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_superficie"));
            sentencia.Parameters.Add("magnitud_docente_total", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_total"));
            sentencia.Parameters.Add("magnitud_docente_genero_masculino", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_genero_masculino"));
            sentencia.Parameters.Add("magnitud_docente_genero_femenino", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_genero_femenino"));
            sentencia.Parameters.Add("magnitud_docente_edad", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_edad"));
            sentencia.Parameters.Add("magnitud_docente_anosservicio", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_anosservicio"));
            sentencia.Parameters.Add("magnitud_docente_destacado", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_destacado"));
            sentencia.Parameters.Add("magnitud_docente_competente", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_competente"));
            sentencia.Parameters.Add("magnitud_docente_basico", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_basico"));
            sentencia.Parameters.Add("magnitud_docente_insatisfactorio", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_insatisfactorio"));
            sentencia.Parameters.Add("magnitud_docente_lenguaje", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_lenguaje"));
            sentencia.Parameters.Add("magnitud_docente_matematica", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_matematica"));
            sentencia.Parameters.Add("magnitud_docente_ciencia", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_ciencia"));
            sentencia.Parameters.Add("magnitud_docente_arte", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_arte"));
            sentencia.Parameters.Add("mat_2005", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2005"));
            sentencia.Parameters.Add("mat_2006", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2006"));
            sentencia.Parameters.Add("mat_2007", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2007"));
            sentencia.Parameters.Add("mat_2008", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2008"));
            sentencia.Parameters.Add("mat_2009", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2009"));
            sentencia.Parameters.Add("mat_2010", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2010"));
            sentencia.Parameters.Add("magnitud_personal_asistente", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_personal_asistente"));
            sentencia.Parameters.Add("magnitud_personal_directivo_docente", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_personal_directivo_docente"));
            sentencia.Parameters.Add("magnitud_personal_directivo_nodocente", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_personal_directivo_nodocente"));
            sentencia.Parameters.Add("magnitud_personal_directivo_hlectiva", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_personal_directivo_hlectiva"));
            sentencia.Parameters.Add("magnitud_personal_directivo_hnolectiva", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_personal_directivo_hnolectiva"));


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

        public void ActualizarEstablecimiento(string qsdecode, string codest)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;
            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);
            //string restxt = sj.Get("restxt");

            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_actualizar_establecimiento", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);
            sentencia.Parameters.Add("magnitud_nombre", OleDbType.VarChar).Value = sj.Get("magnitud_nombre");
            sentencia.Parameters.Add("magnitud_direccion", OleDbType.VarChar).Value = sj.Get("magnitud_direccion");// codfor;
            sentencia.Parameters.Add("magnitud_datoscontacto", OleDbType.VarChar).Value = sj.Get("magnitud_datoscontacto");// int.Parse(codusu);
            sentencia.Parameters.Add("magnitud_fechacreacion", OleDbType.Date).Value = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss");
            sentencia.Parameters.Add("magnitud_nombredirector", OleDbType.VarChar).Value = sj.Get("magnitud_nombredirector");// restxt;
            sentencia.Parameters.Add("magnitud_cantidadalumnos", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_cantidadalumnos"));
            sentencia.Parameters.Add("magnitud_superficie", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_superficie"));
            sentencia.Parameters.Add("magnitud_docente_total", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_total"));
            sentencia.Parameters.Add("magnitud_docente_genero_masculino", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_genero_masculino"));
            sentencia.Parameters.Add("magnitud_docente_genero_femenino", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_genero_femenino"));
            sentencia.Parameters.Add("magnitud_docente_edad", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_edad"));
            sentencia.Parameters.Add("magnitud_docente_anosservicio", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_anosservicio"));
            sentencia.Parameters.Add("magnitud_docente_destacado", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_destacado"));
            sentencia.Parameters.Add("magnitud_docente_competente", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_competente"));
            sentencia.Parameters.Add("magnitud_docente_basico", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_basico"));
            sentencia.Parameters.Add("magnitud_docente_insatisfactorio", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_insatisfactorio"));
            sentencia.Parameters.Add("magnitud_docente_lenguaje", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_lenguaje"));
            sentencia.Parameters.Add("magnitud_docente_matematica", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_matematica"));
            sentencia.Parameters.Add("magnitud_docente_ciencia", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_ciencia"));
            sentencia.Parameters.Add("magnitud_docente_arte", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_docente_arte"));
            sentencia.Parameters.Add("mat_2005", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2005"));
            sentencia.Parameters.Add("mat_2006", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2006"));
            sentencia.Parameters.Add("mat_2007", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2007"));
            sentencia.Parameters.Add("mat_2008", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2008"));
            sentencia.Parameters.Add("mat_2009", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2009"));
            sentencia.Parameters.Add("mat_2010", OleDbType.Integer).Value = int.Parse(sj.Get("mat_2010"));
            sentencia.Parameters.Add("magnitud_personal_asistente", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_personal_asistente"));
            sentencia.Parameters.Add("magnitud_personal_directivo_docente", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_personal_directivo_docente"));
            sentencia.Parameters.Add("magnitud_personal_directivo_nodocente", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_personal_directivo_nodocente"));
            sentencia.Parameters.Add("magnitud_personal_directivo_hlectiva", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_personal_directivo_hlectiva"));
            sentencia.Parameters.Add("magnitud_personal_directivo_hnolectiva", OleDbType.Integer).Value = int.Parse(sj.Get("magnitud_personal_directivo_hnolectiva"));


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

        public string ListaEstablecimiento(string codest, string codins)
        {
            string resp1 = null;
            string resp2 = null;
            StringBuilder respuesta = new StringBuilder();
            try{
                resp1 = DetalleEstablecimiento(codest, codins);
                resp2 = DetalleMatricula(codest);
                respuesta.Append("{\"establecimiento\":");
                respuesta.Append(resp1);
                respuesta.Append(",\"matricula\":");
                respuesta.Append(resp2);
                respuesta.Append("}");
            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }


        public string DetalleEstablecimiento(string codest,string codins)
        {
            string consulta = "sp_obtener_establecimiento";
            DataTable dtTemp = null;
            string resp = null;

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);
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

        public string obtenerEstablecimientos(string codusu)
        {
            string consulta = "sp_obtener_establecimiento_control";
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
                    respuesta.Append("{\"establecimientos\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");
                }
                else
                {
                    respuesta.Append("{\"establecimientos\":[]}");
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }




        public string DetalleMatricula(string codest)
        {
            string consulta = "sp_matricula_establecimiento";
            DataTable dtTemp = null;
            string resp = null;

            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);

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

        
        public string ObtenerInstitucion(int codusu)
        {

            StringBuilder respuesta = null;
            try {
            respuesta = new StringBuilder();
            respuesta.Append("{\"institucion\":");
            respuesta.Append(ObtenerInst(codusu));
            respuesta.Append(",\"comunas\":");
            respuesta.Append(ObtenerComunas());
            respuesta.Append("}");
            }

            catch (Exception ode)
            {


            }
            return respuesta.ToString();

        }

        private string ObtenerInst(int codusu)
        {
            string consulta = "sp_obtener_institucion";
            DataTable dtTemp = null;
            string resp = null;
            //StringBuilder respuesta = new StringBuilder();
            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codusu", OleDbType.Integer).Value = codusu;

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

        private string ObtenerComunas()
        {
            string consulta = "sp_obtener_comunas";
            DataTable dtTemp = null;
            string resp = null;
            //StringBuilder respuesta = new StringBuilder();
            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            //sentencia.Parameters.Add("codusu", OleDbType.Integer).Value = codusu;

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



        public void GuardarEficiencia(string qsdecode, string codest)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;
            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);

            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_guardar_eficiencia", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);
            sentencia.Parameters.Add("repitencia_2005", OleDbType.Integer).Value = int.Parse(sj.Get("repitencia_2005"));             
            sentencia.Parameters.Add("repitencia_2006", OleDbType.Integer).Value = int.Parse(sj.Get("repitencia_2006"));             
            sentencia.Parameters.Add("repitencia_2007", OleDbType.Integer).Value = int.Parse(sj.Get("repitencia_2007"));             
            sentencia.Parameters.Add("repitencia_2008", OleDbType.Integer).Value = int.Parse(sj.Get("repitencia_2008"));             
            sentencia.Parameters.Add("repitencia_2009", OleDbType.Integer).Value = int.Parse(sj.Get("repitencia_2009"));             
            sentencia.Parameters.Add("retiro_2005", OleDbType.Integer).Value = int.Parse(sj.Get("retiro_2005"));                 
            sentencia.Parameters.Add("retiro_2006", OleDbType.Integer).Value = int.Parse(sj.Get("retiro_2006"));                 
            sentencia.Parameters.Add("retiro_2007", OleDbType.Integer).Value = int.Parse(sj.Get("retiro_2007"));                 
            sentencia.Parameters.Add("retiro_2008", OleDbType.Integer).Value = int.Parse(sj.Get("retiro_2008"));                 
            sentencia.Parameters.Add("retiro_2009", OleDbType.Integer).Value = int.Parse(sj.Get("retiro_2009"));                 
            sentencia.Parameters.Add("baja_2005", OleDbType.Integer).Value = int.Parse(sj.Get("baja_2005"));                   
            sentencia.Parameters.Add("baja_2006", OleDbType.Integer).Value = int.Parse(sj.Get("baja_2006"));                   
            sentencia.Parameters.Add("baja_2007", OleDbType.Integer).Value = int.Parse(sj.Get("baja_2007"));                   
            sentencia.Parameters.Add("baja_2008", OleDbType.Integer).Value = int.Parse(sj.Get("baja_2008"));                   
            sentencia.Parameters.Add("baja_2009", OleDbType.Integer).Value = int.Parse(sj.Get("baja_2009"));                   
            sentencia.Parameters.Add("aprobacion_2005", OleDbType.Integer).Value = int.Parse(sj.Get("aprobacion_2005"));             
            sentencia.Parameters.Add("aprobacion_2006", OleDbType.Integer).Value = int.Parse(sj.Get("aprobacion_2006"));             
            sentencia.Parameters.Add("aprobacion_2007", OleDbType.Integer).Value = int.Parse(sj.Get("aprobacion_2007"));             
            sentencia.Parameters.Add("aprobacion_2008", OleDbType.Integer).Value = int.Parse(sj.Get("aprobacion_2008"));             
            sentencia.Parameters.Add("aprobacion_2009", OleDbType.Integer).Value = int.Parse(sj.Get("aprobacion_2009"));             
            sentencia.Parameters.Add("asistencia_2005", OleDbType.Integer).Value = int.Parse(sj.Get("asistencia_2005"));             
            sentencia.Parameters.Add("asistencia_2006", OleDbType.Integer).Value = int.Parse(sj.Get("asistencia_2006"));             
            sentencia.Parameters.Add("asistencia_2007", OleDbType.Integer).Value = int.Parse(sj.Get("asistencia_2007"));             
            sentencia.Parameters.Add("asistencia_2008", OleDbType.Integer).Value = int.Parse(sj.Get("asistencia_2008"));             
            sentencia.Parameters.Add("asistencia_2009", OleDbType.Integer).Value = int.Parse(sj.Get("asistencia_2009"));             
            sentencia.Parameters.Add("egresotp_2005", OleDbType.Integer).Value = int.Parse(sj.Get("egresotp_2005"));               
            sentencia.Parameters.Add("egresotp_2006", OleDbType.Integer).Value = int.Parse(sj.Get("egresotp_2006"));               
            sentencia.Parameters.Add("egresotp_2007", OleDbType.Integer).Value = int.Parse(sj.Get("egresotp_2007"));               
            sentencia.Parameters.Add("egresotp_2008", OleDbType.Integer).Value = int.Parse(sj.Get("egresotp_2008"));               
            sentencia.Parameters.Add("egresotp_2009", OleDbType.Integer).Value = int.Parse(sj.Get("egresotp_2009"));               
            sentencia.Parameters.Add("inserciontp_2005", OleDbType.Integer).Value = int.Parse(sj.Get("inserciontp_2005"));            
            sentencia.Parameters.Add("inserciontp_2006", OleDbType.Integer).Value = int.Parse(sj.Get("inserciontp_2006"));            
            sentencia.Parameters.Add("inserciontp_2007", OleDbType.Integer).Value = int.Parse(sj.Get("inserciontp_2007"));            
            sentencia.Parameters.Add("inserciontp_2008", OleDbType.Integer).Value = int.Parse(sj.Get("inserciontp_2008"));            
            sentencia.Parameters.Add("inserciontp_2009", OleDbType.Integer).Value = int.Parse(sj.Get("inserciontp_2009"));            
            sentencia.Parameters.Add("egreso_2005", OleDbType.Integer).Value = int.Parse(sj.Get("egreso_2005"));                 
            sentencia.Parameters.Add("egreso_2006", OleDbType.Integer).Value = int.Parse(sj.Get("egreso_2006"));                 
            sentencia.Parameters.Add("egreso_2007", OleDbType.Integer).Value = int.Parse(sj.Get("egreso_2007"));                 
            sentencia.Parameters.Add("egreso_2008", OleDbType.Integer).Value = int.Parse(sj.Get("egreso_2008"));                 
            sentencia.Parameters.Add("egreso_2009", OleDbType.Integer).Value = int.Parse(sj.Get("egreso_2009"));                 
            sentencia.Parameters.Add("ingresoeducacionsuperior_2005", OleDbType.Integer).Value = int.Parse(sj.Get("ingresoeducacionsuperior_2005"));
            sentencia.Parameters.Add("ingresoeducacionsuperior_2006", OleDbType.Integer).Value = int.Parse(sj.Get("ingresoeducacionsuperior_2006"));
            sentencia.Parameters.Add("ingresoeducacionsuperior_2007", OleDbType.Integer).Value = int.Parse(sj.Get("ingresoeducacionsuperior_2007"));
            sentencia.Parameters.Add("ingresoeducacionsuperior_2008", OleDbType.Integer).Value = int.Parse(sj.Get("ingresoeducacionsuperior_2008"));
            sentencia.Parameters.Add("ingresoeducacionsuperior_2009", OleDbType.Integer).Value = int.Parse(sj.Get("ingresoeducacionsuperior_2009"));
            sentencia.Parameters.Add("postulante_2005", OleDbType.Integer).Value = int.Parse(sj.Get("postulante_2005"));             
            sentencia.Parameters.Add("postulante_2006", OleDbType.Integer).Value = int.Parse(sj.Get("postulante_2006"));             
            sentencia.Parameters.Add("postulante_2007", OleDbType.Integer).Value = int.Parse(sj.Get("postulante_2007"));             
            sentencia.Parameters.Add("postulante_2008", OleDbType.Integer).Value = int.Parse(sj.Get("postulante_2008"));             
            sentencia.Parameters.Add("postulante_2009", OleDbType.Integer).Value = int.Parse(sj.Get("postulante_2009"));     

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

        /*se puede optimizar*/
        public string obtenerEficiencia(string codest)
        {
            StringBuilder respuesta = null;
            try {
            respuesta = new StringBuilder();
            respuesta.Append("{\"repitencia\":");
            respuesta.Append(obtenerEficiencia(codest, "repitencia"));
            respuesta.Append(",\"retiro\":");
            respuesta.Append(obtenerEficiencia(codest, "retiro"));
            respuesta.Append(",\"baja\":");
            respuesta.Append(obtenerEficiencia(codest, "baja"));
            respuesta.Append(",\"aprobacion\":");
            respuesta.Append(obtenerEficiencia(codest, "aprobacion"));
            respuesta.Append(",\"asistencia\":");
            respuesta.Append(obtenerEficiencia(codest, "asistencia"));
            respuesta.Append(",\"egresotp\":");
            respuesta.Append(obtenerEficiencia(codest, "egresotp"));
            respuesta.Append(",\"inserciontp\":");
            respuesta.Append(obtenerEficiencia(codest, "inserciontp"));
            respuesta.Append(",\"egreso\":");
            respuesta.Append(obtenerEficiencia(codest, "egreso"));
            respuesta.Append(",\"ingresoeducacionsuperior\":");
            respuesta.Append(obtenerEficiencia(codest, "ingresoeducacionsuperior"));
            respuesta.Append(",\"postulante\":");
            respuesta.Append(obtenerEficiencia(codest, "postulante"));
            respuesta.Append("}");
            }

            catch (Exception ode)
            {


            }
            return respuesta.ToString();
        }


        public string obtenerEficiencia(string codest, string tabla)
        {
            string consulta = "sp_obtener_eficiencia";
            DataTable dtTemp = null;
            string resp = null;
            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);
            sentencia.Parameters.Add("tabla", OleDbType.VarChar).Value = tabla; 


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
                else
                {
                    resp = "[]";
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return resp;

        }

        public string ObtenerVulnerabilidad(int codest)
        {
            string consulta = "sp_obtener_vulnerabilidad";
            DataTable dtTemp = null;
            string resp = null;
            StringBuilder respuesta = new StringBuilder();
            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = codest;

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
                    respuesta.Append("{\"vulnerabilidad\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");
                }
                else
                {
                    respuesta.Append("{\"vulnerabilidad\":[]}");
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }
        public void GuardarVulnerabilidad(string qsdecode, string codest)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;
            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);

            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_guardar_vulnerabilidad", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);
            sentencia.Parameters.Add("VULNERABILIDAD_ALUMNOUPRIORITARIO", OleDbType.Integer).Value = int.Parse(sj.Get("VULNERABILIDAD_ALUMNOUPRIORITARIO"));
            sentencia.Parameters.Add("VULNERABILIDAD_INDICEVULNERABILIDAD", OleDbType.Integer).Value = int.Parse(sj.Get("VULNERABILIDAD_INDICEVULNERABILIDAD"));

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

        public string ObtenerFinanzas(string codusu)
        {
            string consulta = "sp_obtener_finanzas";
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
                    respuesta.Append("{\"finanzas\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");

                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }
        public void GuardarFinanzas(string qsdecode, string codusu)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;
            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);

            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_guardar_finanzas", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;
            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codusu);
            sentencia.Parameters.Add("FINANZAS_PRESUPUESTO", OleDbType.Integer).Value = int.Parse(sj.Get("FINANZAS_PRESUPUESTO"));
            sentencia.Parameters.Add("FINANZAS_SEP", OleDbType.Integer).Value = int.Parse(sj.Get("FINANZAS_SEP"));
            sentencia.Parameters.Add("FINANZAS_FONDOMEJORAMIENTO", OleDbType.Integer).Value = int.Parse(sj.Get("FINANZAS_FONDOMEJORAMIENTO"));
            sentencia.Parameters.Add("FINANZAS_COSTOALUMNO", OleDbType.Integer).Value = int.Parse(sj.Get("FINANZAS_COSTOALUMNO"));
            sentencia.Parameters.Add("FINANZAS_ALUMNOBECADO", OleDbType.Integer).Value = int.Parse(sj.Get("FINANZAS_ALUMNOBECADO"));
            sentencia.Parameters.Add("FINANZAS_OTROINGRESO", OleDbType.Integer).Value = int.Parse(sj.Get("FINANZAS_OTROINGRESO"));

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

        public string ObtenerComunaPorRegion(string codreg)
        {
            string consulta = "sp_obtener_comuna_region";
            DataTable dtTemp = null;
            string resp = null;
            StringBuilder respuesta = new StringBuilder();
            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codreg", OleDbType.Integer).Value = int.Parse(codreg);

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
                    respuesta.Append("{\"comunas\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");

                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }

        public string ObtenerInfraestructura(string codest)
        {
            string consulta = "sp_obtener_infraestructura";
            DataTable dtTemp = null;
            string resp = null;
            StringBuilder respuesta = new StringBuilder();
            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);

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
                    respuesta.Append("{\"infraestructura\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");
                }
                else
                {
                    respuesta.Append("{\"infraestructura\":[]}");
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }

        public void GuardarInfraestructura(string qsdecode, string codest)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;
            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);

            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_guardar_infraestructura", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);
            sentencia.Parameters.Add("INFRAESTRUCTURA_SUPERFICIE_TOTAL", OleDbType.Integer).Value = int.Parse(sj.Get("INFRAESTRUCTURA_SUPERFICIE_TOTAL"));
            sentencia.Parameters.Add("INFRAESTRUCTURA_SALAS_TOTAL", OleDbType.Integer).Value = int.Parse(sj.Get("INFRAESTRUCTURA_SALAS_TOTAL"));
            sentencia.Parameters.Add("INFRAESTRUCTURA_LABORATORIO_CIENCIA", OleDbType.Char).Value = char.Parse(sj.Get("INFRAESTRUCTURA_LABORATORIO_CIENCIA"));
            sentencia.Parameters.Add("INFRAESTRUCTURA_LABORATORIO_COMPUTACION", OleDbType.Char).Value = char.Parse(sj.Get("INFRAESTRUCTURA_LABORATORIO_COMPUTACION"));
            sentencia.Parameters.Add("INFRAESTRUCTURA_SUPERFICIE_UTIL", OleDbType.Integer).Value = int.Parse(sj.Get("INFRAESTRUCTURA_SUPERFICIE_UTIL"));
            sentencia.Parameters.Add("INFRAESTRUCTURA_SALAS_UTIL", OleDbType.Integer).Value = int.Parse(sj.Get("INFRAESTRUCTURA_SALAS_UTIL"));
            sentencia.Parameters.Add("INFRAESTRUCTURA_SALA_PROFESORES", OleDbType.Char).Value = char.Parse(sj.Get("INFRAESTRUCTURA_SALA_PROFESORES"));
            sentencia.Parameters.Add("INFRAESTRUCTURA_GIMNACIO", OleDbType.Char).Value = char.Parse(sj.Get("INFRAESTRUCTURA_GIMNACIO"));
            sentencia.Parameters.Add("INFRAESTRUCTURA_MULTICANCHA", OleDbType.Char).Value = char.Parse(sj.Get("INFRAESTRUCTURA_MULTICANCHA"));
            sentencia.Parameters.Add("INFRAESTRUCTURA_IMPLEMENTOS", OleDbType.Char).Value = char.Parse(sj.Get("INFRAESTRUCTURA_IMPLEMENTOS"));
            sentencia.Parameters.Add("INFRAESTRUCTURA_CASINO", OleDbType.Char).Value = char.Parse(sj.Get("INFRAESTRUCTURA_CASINO"));
            sentencia.Parameters.Add("INFRAESTRUCTURA_QUIOSCO", OleDbType.Char).Value = char.Parse(sj.Get("INFRAESTRUCTURA_QUIOSCO"));

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

        /*se puede optimizar*/
        public string ObtenerEspacial(string codest)
        {
            StringBuilder respuesta = null;
            try
            {
                respuesta = new StringBuilder();
                respuesta.Append("{\"riesgo\":");
                respuesta.Append(ObtenerEspacial(codest, "riesgo"));
                respuesta.Append(",\"verde\":");
                respuesta.Append(ObtenerEspacial(codest, "verde"));
                respuesta.Append(",\"luminaria\":");
                respuesta.Append(ObtenerEspacial(codest, "luminaria"));
                respuesta.Append(",\"comisaria\":");
                respuesta.Append(ObtenerEspacial(codest, "comisaria"));
                respuesta.Append(",\"botilleria\":");
                respuesta.Append(ObtenerEspacial(codest, "botilleria"));
                respuesta.Append(",\"emergencia\":");
                respuesta.Append(ObtenerEspacial(codest, "emergencia"));
                respuesta.Append("}");
            }

            catch (Exception ode)
            {


            }
            return respuesta.ToString();
        }


        public string ObtenerEspacial(string codest, string tipo)
        {
            string consulta = "sp_obtener_espacial";
            DataTable dtTemp = null;
            string resp = null;
            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);
            sentencia.Parameters.Add("tipo", OleDbType.VarChar).Value = tipo;

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
                else
                {
                    resp = "[]";
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return resp;

        }
        public void GuardarEspacial(string qsdecode, string codest)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;
            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_guardar_espacial", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;
            
            sentencia.Parameters.Add("param", OleDbType.VarChar).Value = qsdecode.Trim();
            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);

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

        public string ObtenerResultados(string codest)
        {
            string consulta = "sp_obtener_resultados";
            DataTable dtTemp = null;
            string resp = null;
            StringBuilder respuesta = new StringBuilder();
            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);

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
                    respuesta.Append("{\"resultados\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");
                }
                else
                {
                    respuesta.Append("{\"resultados\":[]}");
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }
        public void GuardarResultados(string qsdecode, string codest)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;
            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);

            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_guardar_resultados", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);
            sentencia.Parameters.Add("simce4_len_2005", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_len_2005"));
            sentencia.Parameters.Add("simce4_len_2006", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_len_2006"));
            sentencia.Parameters.Add("simce4_len_2007", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_len_2007"));
            sentencia.Parameters.Add("simce4_len_2008", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_len_2008"));
            sentencia.Parameters.Add("simce4_len_2009", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_len_2009"));

            sentencia.Parameters.Add("simce4_mat_2005", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_mat_2005"));
            sentencia.Parameters.Add("simce4_mat_2006", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_mat_2006"));
            sentencia.Parameters.Add("simce4_mat_2007", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_mat_2007"));
            sentencia.Parameters.Add("simce4_mat_2008", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_mat_2008"));
            sentencia.Parameters.Add("simce4_mat_2009", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_mat_2009"));

            sentencia.Parameters.Add("simce4_med_2005", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_med_2005"));
            sentencia.Parameters.Add("simce4_med_2006", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_med_2006"));
            sentencia.Parameters.Add("simce4_med_2007", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_med_2007"));
            sentencia.Parameters.Add("simce4_med_2008", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_med_2008"));
            sentencia.Parameters.Add("simce4_med_2009", OleDbType.Integer).Value = int.Parse(sj.Get("simce4_med_2009"));

            sentencia.Parameters.Add("simce8_len_2005", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_len_2005"));
            sentencia.Parameters.Add("simce8_len_2006", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_len_2006"));
            sentencia.Parameters.Add("simce8_len_2007", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_len_2007"));
            sentencia.Parameters.Add("simce8_len_2008", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_len_2008"));
            sentencia.Parameters.Add("simce8_len_2009", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_len_2009"));

            sentencia.Parameters.Add("simce8_mat_2005", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_mat_2005"));
            sentencia.Parameters.Add("simce8_mat_2006", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_mat_2006"));
            sentencia.Parameters.Add("simce8_mat_2007", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_mat_2007"));
            sentencia.Parameters.Add("simce8_mat_2008", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_mat_2008"));
            sentencia.Parameters.Add("simce8_mat_2009", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_mat_2009"));

            sentencia.Parameters.Add("simce8_med_2005", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_med_2005"));
            sentencia.Parameters.Add("simce8_med_2006", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_med_2006"));
            sentencia.Parameters.Add("simce8_med_2007", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_med_2007"));
            sentencia.Parameters.Add("simce8_med_2008", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_med_2008"));
            sentencia.Parameters.Add("simce8_med_2009", OleDbType.Integer).Value = int.Parse(sj.Get("simce8_med_2009"));

            sentencia.Parameters.Add("simce2_len_2005", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_len_2005"));
            sentencia.Parameters.Add("simce2_len_2006", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_len_2006"));
            sentencia.Parameters.Add("simce2_len_2007", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_len_2007"));
            sentencia.Parameters.Add("simce2_len_2008", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_len_2008"));
            sentencia.Parameters.Add("simce2_len_2009", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_len_2009"));

            sentencia.Parameters.Add("simce2_mat_2005", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_mat_2005"));
            sentencia.Parameters.Add("simce2_mat_2006", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_mat_2006"));
            sentencia.Parameters.Add("simce2_mat_2007", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_mat_2007"));
            sentencia.Parameters.Add("simce2_mat_2008", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_mat_2008"));
            sentencia.Parameters.Add("simce2_mat_2009", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_mat_2009"));

            sentencia.Parameters.Add("simce2_med_2005", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_med_2005"));
            sentencia.Parameters.Add("simce2_med_2006", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_med_2006"));
            sentencia.Parameters.Add("simce2_med_2007", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_med_2007"));
            sentencia.Parameters.Add("simce2_med_2008", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_med_2008"));
            sentencia.Parameters.Add("simce2_med_2009", OleDbType.Integer).Value = int.Parse(sj.Get("simce2_med_2009"));

            sentencia.Parameters.Add("psu_len_2005", OleDbType.Integer).Value = int.Parse(sj.Get("psu_len_2005"));
            sentencia.Parameters.Add("psu_len_2006", OleDbType.Integer).Value = int.Parse(sj.Get("psu_len_2006"));
            sentencia.Parameters.Add("psu_len_2007", OleDbType.Integer).Value = int.Parse(sj.Get("psu_len_2007"));
            sentencia.Parameters.Add("psu_len_2008", OleDbType.Integer).Value = int.Parse(sj.Get("psu_len_2008"));
            sentencia.Parameters.Add("psu_len_2009", OleDbType.Integer).Value = int.Parse(sj.Get("psu_len_2009"));

            sentencia.Parameters.Add("psu_mat_2005", OleDbType.Integer).Value = int.Parse(sj.Get("psu_mat_2005"));
            sentencia.Parameters.Add("psu_mat_2006", OleDbType.Integer).Value = int.Parse(sj.Get("psu_mat_2006"));
            sentencia.Parameters.Add("psu_mat_2007", OleDbType.Integer).Value = int.Parse(sj.Get("psu_mat_2007"));
            sentencia.Parameters.Add("psu_mat_2008", OleDbType.Integer).Value = int.Parse(sj.Get("psu_mat_2008"));
            sentencia.Parameters.Add("psu_mat_2009", OleDbType.Integer).Value = int.Parse(sj.Get("psu_mat_2009"));

            sentencia.Parameters.Add("psu_cie_2005", OleDbType.Integer).Value = int.Parse(sj.Get("psu_cie_2005"));
            sentencia.Parameters.Add("psu_cie_2006", OleDbType.Integer).Value = int.Parse(sj.Get("psu_cie_2006"));
            sentencia.Parameters.Add("psu_cie_2007", OleDbType.Integer).Value = int.Parse(sj.Get("psu_cie_2007"));
            sentencia.Parameters.Add("psu_cie_2008", OleDbType.Integer).Value = int.Parse(sj.Get("psu_cie_2008"));
            sentencia.Parameters.Add("psu_cie_2009", OleDbType.Integer).Value = int.Parse(sj.Get("psu_cie_2009"));

            sentencia.Parameters.Add("pro_2005", OleDbType.Integer).Value = int.Parse(sj.Get("pro_2005"));
            sentencia.Parameters.Add("pro_2006", OleDbType.Integer).Value = int.Parse(sj.Get("pro_2006"));
            sentencia.Parameters.Add("pro_2007", OleDbType.Integer).Value = int.Parse(sj.Get("pro_2007"));
            sentencia.Parameters.Add("pro_2008", OleDbType.Integer).Value = int.Parse(sj.Get("pro_2008"));
            sentencia.Parameters.Add("pro_2009", OleDbType.Integer).Value = int.Parse(sj.Get("pro_2009"));

            sentencia.Parameters.Add("otr_2005", OleDbType.Integer).Value = int.Parse(sj.Get("otr_2005"));
            sentencia.Parameters.Add("otr_2006", OleDbType.Integer).Value = int.Parse(sj.Get("otr_2006"));
            sentencia.Parameters.Add("otr_2007", OleDbType.Integer).Value = int.Parse(sj.Get("otr_2007"));
            sentencia.Parameters.Add("otr_2008", OleDbType.Integer).Value = int.Parse(sj.Get("otr_2008"));
            sentencia.Parameters.Add("otr_2009", OleDbType.Integer).Value = int.Parse(sj.Get("otr_2009"));
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

        public string ObtenerDemografia(string codusu)
        {
            string consulta = "sp_obtener_demografia";
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
                    respuesta.Append("{\"demografia\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");

                }
                else
                {
                    respuesta.Append("{\"demografia\":");
                    respuesta.Append("[]");
                    respuesta.Append("}");

                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }
        public void GuardarDemografia(string qsdecode, string codusu)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;
            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);

            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_guardar_demografia", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codusu", OleDbType.Integer).Value = int.Parse(codusu);

            if (sj.Get("ano1") != null)
            {
                sentencia.Parameters.Add("ano1", OleDbType.Integer).Value = int.Parse(sj.Get("ano1"));
            }
            else
            {
                sentencia.Parameters.Add("ano1", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("ano2") != null)
            {
                sentencia.Parameters.Add("ano2", OleDbType.Integer).Value = int.Parse(sj.Get("ano2"));
            }
            else
            {
                sentencia.Parameters.Add("ano2", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("ano3") != null)
            {
                sentencia.Parameters.Add("ano3", OleDbType.Integer).Value = int.Parse(sj.Get("ano3"));
            }
            else
            {
                sentencia.Parameters.Add("ano3", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("ano4") != null)
            {
                sentencia.Parameters.Add("ano4", OleDbType.Integer).Value = int.Parse(sj.Get("ano4"));
            }
            else
            {
                sentencia.Parameters.Add("ano4", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("ano5") != null)
            {
                sentencia.Parameters.Add("ano5", OleDbType.Integer).Value = int.Parse(sj.Get("ano5"));
            }
            else
            {
                sentencia.Parameters.Add("ano5", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("ano6") != null)
            {
                sentencia.Parameters.Add("ano6", OleDbType.Integer).Value = int.Parse(sj.Get("ano6"));
            }
            else
            {
                sentencia.Parameters.Add("ano6", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("ano7") != null)
            {
                sentencia.Parameters.Add("ano7", OleDbType.Integer).Value = int.Parse(sj.Get("ano7"));
            }
            else
            {
                sentencia.Parameters.Add("ano7", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("ano8") != null)
            {
                sentencia.Parameters.Add("ano8", OleDbType.Integer).Value = int.Parse(sj.Get("ano8"));
            }
            else
            {
                sentencia.Parameters.Add("ano8", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("ano9") != null)
            {
                sentencia.Parameters.Add("ano9", OleDbType.Integer).Value = int.Parse(sj.Get("ano9"));
            }
            else
            {
                sentencia.Parameters.Add("ano9", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("ano10") != null)
            {
                sentencia.Parameters.Add("ano10", OleDbType.Integer).Value = int.Parse(sj.Get("ano10"));
            }
            else
            {
                sentencia.Parameters.Add("ano10", OleDbType.Integer).Value = 0;
            }


            if (sj.Get("nat1") != null)
            {
                sentencia.Parameters.Add("nat1", OleDbType.Integer).Value = int.Parse(sj.Get("nat1"));
            }
            else
            {
                sentencia.Parameters.Add("nat1", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("nat2") != null)
            {
                sentencia.Parameters.Add("nat2", OleDbType.Integer).Value = int.Parse(sj.Get("nat2"));
            }
            else
            {
                sentencia.Parameters.Add("nat2", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("nat3") != null)
            {
                sentencia.Parameters.Add("nat3", OleDbType.Integer).Value = int.Parse(sj.Get("nat3"));
            }
            else
            {
                sentencia.Parameters.Add("nat3", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("nat4") != null)
            {
                sentencia.Parameters.Add("nat4", OleDbType.Integer).Value = int.Parse(sj.Get("nat4"));
            }
            else
            {
                sentencia.Parameters.Add("nat4", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("nat5") != null)
            {
                sentencia.Parameters.Add("nat5", OleDbType.Integer).Value = int.Parse(sj.Get("nat5"));
            }
            else
            {
                sentencia.Parameters.Add("nat5", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("nat6") != null)
            {
                sentencia.Parameters.Add("nat6", OleDbType.Integer).Value = int.Parse(sj.Get("nat6"));
            }
            else
            {
                sentencia.Parameters.Add("nat6", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("nat7") != null)
            {
                sentencia.Parameters.Add("nat7", OleDbType.Integer).Value = int.Parse(sj.Get("nat7"));
            }
            else
            {
                sentencia.Parameters.Add("nat7", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("nat8") != null)
            {
                sentencia.Parameters.Add("nat8", OleDbType.Integer).Value = int.Parse(sj.Get("nat8"));
            }
            else
            {
                sentencia.Parameters.Add("nat8", OleDbType.Integer).Value = 0;
            }
            if (sj.Get("nat9") != null)
            {
                sentencia.Parameters.Add("nat9", OleDbType.Integer).Value = int.Parse(sj.Get("nat9"));
            }
            else
            {
                sentencia.Parameters.Add("nat9", OleDbType.Integer).Value = 0;
            }
            if (sj.Get("nat10") != null)
            {
                sentencia.Parameters.Add("nat10", OleDbType.Integer).Value = int.Parse(sj.Get("nat10"));
            }
            else
            {
                sentencia.Parameters.Add("nat10", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("esc1") != null)
            {
                sentencia.Parameters.Add("esc1", OleDbType.Integer).Value = int.Parse(sj.Get("esc1"));
            }
            else
            {
                sentencia.Parameters.Add("esc1", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("esc2") != null)
            {
                sentencia.Parameters.Add("esc2", OleDbType.Integer).Value = int.Parse(sj.Get("esc2"));
            }
            else
            {
                sentencia.Parameters.Add("esc2", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("esc3") != null)
            {
                sentencia.Parameters.Add("esc3", OleDbType.Integer).Value = int.Parse(sj.Get("esc3"));
            }
            else
            {
                sentencia.Parameters.Add("esc3", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("esc4") != null)
            {
                sentencia.Parameters.Add("esc4", OleDbType.Integer).Value = int.Parse(sj.Get("esc4"));
            }
            else
            {
                sentencia.Parameters.Add("esc4", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("esc5") != null)
            {
                sentencia.Parameters.Add("esc5", OleDbType.Integer).Value = int.Parse(sj.Get("esc5"));
            }
            else
            {
                sentencia.Parameters.Add("esc5", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("esc6") != null)
            {
                sentencia.Parameters.Add("esc6", OleDbType.Integer).Value = int.Parse(sj.Get("esc6"));
            }
            else
            {
                sentencia.Parameters.Add("esc6", OleDbType.Integer).Value = 0;
            }


            if (sj.Get("esc7") != null)
            {
                sentencia.Parameters.Add("esc7", OleDbType.Integer).Value = int.Parse(sj.Get("esc7"));
            }
            else
            {
                sentencia.Parameters.Add("esc7", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("esc8") != null)
            {
                sentencia.Parameters.Add("esc8", OleDbType.Integer).Value = int.Parse(sj.Get("esc8"));
            }
            else
            {
                sentencia.Parameters.Add("esc8", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("esc9") != null)
            {
                sentencia.Parameters.Add("esc9", OleDbType.Integer).Value = int.Parse(sj.Get("esc9"));
            }
            else
            {
                sentencia.Parameters.Add("esc9", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("esc10") != null)
            {
                sentencia.Parameters.Add("esc10", OleDbType.Integer).Value = int.Parse(sj.Get("esc10"));
            }
            else
            {
                sentencia.Parameters.Add("esc10", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("hom1") != null)
            {
                sentencia.Parameters.Add("hom1", OleDbType.Integer).Value = int.Parse(sj.Get("hom1"));
            }
            else
            {
                sentencia.Parameters.Add("hom1", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("hom2") != null)
            {
                sentencia.Parameters.Add("hom2", OleDbType.Integer).Value = int.Parse(sj.Get("hom2"));
            }
            else
            {
                sentencia.Parameters.Add("hom2", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("hom3") != null)
            {
                sentencia.Parameters.Add("hom3", OleDbType.Integer).Value = int.Parse(sj.Get("hom3"));
            }
            else
            {
                sentencia.Parameters.Add("hom3", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("hom4") != null)
            {
                sentencia.Parameters.Add("hom4", OleDbType.Integer).Value = int.Parse(sj.Get("hom4"));
            }
            else
            {
                sentencia.Parameters.Add("hom4", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("hom5") != null)
            {
                sentencia.Parameters.Add("hom5", OleDbType.Integer).Value = int.Parse(sj.Get("hom5"));
            }
            else
            {
                sentencia.Parameters.Add("hom5", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("hom6") != null)
            {
                sentencia.Parameters.Add("hom6", OleDbType.Integer).Value = int.Parse(sj.Get("hom6"));
            }
            else
            {
                sentencia.Parameters.Add("hom6", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("hom7") != null)
            {
                sentencia.Parameters.Add("hom7", OleDbType.Integer).Value = int.Parse(sj.Get("hom7"));
            }
            else
            {
                sentencia.Parameters.Add("hom7", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("hom8") != null)
            {
                sentencia.Parameters.Add("hom8", OleDbType.Integer).Value = int.Parse(sj.Get("hom8"));
            }
            else
            {
                sentencia.Parameters.Add("hom8", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("hom9") != null)
            {
                sentencia.Parameters.Add("hom9", OleDbType.Integer).Value = int.Parse(sj.Get("hom9"));
            }
            else
            {
                sentencia.Parameters.Add("hom9", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("hom10") != null)
            {
                sentencia.Parameters.Add("hom10", OleDbType.Integer).Value = int.Parse(sj.Get("hom10"));
            }
            else
            {
                sentencia.Parameters.Add("hom10", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("muj1") != null)
            {
                sentencia.Parameters.Add("muj1", OleDbType.Integer).Value = int.Parse(sj.Get("muj1"));
            }
            else
            {
                sentencia.Parameters.Add("muj1", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("muj2") != null)
            {
                sentencia.Parameters.Add("muj2", OleDbType.Integer).Value = int.Parse(sj.Get("muj2"));
            }
            else
            {
                sentencia.Parameters.Add("muj2", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("muj3") != null)
            {
                sentencia.Parameters.Add("muj3", OleDbType.Integer).Value = int.Parse(sj.Get("muj3"));
            }
            else
            {
                sentencia.Parameters.Add("muj3", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("muj4") != null)
            {
                sentencia.Parameters.Add("muj4", OleDbType.Integer).Value = int.Parse(sj.Get("muj4"));
            }
            else
            {
                sentencia.Parameters.Add("muj4", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("muj5") != null)
            {
                sentencia.Parameters.Add("muj5", OleDbType.Integer).Value = int.Parse(sj.Get("muj5"));
            }
            else
            {
                sentencia.Parameters.Add("muj5", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("muj6") != null)
            {
                sentencia.Parameters.Add("muj6", OleDbType.Integer).Value = int.Parse(sj.Get("muj6"));
            }
            else
            {
                sentencia.Parameters.Add("muj6", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("muj7") != null)
            {
                sentencia.Parameters.Add("muj7", OleDbType.Integer).Value = int.Parse(sj.Get("muj7"));
            }
            else
            {
                sentencia.Parameters.Add("muj7", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("muj8") != null)
            {
                sentencia.Parameters.Add("muj8", OleDbType.Integer).Value = int.Parse(sj.Get("muj8"));
            }
            else
            {
                sentencia.Parameters.Add("muj8", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("muj9") != null)
            {
                sentencia.Parameters.Add("muj9", OleDbType.Integer).Value = int.Parse(sj.Get("muj9"));
            }
            else
            {
                sentencia.Parameters.Add("muj9", OleDbType.Integer).Value = 0;
            }

            if (sj.Get("muj10") != null)
            {
                sentencia.Parameters.Add("muj10", OleDbType.Integer).Value = int.Parse(sj.Get("muj10"));
            }
            else
            {
                sentencia.Parameters.Add("muj10", OleDbType.Integer).Value = 0;
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

        public string ObtenerPlanificacion(string codusu)
        {
            string consulta = "sp_obtener_planificacion";
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
                    respuesta.Append("{\"planificacion\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");

                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }
        public void GuardarPlanificacion(string qsdecode, string codusu)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;
            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);

            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_guardar_planificacion", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codusu", OleDbType.Integer).Value = int.Parse(codusu);
            sentencia.Parameters.Add("mision", OleDbType.VarChar).Value = sj.Get("mision");
            sentencia.Parameters.Add("vision", OleDbType.VarChar).Value = sj.Get("vision");
            sentencia.Parameters.Add("objetivos", OleDbType.VarChar).Value = sj.Get("objetivos");

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

        public string ObtenerProyectos(string codest)
        {
            string consulta = "sp_obtener_proyectos";
            DataTable dtTemp = null;
            string resp = null;
            StringBuilder respuesta = new StringBuilder();
            OleDbConnection conexion = new OleDbConnection(strConexion);

            OleDbCommand sentencia = new OleDbCommand(consulta, conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);

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
                    respuesta.Append("{\"proyectos\":");
                    respuesta.Append(resp);
                    respuesta.Append("}");

                }
                else
                {
                    respuesta.Append("{\"proyectos\":[]}");
                }

                resultSet.Close();

                conexion.Close();

            }

            catch (OleDbException ode)
            {


            }

            return respuesta.ToString();

        }
        public void GuardarProyectos(string qsdecode, string codest)
        {
            OleDbConnection conexion = null;
            OleDbCommand sentencia = null;
            NameValueCollection sj = SerializaJSON.ParseQueryString(qsdecode);

            conexion = new OleDbConnection(strConexion);

            sentencia = new OleDbCommand("sp_guardar_proyectos", conexion);
            sentencia.CommandType = CommandType.StoredProcedure;

            sentencia.Parameters.Add("codest", OleDbType.Integer).Value = int.Parse(codest);
            sentencia.Parameters.Add("proyectos", OleDbType.VarChar).Value = sj.Get("proyecto");

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

    }
}
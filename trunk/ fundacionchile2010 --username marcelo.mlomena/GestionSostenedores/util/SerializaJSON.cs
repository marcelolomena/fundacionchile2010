using System;
using System.Collections;
using System.Collections.Specialized;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Generic;


/// <summary>
/// Summary description for UsuarioFWVS
/// </summary>
public class SerializaJSON
{
    public SerializaJSON()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    #region "loso"

    /// <summary>
    /// Constructs a QueryString (string).
    /// Consider this method to be the opposite of "System.Web.HttpUtility.ParseQueryString"
    /// </summary>
    /// <param name="nvc">NameValueCollection</param>
    /// <returns>String</returns>
    public static String ConstructQueryString(NameValueCollection parameters)
    {
        List<String> items = new List<String>();

        foreach (String name in parameters)

            items.Add(String.Concat(name, "=", parameters[name]));
        return String.Join("&", items.ToArray());
    }




    public static NameValueCollection ParseQueryString(string s)
    {
        NameValueCollection nvc = new NameValueCollection();

        // remove anything other than query string from url
        if (s.Contains("?"))
        {
            s = s.Substring(s.IndexOf('?') + 1);
        }

        foreach (string vp in Regex.Split(s, "&"))
        {
            string[] singlePair = Regex.Split(vp, "=");
            if (singlePair.Length == 2)
            {
                nvc.Add(singlePair[0], singlePair[1]);
            }
            else
            {
                // only one key with no value specified in query string
                nvc.Add(singlePair[0], string.Empty);
            }
        }

        return nvc;
    }
    public static string CadenaDesdeDataTable(DataTable dt, bool alwaysArray)
    {
        StringBuilder resp = new StringBuilder();
        int tope = 600;//definir tope de filas para retornar consulta
        if (dt != null && dt.Rows.Count > 0)
        {
            resp.Append((!alwaysArray && dt.Rows.Count == 1) ? "" : "[");
            for (int i = 0; i < dt.Rows.Count && i < tope; i++)
            {
                resp.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    resp.Append("\"" + dt.Columns[j].ColumnName.ToUpperInvariant() + "\":");
                    String valor = dt.Rows[i][j].ToString();
                    valor = valor.Replace("\"", "");
                    resp.Append("\"" + valor + "\"");
                    if (j != (dt.Columns.Count - 1))
                    {
                        resp.Append(",");
                    }
                }
                resp.Append("}");
                if (i != (dt.Rows.Count - 1) && i != (tope - 1))
                {
                    resp.Append(",");
                }
            }
            resp.Append((!alwaysArray && dt.Rows.Count == 1) ? "" : "]");
        }
        else
        {
            resp.Append("[]");
        }
        return resp.ToString();
    }

    public static string UnirCadenaDesdeDataTable(DataTable dt1, DataTable dt2, bool alwaysArray)
    {
        StringBuilder resp = new StringBuilder();
        int tope = 600;//definir tope de filas para retornar consulta
        if ((dt1 != null && dt1.Rows.Count > 0) && (dt2 != null && dt2.Rows.Count > 0))
        {
            resp.Append(((!alwaysArray && dt1.Rows.Count == 1) && (!alwaysArray && dt2.Rows.Count == 1) )? "" : "[");

            for (int i = 0; i < dt1.Rows.Count && i < tope; i++)
            {
                resp.Append("{");
                for (int j = 0; j < dt1.Columns.Count; j++)
                {
                    resp.Append("\"" + dt1.Columns[j].ColumnName.ToUpperInvariant() + "\":");
                    String valor = dt1.Rows[i][j].ToString();
                    valor = valor.Replace("\"", "");
                    resp.Append("\"" + valor + "\"");
                    if (j != (dt1.Columns.Count - 1))
                    {
                        resp.Append(",");
                    }
                }
                resp.Append("}");
                if (i != (dt1.Rows.Count - 1) && i != (tope - 1))
                {
                    resp.Append(",");
                }
            }

            resp.Append(",");

            for (int i = 0; i < dt2.Rows.Count && i < tope; i++)
            {
                resp.Append("{");
                for (int j = 0; j < dt2.Columns.Count; j++)
                {
                    resp.Append("\"" + dt2.Columns[j].ColumnName.ToUpperInvariant() + "\":");
                    String valor = dt2.Rows[i][j].ToString();
                    valor = valor.Replace("\"", "");
                    resp.Append("\"" + valor + "\"");
                    if (j != (dt2.Columns.Count - 1))
                    {
                        resp.Append(",");
                    }
                }
                resp.Append("}");
                if (i != (dt2.Rows.Count - 1) && i != (tope - 1))
                {
                    resp.Append(",");
                }
            }


            resp.Append(((!alwaysArray && dt1.Rows.Count == 1) && (!alwaysArray && dt2.Rows.Count == 1)) ? "" : "]");
        }
        else
        {
            resp.Append("[]");
        }
        return resp.ToString();
    }

    public static string CadenaMinDesdeDataTable(DataTable dt)
    {
        StringBuilder resp = new StringBuilder();
        int tope = 600;//definir tope de filas para retornar consulta
        if (dt != null && dt.Rows.Count > 0)
        {
            resp.Append("[");
            for (int i = 0; i < dt.Rows.Count && i < tope; i++)
            {
                resp.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    resp.Append("\"" + dt.Columns[j].ColumnName + "\":");
                    resp.Append("\"" + dt.Rows[i][j] + "\"");
                    if (j != (dt.Columns.Count - 1))
                    {
                        resp.Append(",");
                    }
                }
                resp.Append("}");
                if (i != (dt.Rows.Count - 1) && i != (tope - 1))
                {
                    resp.Append(",");
                }
            }
            resp.Append("]");
        }
        else
        {
            resp.Append("[]");
        }
        return resp.ToString();
    }


    public static string CadenaDesdeDataTable(DataTable dt)
    {
        return CadenaDesdeDataTable(dt, true);
    }
    public static string UnirCadenaDesdeDataTable(DataTable dt1,DataTable dt2)
    {
        return UnirCadenaDesdeDataTable(dt1, dt2, true);
    }
    #endregion

    #region "jpaf"
    public static string TableDesdeDataTable(DataTable dt)
    {
        StringBuilder resp = new StringBuilder();
        int tope = 600;//definir tope de filas para retornar consulta
        if (dt != null && dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count && i < tope; i++)
            {
                resp.Append("<tr>");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    String valor = dt.Rows[i][j].ToString();
                    valor = valor.Replace("\"", "");
                    resp.Append("<td>" + valor + "</td>");
                }
                resp.Append("</tr>");
            }
        }
        else
        {
            resp.Append("");
        }
        return resp.ToString();
    }
    #endregion

}
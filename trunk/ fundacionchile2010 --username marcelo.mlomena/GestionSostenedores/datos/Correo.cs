using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.ComponentModel;

namespace GestionSostenedores.datos
{
    public class Correo
    {
        public Correo()
        {
        }

        public void SendEmail(string strFrom, string strTo, string strSubject, string strBodyText)
        {
            MailMessage Mail = new MailMessage();
            Mail.From = new MailAddress(strFrom);
            Mail.To.Add(strTo);
            Mail.Subject = strSubject;
            Mail.Body = strBodyText;
            SmtpClient SMTPClient = new SmtpClient();
            //NetworkCredential basicAuthenticationInfo = new NetworkCredential("algun_correo1", "algun_password1");
            SMTPClient.Host = "10.0.14.11";
            SMTPClient.Port = 25;
            SMTPClient.UseDefaultCredentials = true;
            //SMTPClient.Credentials = basicAuthenticationInfo;

            SMTPClient.SendCompleted += new SendCompletedEventHandler(CheckIfError);
            SMTPClient.SendAsync(Mail, Mail);


        }

        private static void CheckIfError(object sender, AsyncCompletedEventArgs e)
        {
            if (e.Error != null || e.Cancelled)
            {
                //podrías escribir el error a un archivo de texto 
                const string fic = @"E:\loso\error.log";
                string texto = e.Error.Message;

                System.IO.StreamWriter sw = new System.IO.StreamWriter(fic);
                sw.WriteLine(texto);
                sw.Close();
            }
            else
            {
                //podrías grabar el éxitoso envío a un archivo de texto. 
                const string fic = @"E:\loso\exito.log";
                string texto = "correo enviado";

                System.IO.StreamWriter sw = new System.IO.StreamWriter(fic);
                sw.WriteLine(texto);
                sw.Close();
            }
        }


    }
}
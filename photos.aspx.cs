using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploadControl.HasFile)
        {
            try
            {
                if (FileUploadControl.PostedFile.ContentType == "image/jpeg" || FileUploadControl.PostedFile.ContentType == "image/png")
                {
                    if (FileUploadControl.PostedFile.ContentLength < 512000)
                    {
                        string filename = Path.GetFileName(FileUploadControl.FileName);
                        FileUploadControl.SaveAs(Server.MapPath("~/upimage/") + filename);
                        StatusLabel.ForeColor = System.Drawing.ColorTranslator.FromHtml("#32CD32");
                        StatusLabel.Text = "Estatus de la subida: ¡Archivo subido!";
                    }
                    else
                        StatusLabel.Text = "Estatus de la subida: ¡La imagen debe pesar menos de 500kb!";
                }
                else
                    StatusLabel.Text = "Estatus de la subida: ¡Solo imagenes PNG o JPEG soportadas!";
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Estatus de la subida: El siguiente error ha ocurrido: " + ex.Message;
            }
        }
    }
}
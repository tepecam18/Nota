using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Uye_Yönet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["Nota_veritabani"].ConnectionString);
            SqlCommand komut = new SqlCommand
            {
                Connection = baglanti,
                CommandType = System.Data.CommandType.StoredProcedure,
                CommandText = "Sp_Nota_yukleme"
            };
            komut.Parameters.AddWithValue("@eAdi", EserAdi.Text);
            komut.Parameters.AddWithValue("@Bestekar", Bestekari.Text);
            komut.Parameters.AddWithValue("@Formu", Formu.Text);
            komut.Parameters.AddWithValue("@Makami", Makami.Text);
            komut.Parameters.AddWithValue("@SozYazari", SozYazari.Text);
            komut.Parameters.AddWithValue("@Usulu", Usulu.Text);
            komut.Parameters.AddWithValue("@puan", Puan.Text);
            komut.Parameters.AddWithValue("@kID", Session["OturumID"]);
            komut.Parameters.AddWithValue("@topSayfa", FileUpload1.PostedFiles.Count);
            baglanti.Open();
            SqlDataReader satır = komut.ExecuteReader();
            if (satır.Read())
            {
                for (int i = 0; i < FileUpload1.PostedFiles.Count; i++)
                {
                    FileUpload1.SaveAs(Server.MapPath("~/img/Notalar/") + satır["NotaID"]+"x"+(i+1)+".png");

                }
                Label1.CssClass = "alert-success form-control text-center";
                Label1.Text = "Nota Yüklendi";
            }
            baglanti.Close();
            satır.Close();
        }
        else
        {
            Label1.CssClass = "alert-danger form-control text-center";
            Label1.Text = "Lütfen Dosya seçiniz";
            FileUpload1.Focus();
        }
    }
}
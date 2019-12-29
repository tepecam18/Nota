using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Uye_UyeOl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        Label1.Text = "Üye İşleminiz Başarılı bir şekilde gerçekleşmiştir";
        Label1.CssClass = "alert-danger w-100 btn";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["Nota_veritabani"].ConnectionString);
        string sql = "Select * From Tbl_Kullanicilar where KullaniciAdi=@kAd and Sifre=HASHBYTES('MD5', @Sif)";
        SqlCommand komut = new SqlCommand
        {
            CommandText = sql,
            Connection = baglanti
        };
        komut.Parameters.AddWithValue("@kAd", kAdi.Text);
        komut.Parameters.AddWithValue("@Sif", Sifre.Text);
        baglanti.Open();
        SqlDataReader satir = komut.ExecuteReader();
        if (satir.Read())
        {
            Session["KullaniciTipi"] = "Notaci";
            Session["OturumID"] = satir["KullaniciID"].ToString();
            Session.Timeout = 60;
            Response.Redirect("~/Uye/AnaSayfa.aspx");
        }
        else
        {
            Label4.Text = "Kullanıcı Adi veya Sifre Hatalı...";
            Label4.CssClass = "alert-danger w-100 btn";
        }
        baglanti.Close();
        satir.Close();
    }
}
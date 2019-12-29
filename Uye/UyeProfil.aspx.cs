using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class Uye_UyeProfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void degisitir_Click(object sender, EventArgs e)
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["Nota_veritabani"].ConnectionString);
        string sql = "Select * From Tbl_Kullaniciler Where KullaniciID = @kID and Sifre=HASHBYTES('MD5', @Sif)";
        SqlCommand komut = new SqlCommand();
        komut.Connection = baglanti;
        komut.CommandText = sql;
        komut.Parameters.AddWithValue("@kID", Session["OturumID"]);
        komut.Parameters.AddWithValue("@Sif", mevcut.Text);
        baglanti.Open();
        SqlDataReader satir = komut.ExecuteReader();
        if (satir.Read())
        {

        }
        else
        {
            sonuc.Text = "Hatalı Şifre...";
        }

    }

    protected void degisitir_Click1(object sender, EventArgs e)
    {
        if (mevcut.Text == yeni.Text)
        {
            sonuc.Text = "Mevcut Sifre Yeni sifre ile aynı olamaz";
            sonuc.CssClass = "alert-danger w-100 btn";
        }
        else
        {
            SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["Nota_veritabani"].ConnectionString);
            string sql = "Select * From Tbl_Kullanicilar where KullaniciID=@kID and Sifre=HASHBYTES('MD5', @Sif)";
            SqlCommand komut = new SqlCommand
            {
                CommandText = sql,
                Connection = baglanti
            };
            komut.Parameters.AddWithValue("@kID", Session["OturumID"]);
            komut.Parameters.AddWithValue("@Sif", mevcut.Text);
            baglanti.Open();
            SqlDataReader satir = komut.ExecuteReader();
            if (satir.Read())
            {
                if (yeni.Text == dogrulama.Text)
                {
                    sql = "Update Tbl_Kullanicilar Set Sifre = HASHBYTES('MD5', @Sif) Where KullaniciID = @kID";
                    SqlCommand komut2 = new SqlCommand
                    {
                        CommandText = sql,
                        Connection = baglanti
                    };
                    komut2.Parameters.AddWithValue("@kID", Session["OturumID"]);
                    komut2.Parameters.AddWithValue("@Sif", yeni.Text);
                    satir.Close();
                    komut2.ExecuteNonQuery();
                    sonuc.Text = "İşlem Başarıyla Gerçekleşti";
                    sonuc.CssClass = "alert-success w-100 btn";
                }
                else
                {
                    sonuc.Text = "Yeni Sifreler birbirleri ile eşleşmedi";
                    sonuc.CssClass = "alert-danger w-100 btn";
                    yeni.Focus();
                }
            }
            else
            {
                sonuc.Text = "Mevcut Sifre Hatalı...";
                sonuc.CssClass = "alert-danger w-100 btn";
                yeni.Focus();
            }
            baglanti.Close();
            satir.Close();
        }
    }
}
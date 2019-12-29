using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class Uye_PuanYükle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Puan10_Click(object sender, EventArgs e)
    {
        PuanYukle(Convert.ToInt32(Puan10.Text));
    }


    protected void Puan20_Click(object sender, EventArgs e)
    {
        PuanYukle(Convert.ToInt32(Puan20.Text));
    }

    protected void Puan30_Click(object sender, EventArgs e)
    {
        PuanYukle(Convert.ToInt32(Puan30.Text));
    }

    protected void Puan40_Click(object sender, EventArgs e)
    {
        PuanYukle(Convert.ToInt32(Puan40.Text));
    }

    protected void Puan50_Click(object sender, EventArgs e)
    {
        PuanYukle(Convert.ToInt32(Puan50.Text));
    }

    protected void Puan60_Click(object sender, EventArgs e)
    {
        PuanYukle(Convert.ToInt32(Puan60.Text));
    }
    protected void Puan70_Click(object sender, EventArgs e)
    {
        PuanYukle(Convert.ToInt32(Puan70.Text));
    }

    protected void Puan80_Click(object sender, EventArgs e)
    {
        PuanYukle(Convert.ToInt32(Puan80.Text));
    }

    protected void Puan90_Click(object sender, EventArgs e)
    {
        PuanYukle(Convert.ToInt32(Puan90.Text));
    }

    protected void Puan100_Click(object sender, EventArgs e)
    {
        PuanYukle(Convert.ToInt32(Puan100.Text));
    }

    void PuanYukle(int puan)
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["Nota_veritabani"].ConnectionString);
        string str = "INSERT INTO Tbl_Puanlar(KullaniciID, Puan) VALUES (@kID, @puan)";
        SqlCommand komut = new SqlCommand();
        komut.CommandText = str;
        komut.Connection = baglanti;
        komut.Parameters.AddWithValue("@kID", Session["OturumID"]);
        komut.Parameters.AddWithValue("@puan", puan);
        baglanti.Open();
        komut.ExecuteNonQuery();
        baglanti.Close();
        Response.Redirect("~/Uye/PuanYükle.aspx");
    }
}
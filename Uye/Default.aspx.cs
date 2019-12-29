using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Uye_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["Nota_veritabani"].ConnectionString);
        SqlCommand komut = new SqlCommand
        {
            CommandType = System.Data.CommandType.StoredProcedure,
            Connection = baglanti,
            CommandText = "Sp_nota_Alma"
        };
        komut.Parameters.AddWithValue("@kID", Session["OturumID"]);
        komut.Parameters.AddWithValue("@nID", Request.QueryString["nota"]);
        baglanti.Open();
        SqlDataReader satir = komut.ExecuteReader();
        if (satir.Read())
        {
            Label uyari = (Label)FormView1.FindControl("uyari");
            uyari.CssClass = satir["Renk"].ToString();
            uyari.Text = satir["Durum"].ToString();
        }
        baglanti.Close();
        satir.Close();
    }
}
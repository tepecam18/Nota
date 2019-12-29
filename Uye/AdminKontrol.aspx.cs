using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uye_AdminKontrol : System.Web.UI.Page
{
    SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["Nota_veritabani"].ConnectionString);

    void PuanGuncelle()
    {
        SqlCommand komut = new SqlCommand
        {
            Connection = baglanti,
            CommandType = System.Data.CommandType.StoredProcedure,
            CommandText = "Sp_puan_Bilgileri"
        };
        komut.Parameters.AddWithValue("@kID", Session["OturumID"]);
        komut.Parameters.AddWithValue("@nota", DropDownList1.SelectedValue);
        baglanti.Open();
        SqlDataReader satir = komut.ExecuteReader();
        if (satir.Read())
        {
            TextBox1.Text = satir["Puan"].ToString();
            TextBox2.Text = satir["kPuan"].ToString();
            if (satir["topPuan"].ToString() != "")
            {
                topPuan.Text = satir["topPuan"].ToString();
            }
        }
        baglanti.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Label6.Visible = Button4.Visible = Button5.Visible = true;
    }

    protected void DropDownList1_TextChanged(object sender, EventArgs e)
    {
        PuanGuncelle();
    }


    protected void FormView1_DataBinding(object sender, EventArgs e)
    {
        PuanGuncelle();
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text != null)
        {
            TextBox2.Text = Convert.ToInt32(Convert.ToInt32(TextBox1.Text) * 1.3).ToString();
            TextBox1.Focus();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand komut = new SqlCommand
        {
            Connection = baglanti,
            CommandType = System.Data.CommandType.StoredProcedure,
            CommandText = "Sp_kullaniciID_nota_puan_Guncelle"
        };
        komut.Parameters.AddWithValue("@nota", DropDownList1.SelectedValue);
        komut.Parameters.AddWithValue("@puan", TextBox1.Text);
        baglanti.Open();
        komut.ExecuteNonQuery();
        baglanti.Close();
        Label5.Text = "Puan Verileri Güncellendi";
        Label5.CssClass = "btn alert-danger w-100";
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Label6.Visible = Button4.Visible = Button5.Visible = false;
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlCommand komut = new SqlCommand
        {
            Connection = baglanti,
            CommandType = System.Data.CommandType.StoredProcedure,
            CommandText = "Sp_kullaniciID_nota_hesabina_puan_Yukle"
        };
        komut.Parameters.AddWithValue("@kID", Session["OturumID"]);
        komut.Parameters.AddWithValue("@nota", DropDownList1.SelectedValue);
        baglanti.Open();
        komut.ExecuteNonQuery();
        baglanti.Close();
        Label6.Visible = Button4.Visible = Button5.Visible = false;
        Label7.Visible = true;
    }
}
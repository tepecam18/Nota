using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uye_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["KullaniciTipi"] != "Notaci" && Request.Url.AbsolutePath != "/Uye/UyeGiris.aspx")
        {
            Response.Redirect("~/Uye/OturumKapat.aspx");
        }
    }
}

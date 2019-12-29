<%@ Page Title="" Language="C#" MasterPageFile="~/Uye/MasterPage.master" AutoEventWireup="true" CodeFile="UyeGiris.aspx.cs" Inherits="Uye_UyeOl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-6 bg-white">
        <h4 class="border-bottom pb-2 font-weight-bold">Giriş Yap</h4>
    </div>
    <div class="col-md-6">
        <h4 class="border-bottom pb-2 font-weight-bold">Üye Ol</h4>
    </div>
    <div class="col-md-6 pr-0 align-self-center">
        <asp:Label ID="Label2" runat="server" Text="Kullanıcı Adı"></asp:Label>
        :<asp:TextBox ID="kAdi" runat="server" CssClass="form-control"></asp:TextBox>
&nbsp;<br />
        <asp:Label ID="Label3" runat="server" Text="Sifre"></asp:Label>
        :<asp:TextBox ID="Sifre" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
&nbsp;<br />
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-success px-4" Text="Giriş" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server"></asp:Label>
    </div>
    <div class="col-md-6 pr-0 border-top-0">
        <asp:FormView ID="FormView1" runat="server" CssClass="table table-bordered table-dark" DataKeyNames="KullaniciID" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted">
            <EditItemTemplate>
                KullaniciID:
                <asp:Label ID="KullaniciIDLabel1" runat="server" Text='<%# Eval("KullaniciID") %>' />
                <br />
                AdSoyad:
                <asp:TextBox ID="AdSoyadTextBox" runat="server" Text='<%# Bind("AdSoyad") %>' />
                <br />
                Eposta:
                <asp:TextBox ID="EpostaTextBox" runat="server" Text='<%# Bind("Eposta") %>' />
                <br />
                Tel:
                <asp:TextBox ID="TelTextBox" runat="server" Text='<%# Bind("Tel") %>' />
                <br />
                DogumTarihi:
                <asp:TextBox ID="DogumTarihiTextBox" runat="server" Text='<%# Bind("DogumTarihi") %>' />
                <br />
                KullaniciAdi:
                <asp:TextBox ID="KullaniciAdiTextBox" runat="server" Text='<%# Bind("KullaniciAdi") %>' />
                <br />
                Sifre:
                <asp:TextBox ID="SifreTextBox" runat="server" Text='<%# Bind("Sifre") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelleştir" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Ad Soyad:
                <asp:TextBox ID="AdSoyadTextBox" runat="server" CssClass="form-control" Text='<%# Bind("AdSoyad") %>' />
                <br />
                E-posta:
                <asp:TextBox ID="EpostaTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Eposta") %>' />
                <br />
                Telefon No:
                <asp:TextBox ID="TelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Tel") %>' />
                <br />
                Dogum Tarihi:
                <asp:TextBox ID="TelTextBox0" runat="server" CssClass="form-control" Text='<%# Bind("DogumTarihi", "{0:d}") %>' TextMode="Date" />
                <br />
                Kullanıcı Adı:
                <asp:TextBox ID="KullaniciAdiTextBox" runat="server" CssClass="form-control" Text='<%# Bind("KullaniciAdi") %>' />
                <br />
                Sifre:
                <asp:TextBox ID="SifreTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Sifre") %>' TextMode="Password" />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Üye Ol" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-danger" Text="İptal" />
            </InsertItemTemplate>
            <ItemTemplate>
                KullaniciID:
                <asp:Label ID="KullaniciIDLabel" runat="server" Text='<%# Eval("KullaniciID") %>' />
                <br />
                AdSoyad:
                <asp:Label ID="AdSoyadLabel" runat="server" Text='<%# Bind("AdSoyad") %>' />
                <br />
                Eposta:
                <asp:Label ID="EpostaLabel" runat="server" Text='<%# Bind("Eposta") %>' />
                <br />
                Tel:
                <asp:Label ID="TelLabel" runat="server" Text='<%# Bind("Tel") %>' />
                <br />
                DogumTarihi:
                <asp:Label ID="DogumTarihiLabel" runat="server" Text='<%# Bind("DogumTarihi") %>' />
                <br />
                KullaniciAdi:
                <asp:Label ID="KullaniciAdiLabel" runat="server" Text='<%# Bind("KullaniciAdi") %>' />
                <br />
                Sifre:
                <asp:Label ID="SifreLabel" runat="server" Text='<%# Bind("Sifre") %>' />
                <br />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Yeni" />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Nota_veritabani %>" InsertCommand="INSERT INTO Tbl_Kullanicilar(AdSoyad, Eposta, Tel, DogumTarihi, KullaniciAdi, Sifre) VALUES (@AdSoyad, @Eposta, @Tel, @DogumTarihi, @KullaniciAdi, HASHBYTES(N'MD5', @Sifre))" SelectCommand="SELECT * FROM [Tbl_Kullanicilar]">
            <InsertParameters>
                <asp:Parameter Name="AdSoyad" />
                <asp:Parameter Name="Eposta" />
                <asp:Parameter Name="Tel" />
                <asp:Parameter Name="DogumTarihi" />
                <asp:Parameter Name="KullaniciAdi" />
                <asp:Parameter Name="Sifre" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Uye/MasterPage.master" AutoEventWireup="true" CodeFile="UyeProfil.aspx.cs" Inherits="Uye_UyeProfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-md-6">
        <h4>Üye Bilgileri</h4>
        <p>
            <asp:FormView ID="FormView1" runat="server" CssClass="table table-bordered" DataKeyNames="KullaniciID" DataSourceID="SqlDataSource1" DefaultMode="Edit">
                <EditItemTemplate>
                    Kullanici No:
                    <asp:Label ID="KullaniciIDLabel1" runat="server" Text='<%# Eval("KullaniciID") %>' />
                    <br />
                    <br />
                    Ad Soyad:
                    <asp:TextBox ID="AdSoyadTextBox" runat="server" CssClass="form-control" Text='<%# Bind("AdSoyad") %>' />
                    <br />
                    E-posta:
                    <asp:TextBox ID="EpostaTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Eposta") %>' />
                    <br />
                    Telefon No:
                    <asp:TextBox ID="TelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Tel") %>' TextMode="Phone" />
                    <br />
                    Dogum Tarihi:
                    <asp:TextBox ID="DogumTarihiTextBox" runat="server" CssClass="form-control" Text='<%# Bind("DogumTarihi", "{0:d}") %>' TextMode="DateTime" />
                    <br />
                    Kullanici Adi:
                    <asp:TextBox ID="KullaniciAdiTextBox" runat="server" CssClass="form-control" Text='<%# Bind("KullaniciAdi") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-primary" Text="Güncelleştir" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-danger" Text="İptal" />
                </EditItemTemplate>
                <InsertItemTemplate>
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
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Ekle" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" />
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
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Düzenle" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Yeni" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Nota_veritabani %>" DeleteCommand="DELETE FROM [Tbl_Kullanicilar] WHERE [KullaniciID] = @KullaniciID" InsertCommand="INSERT INTO [Tbl_Kullanicilar] ([AdSoyad], [Eposta], [Tel], [DogumTarihi], [KullaniciAdi]) VALUES (@AdSoyad, @Eposta, @Tel, @DogumTarihi, @KullaniciAdi)" SelectCommand="SELECT [KullaniciID], [AdSoyad], [Eposta], [Tel], [DogumTarihi], [KullaniciAdi] FROM [Tbl_Kullanicilar] WHERE ([KullaniciID] = @KullaniciID)" UpdateCommand="UPDATE [Tbl_Kullanicilar] SET [AdSoyad] = @AdSoyad, [Eposta] = @Eposta, [Tel] = @Tel, [DogumTarihi] = @DogumTarihi, [KullaniciAdi] = @KullaniciAdi WHERE [KullaniciID] = @KullaniciID">
                <DeleteParameters>
                    <asp:Parameter Name="KullaniciID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AdSoyad" Type="String" />
                    <asp:Parameter Name="Eposta" Type="String" />
                    <asp:Parameter Name="Tel" Type="String" />
                    <asp:Parameter DbType="Date" Name="DogumTarihi" />
                    <asp:Parameter Name="KullaniciAdi" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="KullaniciID" SessionField="OturumID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AdSoyad" Type="String" />
                    <asp:Parameter Name="Eposta" Type="String" />
                    <asp:Parameter Name="Tel" Type="String" />
                    <asp:Parameter DbType="Date" Name="DogumTarihi" />
                    <asp:Parameter Name="KullaniciAdi" Type="String" />
                    <asp:Parameter Name="KullaniciID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </div>
    <div class="col-md-1"></div>
    <div class="col-md-5">
        <h4>Şifre Değiştirme</h4>
        <div class="table table-bordered p-3">
            <asp:Label ID="Label1" runat="server" Text="Mevcut Şifre"></asp:Label>
            <asp:TextBox ID="mevcut" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Yeni Şifre"></asp:Label>
            <asp:TextBox ID="yeni" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Şifre Tekrar"></asp:Label>
            <asp:TextBox ID="dogrulama" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="degisitir" runat="server" CssClass="btn btn-dark" Text="Değiştir" OnClick="degisitir_Click1" />
            <br />
            <br />
            <asp:Label ID="sonuc" runat="server"></asp:Label>
        </div>
        <h4>Yönetici Panel</h4>
        <a href="AdminYonet.aspx" class="btn alert-success w-100 my-1 border-dark btn-success">Sisteme Nota Yükle</a>
        <a href="AdminKontrol.aspx" class="btn alert-success w-100 my-1 border-dark btn-success">Sisteme Yüklediğin notaları görüntüle</a>
    </div>
</asp:Content>


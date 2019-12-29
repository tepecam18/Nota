<%@ Page Title="" Language="C#" MasterPageFile="~/Uye/MasterPage.master" AutoEventWireup="true" CodeFile="AdminKontrol.aspx.cs" Inherits="Uye_AdminKontrol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12 text-center mb-2">
        &nbsp;<asp:Label ID="Label1" runat="server" CssClass="alert-primary btn w-50" Text="Düzenlemek istediginiz Nota'nın Kayıt Numarasını Seçiniz"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="px-5 btn btn-light" DataSourceID="SqlDataSource1" DataTextField="NotaID" DataValueField="NotaID" OnTextChanged="DropDownList1_TextChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Nota_veritabani %>" SelectCommand="SELECT [NotaID], [KullaniciID] FROM [Tbl_NotaSatis] WHERE ([KullaniciID] = @KullaniciID)">
            <SelectParameters>
                <asp:SessionParameter Name="KullaniciID" SessionField="OturumID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="col-md-8">
        <h4>Nota Genel Bilgileri</h4>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="NotaID" DataSourceID="SqlDataSource2" CssClass="table table-bordered" DefaultMode="Edit" OnDataBinding="FormView1_DataBinding">
            <EditItemTemplate>
                Eser Adı:
                <asp:TextBox ID="EserAdiTextBox" runat="server" Text='<%# Bind("EserAdi") %>' CssClass="form-control" />
                <br />
                Makamı:
                <asp:TextBox ID="MakamiTextBox" runat="server" Text='<%# Bind("Makami") %>' CssClass="form-control" />
                <br />
                Bestekarı:
                <asp:TextBox ID="BestekariTextBox" runat="server" Text='<%# Bind("Bestekari") %>' CssClass="form-control" />
                <br />
                Söz Yazari:
                <asp:TextBox ID="SozYazariTextBox" runat="server" Text='<%# Bind("SozYazari") %>' CssClass="form-control" />
                <br />
                Formu:
                <asp:TextBox ID="FormuTextBox" runat="server" Text='<%# Bind("Formu") %>' CssClass="form-control" />
                <br />
                Usulü:
                <asp:TextBox ID="UsuluTextBox" runat="server" Text='<%# Bind("Usulu") %>' CssClass="form-control" />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelleştir" CssClass="btn w-25 alert-success" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" CssClass="btn alert-danger px-4" />
            </EditItemTemplate>
            <InsertItemTemplate>
                EserAdi:
                <asp:TextBox ID="EserAdiTextBox" runat="server" Text='<%# Bind("EserAdi") %>' />
                <br />
                Makami:
                <asp:TextBox ID="MakamiTextBox" runat="server" Text='<%# Bind("Makami") %>' />
                <br />
                Bestekari:
                <asp:TextBox ID="BestekariTextBox" runat="server" Text='<%# Bind("Bestekari") %>' />
                <br />
                SozYazari:
                <asp:TextBox ID="SozYazariTextBox" runat="server" Text='<%# Bind("SozYazari") %>' />
                <br />
                Formu:
                <asp:TextBox ID="FormuTextBox" runat="server" Text='<%# Bind("Formu") %>' />
                <br />
                Usulu:
                <asp:TextBox ID="UsuluTextBox" runat="server" Text='<%# Bind("Usulu") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Ekle" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" />
            </InsertItemTemplate>
            <ItemTemplate>
                NotaID:
                <asp:Label ID="NotaIDLabel" runat="server" Text='<%# Eval("NotaID") %>' />
                <br />
                EserAdi:
                <asp:Label ID="EserAdiLabel" runat="server" Text='<%# Bind("EserAdi") %>' />
                <br />
                Makami:
                <asp:Label ID="MakamiLabel" runat="server" Text='<%# Bind("Makami") %>' />
                <br />
                Bestekari:
                <asp:Label ID="BestekariLabel" runat="server" Text='<%# Bind("Bestekari") %>' />
                <br />
                SozYazari:
                <asp:Label ID="SozYazariLabel" runat="server" Text='<%# Bind("SozYazari") %>' />
                <br />
                Formu:
                <asp:Label ID="FormuLabel" runat="server" Text='<%# Bind("Formu") %>' />
                <br />
                Usulu:
                <asp:Label ID="UsuluLabel" runat="server" Text='<%# Bind("Usulu") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Düzenle" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Yeni" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Nota_veritabani %>" DeleteCommand="DELETE FROM [Tbl_Notalar] WHERE [NotaID] = @NotaID" InsertCommand="INSERT INTO [Tbl_Notalar] ([EserAdi], [Makami], [Bestekari], [SozYazari], [Formu], [Usulu]) VALUES (@EserAdi, @Makami, @Bestekari, @SozYazari, @Formu, @Usulu)" SelectCommand="SELECT [NotaID], [EserAdi], [Makami], [Bestekari], [SozYazari], [Formu], [Usulu] FROM [Tbl_Notalar] WHERE ([NotaID] = @NotaID)" UpdateCommand="UPDATE [Tbl_Notalar] SET [EserAdi] = @EserAdi, [Makami] = @Makami, [Bestekari] = @Bestekari, [SozYazari] = @SozYazari, [Formu] = @Formu, [Usulu] = @Usulu WHERE [NotaID] = @NotaID">
            <DeleteParameters>
                <asp:Parameter Name="NotaID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EserAdi" Type="String" />
                <asp:Parameter Name="Makami" Type="String" />
                <asp:Parameter Name="Bestekari" Type="String" />
                <asp:Parameter Name="SozYazari" Type="String" />
                <asp:Parameter Name="Formu" Type="String" />
                <asp:Parameter Name="Usulu" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="NotaID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="EserAdi" Type="String" />
                <asp:Parameter Name="Makami" Type="String" />
                <asp:Parameter Name="Bestekari" Type="String" />
                <asp:Parameter Name="SozYazari" Type="String" />
                <asp:Parameter Name="Formu" Type="String" />
                <asp:Parameter Name="Usulu" Type="String" />
                <asp:Parameter Name="NotaID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div class="col-md-4 bg-light">
        <h4>Nota Puan Bilgileri</h4>
        <asp:Label ID="Label2" runat="server" Text="Nota satışından alacagınız puan :"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="w-25 btn btn-light border-dark" AutoPostBack="True" EnableTheming="True" OnTextChanged="TextBox1_TextChanged" TextMode="Number"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="%30 komisyon payıyla hesaplanmış güncel satış puanı : "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="w-25" Enabled="False"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" CssClass="btn alert-primary w-100" OnClick="Button1_Click" Text="Değişiklikleri Kaydet" />
        <br />
        <br />
        <asp:Label ID="Label5" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Toplam satışdan elde edilen puan : "></asp:Label>
        &nbsp;
        <asp:Label ID="topPuan" runat="server" CssClass="text-warning" Font-Size="Large" Text="0"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" CssClass="btn alert-primary w-100" OnClick="Button2_Click" Text="Puanımı Hesabıma aktar" />
        <br />
        <asp:Label ID="Label6" runat="server" CssClass="btn alert-dark w-100" Visible="False">Puanlarınız Nota hesabınıza aktarılıcak. Bu işlem Geri alınamaz Onaylıyor musunuz?</asp:Label>
        <p class="text-center">
            <asp:Button ID="Button4" runat="server" CssClass="btn alert-success w-25" Text="Devam Et" Visible="False" OnClick="Button4_Click" />
            <asp:Button ID="Button5" runat="server" CssClass="btn alert-danger w-25" OnClick="Button5_Click" Text="İptal Et" Visible="False" />
        </p>
        <p class="text-center">
            <asp:Label ID="Label7" runat="server" Text="Puan Hesabınıza Başarıyla Yüklendi" CssClass="btn alert-success w-25" Visible="False"></asp:Label>
        </p>
        <asp:Button ID="Button3" runat="server" CssClass="btn alert-primary w-100" Text="Puanımı Dışarı aktar" />
    </div>
</asp:Content>


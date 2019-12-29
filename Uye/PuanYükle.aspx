<%@ Page Title="" Language="C#" MasterPageFile="~/Uye/MasterPage.master" AutoEventWireup="true" CodeFile="PuanYükle.aspx.cs" Inherits="Uye_PuanYükle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12">
            <h4 class="text-center">Puan Yükleme</h4>
            <p class="text-center">
                <asp:FormView ID="FormView1" runat="server" CssClass="table text-center" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        KullaniciAdi:
                        <asp:TextBox ID="KullaniciAdiTextBox" runat="server" Text='<%# Bind("KullaniciAdi") %>' />
                        <br />
                        ToplamPuan:
                        <asp:TextBox ID="ToplamPuanTextBox" runat="server" Text='<%# Bind("ToplamPuan") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelleştir" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        KullaniciAdi:
                        <asp:TextBox ID="KullaniciAdiTextBox" runat="server" Text='<%# Bind("KullaniciAdi") %>' />
                        <br />
                        ToplamPuan:
                        <asp:TextBox ID="ToplamPuanTextBox" runat="server" Text='<%# Bind("ToplamPuan") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Ekle" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Kullanıcı :"></asp:Label>
                        &nbsp;<asp:Label ID="KullaniciAdiLabel" runat="server" CssClass="btn border active py-1 bg-warning" Text='<%# Bind("KullaniciAdi") %>' />
                        &nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" Font-Italic="True" Text="&amp;&amp;"></asp:Label>
                        &nbsp; &nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Toplam Puan :"></asp:Label>
&nbsp;<asp:Label ID="ToplamPuanLabel" runat="server" CssClass="btn border active py-1 bg-warning" Text='<%# Bind("ToplamPuan") %>' />
                        <br />

                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Nota_veritabani %>" SelectCommand="Sp_Kullanici_Puan_ve_Kullanici_Adi_Verme" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="kID" SessionField="OturumID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
    </div>
    <div class="col-md-4"></div>
    <div class="col-md-4 bg-danger">
        <asp:Button ID="Puan10" runat="server" CssClass="btn btn-dark form-control my-3" OnClick="Puan10_Click" Text="10" />
        <asp:Button ID="Puan20" runat="server" CssClass="btn btn-dark form-control my-3" OnClick="Puan20_Click" Text="20" />
        <asp:Button ID="Puan30" runat="server" CssClass="btn btn-dark form-control my-3" OnClick="Puan30_Click" Text="30" />
        <asp:Button ID="Puan40" runat="server" CssClass="btn btn-dark form-control my-3" OnClick="Puan40_Click" Text="40" />
        <asp:Button ID="Puan50" runat="server" CssClass="btn btn-dark form-control my-3" OnClick="Puan50_Click" Text="50" />
        <asp:Button ID="Puan60" runat="server" CssClass="btn btn-dark form-control my-3" OnClick="Puan60_Click" Text="60" />
        <asp:Button ID="Puan70" runat="server" CssClass="btn btn-dark form-control my-3" OnClick="Puan70_Click" Text="70" />
        <asp:Button ID="Puan80" runat="server" CssClass="btn btn-dark form-control my-3" OnClick="Puan80_Click" Text="80" />
        <asp:Button ID="Puan90" runat="server" CssClass="btn btn-dark form-control my-3" OnClick="Puan90_Click" Text="90" />
        <asp:Button ID="Puan100" runat="server" CssClass="btn btn-dark form-control my-3" OnClick="Puan100_Click" Text="100" />
    </div>
    <div class="col-md-4"></div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Uye/MasterPage.master" AutoEventWireup="true" CodeFile="Notalarim.aspx.cs" Inherits="Uye_AnaSayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12 py-3">
        <table class="table table-hover table-bordered">
            <thead>
                <tr>
                    <th></th>
                    <th>Eser Adı</th>
                    <th>Makamı</th>
                    <th>Bestekarı</th>
                    <th>Söz Yazarı</th>
                    <th>Formu</th>
                    <th>Usulu</th>
                    <th>Puan</th>
                </tr>
            </thead>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                        <tr>
                            <td><a href="Default.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><asp:Image ID="Image1" runat="server" ImageUrl="~/img/open_icon.png" CssClass="navbar-toggler-icon" /></a></td>
                            <td><a href="Default.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("EserAdi")%></a></td>
                            <td><a href="Default.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("Makami")%></a></td>
                            <td><a href="Default.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("Bestekari")%></a></td>
                            <td><a href="Default.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("SozYazari")%></a></td>
                            <td><a href="Default.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("Formu")%></a></td>
                            <td><a href="Default.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("Usulu")%></a></td>
                            <td><a href="Default.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("Puan")%></a></td>
                        </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Nota_veritabani %>" SelectCommand="SELECT Tbl_Notalar.NotaID, Tbl_Notalar.EserAdi, Tbl_Notalar.Makami, Tbl_Notalar.Bestekari, Tbl_Notalar.SozYazari, Tbl_Notalar.Formu, Tbl_Notalar.Usulu, Tbl_Notalar.Puan, Tbl_Puanlar.KullaniciID FROM Tbl_Notalar INNER JOIN Tbl_Puanlar ON Tbl_Notalar.NotaID = Tbl_Puanlar.NotaID WHERE (Tbl_Puanlar.KullaniciID = @kID)">
            <SelectParameters>
                <asp:SessionParameter Name="kID" SessionField="OturumID" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>


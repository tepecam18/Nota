<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Nota.aspx.cs" Inherits="Uye_Nota" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                            <td><a href="Sayfa.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><asp:Image ID="Image1" runat="server" ImageUrl="~/img/open_icon.png" CssClass="navbar-toggler-icon" /></a></td>
                            <td><a href="Sayfa.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("EserAdi")%></a></td>
                            <td><a href="Sayfa.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("Makami")%></a></td>
                            <td><a href="Sayfa.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("Bestekari")%></a></td>
                            <td><a href="Sayfa.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("SozYazari")%></a></td>
                            <td><a href="Sayfa.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("Formu")%></a></td>
                            <td><a href="Sayfa.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("Usulu")%></a></td>
                            <td><a href="Sayfa.aspx?nota=<%# Eval ("NotaID") %>" class="text-dark"><%# Eval ("Puan")%></a></td>
                        </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Nota_veritabani %>" SelectCommand="SELECT * FROM [Tbl_Notalar]"></asp:SqlDataSource>

    </div>

</asp:Content>


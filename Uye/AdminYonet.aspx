<%@ Page Title="" Language="C#" MasterPageFile="~/Uye/MasterPage.master" AutoEventWireup="true" CodeFile="AdminYonet.aspx.cs" Inherits="Uye_Yönet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <table class="table table-bordered bg-light">
            <tr>
                <td class="w-25">Eser Adı</td>
                <td><asp:TextBox ID="EserAdi" runat="server" CssClass="w-100"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Makamı</td>
                <td><asp:TextBox ID="Makami" runat="server" CssClass="w-100"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Bestekarı</td>
                <td><asp:TextBox ID="Bestekari" runat="server" CssClass="w-100"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Söz Yazarı</td>
                <td><asp:TextBox ID="SozYazari" runat="server" CssClass="w-100"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Formu</td>
                <td><asp:TextBox ID="Formu" runat="server" CssClass="w-100"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style1">Usulü</td>
                <td class="auto-style1"><asp:TextBox ID="Usulu" runat="server" CssClass="w-100"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" CssClass="w-100 alert-dark btn btn-success" /></td>
            </tr>
            <tr>
                <td>Puan</td>
                <td><asp:TextBox ID="Puan" runat="server" CssClass="w-100"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="Button1" runat="server" Text="Button" CssClass="btn alert-success w-100 btn-success" OnClick="Button1_Click" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </div>
    <div class="col-md-3"></div>
</asp:Content>


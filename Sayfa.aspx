<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Sayfa.aspx.cs" Inherits="Sayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-6 bg-light p-5">

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <div id="nota" class="carousel slide" data-ride="carousel" data-interval="false">
                    <div class="carousel-inner">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="carousel-item <%# Container.ItemIndex==0 ? "active" : "passive" %>">
                    <a href="../img/Notalar/<%# (Eval ("NotaID"))+"x"+(Eval ("SayfaNo")) %>.png">
                        <img src="../img/Notalar/<%# (Eval ("NotaID"))+"x"+(Eval ("SayfaNo")) %>.png" class="d-block w-100" />
                    </a>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
                <a href="#nota" class="carousel-control-prev" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon bg-dark"></span>
                    <span class="sr-only">Önceki</span>
                </a>
                <a href="#nota" class="carousel-control-next" role="button" data-slide="next">
                    <span class="carousel-control-next-icon bg-dark"></span>
                    <span class="sr-only">Sonraki</span>
                </a>
                </div>
            </FooterTemplate>
        </asp:Repeater>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Nota_veritabani %>" SelectCommand="SELECT NotaID, SayfaNo FROM Tbl_Sayfalar WHERE (NotaID = @nID) AND (SayfaNo = 1)">
            <SelectParameters>
                <asp:QueryStringParameter Name="nID" QueryStringField="nota" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="col-md-6">

        <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDataSource2" CssClass="table">
            <EditItemTemplate>
                TopSayfa:
                <asp:TextBox ID="TopSayfaTextBox" runat="server" Text='<%# Bind("TopSayfa") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelleştir" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" />
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" CssClass="h4 bolder align-self-center" Text="Sayfa Sayısı :"></asp:Label>
                &nbsp;<asp:Label ID="SonSayfaLabel" runat="server" Text='<%# Bind("TopSayfa") %>' CssClass="h3 text-warning" />
                &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Satın Al" CssClass="btn btn-success btn-outline-dark float-right py-2 px-4 h4" OnClick="Button1_Click1" />
                <br />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Nota_veritabani %>" SelectCommand="SELECT COUNT(*) AS TopSayfa FROM Tbl_Sayfalar WHERE (NotaID = @nID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="nID" QueryStringField="nota" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView2" runat="server" CssClass="table" DataKeyNames="NotaID" DataSourceID="SqlDataSource3">
            <EditItemTemplate>
                NotaID:
                <asp:Label ID="NotaIDLabel1" runat="server" Text='<%# Eval("NotaID") %>' />
                <br />
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
                Puan:
                <asp:TextBox ID="PuanTextBox" runat="server" Text='<%# Bind("Puan") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelleştir" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" />
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
                Puan:
                <asp:TextBox ID="PuanTextBox" runat="server" Text='<%# Bind("Puan") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Ekle" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="w-100 table table-bordered">
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" CssClass="table-item" Text="Puan : "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="PuanLabel" runat="server" CssClass="h3 text-warning" Text='<%# Bind("Puan") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label3" runat="server" CssClass="table-item" Text="Eser Adı :"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:Label ID="EserAdiLabel" runat="server" Text='<%# Bind("EserAdi") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" CssClass="table-item" Text="Makamı : "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="MakamiLabel" runat="server" Text='<%# Bind("Makami") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" CssClass="table-item" Text="Bestekarı :"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="BestekariLabel" runat="server" Text='<%# Bind("Bestekari") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" CssClass="table-item" Text="Söz Yazarı :"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="SozYazariLabel" runat="server" Text='<%# Bind("SozYazari") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" CssClass="table-item" Text="Formu :"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="FormuLabel" runat="server" Text='<%# Bind("Formu") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" CssClass="table-item" Text="Usulü :"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="UsuluLabel" runat="server" Text='<%# Bind("Usulu") %>' />
                        </td>
                    </tr>
                </table>
                <br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Nota_veritabani %>" SelectCommand="SELECT * FROM [Tbl_Notalar] WHERE ([NotaID] = @NotaID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="NotaID" QueryStringField="nota" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>


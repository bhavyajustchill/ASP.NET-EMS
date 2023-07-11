<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventSearch.aspx.cs" Inherits="AU_EMS.EventSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
       .gridView th, td{
           padding:7px;
           text-align:center;
       }
   </style>
    <table style="width:100%; margin-left:200px;">
        <tr>
            <td colspan="3" style="height: 20px; text-align:center;">
                <asp:Label ID="Label1" runat="server" Text="Search for Registration" Font-Bold="True" style="margin-right:400px;" Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 20px; text-align:right; padding-right:5px;">
                Entry Number : 
            </td>
            <td style="height: 20px; text-align:left; padding-left:5px;">
                <asp:TextBox ID="txtEntryNumber" Width="100%" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
            <td style="text-align:left; width:60%;">
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-warning" Width="100%" Text="Search" ForeColor="Black" OnClick="btnSearch_Click" /></td>
        </tr>
        <tr>
            <td colspan="3" style="text-align:center;">
                <asp:Label ID="lblOutput" style="margin-right:400px;" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <asp:GridView ID="gvSearchResults" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" CssClass="girdView" />
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" CssClass="gridView" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="gridView" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</asp:Content>

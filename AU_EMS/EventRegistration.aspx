<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventRegistration.aspx.cs" Inherits="AU_EMS.Shahnawaz_EventRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
       .gridView th, td{
           padding:7px;
           text-align:center;
       }
   </style>
    <table style="width:100%; height:500px;">
        
        <tr>
            <td colspan="4" style="height: 20px; text-align:center;">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Event Registration"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right; padding-right:5px;">
                Event Name : 
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlEventName" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlEventName_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right; padding-right:5px;">
                Event Category : 
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right; padding-right:5px;">
                Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Required!" Display="Dynamic" ControlToValidate="txtName" ForeColor="Red" Font-Bold="True">*</asp:RequiredFieldValidator> : 
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right; padding-right:5px;">
                Gender : 
            </td>
            <td colspan="2" style="text-align:left; padding-left:5px;">
                <asp:RadioButton ID="rbMale" Text="Male" GroupName="Gender" runat="server" Checked="True" />
                <asp:RadioButton ID="rbFemale" Text="Female" GroupName="Gender" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right; padding-right:5px;">
                E-Mail ID<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="E-Mail ID Required!" Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red" Font-Bold="True">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid  E-Mail Address!" Display="Dynamic" Font-Bold="True" Font-Underline="False" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$" ForeColor="Red">*</asp:RegularExpressionValidator> : 
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right; padding-right:5px;">
                Mobile Number<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mobile Number Required!" Display="Dynamic" ControlToValidate="txtMobile" ForeColor="Red" Font-Bold="True">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Mobile Number!" ControlToValidate="txtMobile" Display="Dynamic" Font-Bold="True" ValidationExpression="[6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" ForeColor="Red">*</asp:RegularExpressionValidator> : 
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtMobile" MaxLength="10" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">City / Village<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City / Village Required!" Display="Dynamic" ControlToValidate="txtCityVillage" ForeColor="Red" Font-Bold="True">*</asp:RequiredFieldValidator> : </td>
            <td>
                <asp:TextBox ID="txtCityVillage" CssClass="form-control" runat="server"></asp:TextBox></td>
            <td style="text-align:right; padding-right:5px;">Taluka<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Taluka Required!" Display="Dynamic" ControlToValidate="txtTaluka" ForeColor="Red" Font-Bold="True">*</asp:RequiredFieldValidator> : </td>
            <td>
                <asp:TextBox ID="txtTaluka" CssClass="form-control" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">District<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="District Required!" Display="Dynamic" ControlToValidate="txtDistrict" ForeColor="Red" Font-Bold="True">*</asp:RequiredFieldValidator> : </td>
            <td>
                <asp:TextBox ID="txtDistrict" CssClass="form-control" runat="server"></asp:TextBox></td>
            <td style="text-align:right; padding-right:5px;">State<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="State Required!" Display="Dynamic" ControlToValidate="txtState" ForeColor="Red" Font-Bold="True">*</asp:RequiredFieldValidator> : </td>
            <td>
                <asp:TextBox ID="txtState" CssClass="form-control" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Label ID="lblStatus" Visible="false" runat="server" Text="Status : "></asp:Label>
            </td>
            <td colspan="4" style="text-align:center;">
                <asp:DropDownList ID="ddlStatus" CssClass="form-control" Enabled="false" Visible="false" runat="server">
                    <asp:ListItem Value="1">1 - Approved</asp:ListItem>
                    <asp:ListItem Value="2">2 - Rejected</asp:ListItem>
                    <asp:ListItem Value="3">3 - Cancelled</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align:center;">
                <asp:Button ID="btnSave" CssClass="btn btn-primary btn-lg" Width="100%" runat="server" Text="Save Entry" OnClick="btnSave_Click" />
            </td>
            
        </tr>
        <tr>
            <td colspan="4">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="Red" ForeColor="White" />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align:center;">
                <asp:Label ID="lblOutput" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <asp:GridView ID="gvRegistration" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" RowStyle-CssClass="gridView" AlternatingRowStyle-CssClass="gridView" HeaderStyle-CssClass="gridView" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Entry Number">
                <ItemTemplate>
                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("Entry_No") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Unique ID">
                <ItemTemplate>
                    <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("UniqueID") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event Name">
                <ItemTemplate>
                    <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("Event_Name") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category Name">
                <ItemTemplate>
                    <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("Category_Name") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Literal ID="Literal5" runat="server" Text='<%# Eval("Name") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender">
                <ItemTemplate>
                    <asp:Literal ID="Literal6" runat="server" Text='<%# Eval("Gender") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-Mail ">
                <ItemTemplate>
                    <asp:Literal ID="Literal7" runat="server" Text='<%# Eval("EmailID") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile Number">
                <ItemTemplate>
                    <asp:Literal ID="Literal8" runat="server" Text='<%# Eval("MobileNo") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City">
                <ItemTemplate>
                    <asp:Literal ID="Literal9" runat="server" Text='<%# Eval("City") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State">
                <ItemTemplate>
                    <asp:Literal ID="Literal10" runat="server" Text='<%# Eval("State") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status ID">
                <ItemTemplate>
                    <asp:Literal ID="Literal11" runat="server" Text='<%# Eval("Status_ID") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update">
                <ItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Registration_ID") %>' CssClass="btn btn-success" OnClick="btnUpdate_Click" Text="Update" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Registration_ID") %>' CssClass="btn btn-danger" OnClick="btnDelete_Click" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</asp:Content>

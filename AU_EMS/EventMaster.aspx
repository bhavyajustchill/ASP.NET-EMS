<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventMaster.aspx.cs" Inherits="AU_EMS.Divyaraj_EventMaster" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <style>
       .gridView th, td{
           padding:7px;
           text-align:center;
       }
   </style>
    <table style="width: 100%; height:800px; padding:3px;">
         <tr>
            <td colspan="2" align="center" style="height: 42px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Event Master"></asp:Label>
             </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">Event Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Event Name Required!" ControlToValidate="txtEventName" Display="Dynamic" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator> : </td>
            <td style="height: 22px">
                <asp:TextBox ID="txtEventName" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">Start Date : </td>
            <td style="padding: 10px">
                <asp:Calendar ID="calStartDate" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">End Date : </td>
            <td style="padding-bottom: 10px; padding-left: 10px;">
                <asp:Calendar ID="calEndDate" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">Co-Ordinator Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Co-Ordinator Name Required!" Font-Bold="True" Text="*" ControlToValidate="txtEventNoPart" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator> : </td>
            <td>
                <asp:TextBox ID="txtCoordinatorName" CssClass="form-control" runat="server" ControlToValidate="txtCoordinatorName"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">Co-Ordinator Email ID<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Co-Ordinator Email ID Required!" ControlToValidate="txtCoordinatorEmail" Display="Dynamic" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Co-Ordinator Email Address!" Display="Dynamic" Font-Bold="True" Font-Underline="False" ControlToValidate="txtCoordinatorEmail" ValidationExpression="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$" ForeColor="Red">*</asp:RegularExpressionValidator> : </td>
            <td>
                <asp:TextBox ID="txtCoordinatorEmail" CssClass="form-control" runat="server" ControlToValidate="txtCoordinatorEmail"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">Co-Ordinator Mobile Number<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Co-Ordinator Mobile Number Required!" Text="*" ControlToValidate="txtCoordinatorMobile" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Co-Ordinator Mobile Number!" ControlToValidate="txtCoordinatorMobile" Display="Dynamic" Font-Bold="True" ValidationExpression="[6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" ForeColor="Red">*</asp:RegularExpressionValidator> : </td>
            <td>
                <asp:TextBox ID="txtCoordinatorMobile" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">Event Number Part<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Event Number Part Required!" ControlToValidate="txtEventNoPart" Display="Dynamic" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator> : </td>
            <td>
                <asp:TextBox ID="txtEventNoPart" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            
            <td colspan="2" style="text-align:center; padding-right:5px;">
                <asp:Button ID="btnSaveEntry" CssClass="btn btn-primary btn-lg" Width="100%" runat="server" Text="Save Entry" OnClick="btnSaveEntry_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="Red" ForeColor="White" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">       
                <asp:Label ID="lblOutput" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <asp:GridView ID="gvEventMaster" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False" AlternatingRowStyle-CssClass="gridView" RowStyle-CssClass="gridView">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" CssClass="gridViewRow" />
        <Columns>
            <asp:TemplateField HeaderText="Event ID">
                <ItemTemplate>
                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("Event_ID") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event Name">
                <ItemTemplate>
                    <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("Event_Name") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Start Date">
                <ItemTemplate>
                    <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("Start_Date") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Date">
                <ItemTemplate>
                    <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("End_Date") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Co-Ordinator Name">
                <ItemTemplate>
                    <asp:Literal ID="Literal5" runat="server" Text='<%# Eval("CoOrdinater_Name") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Co-Ordinator Email">
                <ItemTemplate>
                    <asp:Literal ID="Literal6" runat="server" Text='<%# Eval("CoOrdinater_EmailID") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Co-Ordinator Mobile">
                <ItemTemplate>
                    <asp:Literal ID="Literal7" runat="server" Text='<%# Eval("CoOrdinater_MobileNo") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event Number Part">
                <ItemTemplate>
                    <asp:Literal ID="Literal8" runat="server" Text='<%# Eval("EventNoPart") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update">
                <ItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Event_ID") %>' CssClass="btn btn-success" OnClick="btnUpdate_Click" Text="Update" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CommandArgument='<%# Eval("Event_ID") %>' CssClass="btn btn-danger" OnClick="btnDelete_Click" Text="Delete" CausesValidation="False" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" CssClass="gridView" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="gridViewRow" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</asp:Content>

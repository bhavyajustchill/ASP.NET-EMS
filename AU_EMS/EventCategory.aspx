<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventCategory.aspx.cs" Inherits="AU_EMS.Bhavya_EventCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
       .gridView th, td{
           padding:7px;
           text-align:center;
       }
   </style>
    <table style="width:100%; height:800px; padding:10px;">
        <tr>
            <td colspan="2" style="height: 20px; text-align:center">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Event Category Details"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">
                Event : 
            </td>
            <td style="padding-left:5px;">
                <asp:DropDownList ID="ddlEvent" CssClass="form-control" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">
                Category Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Category Name Required!" Display="Dynamic" ControlToValidate="txtCategoryName" ForeColor="Red" Font-Bold="True">*</asp:RequiredFieldValidator> : 
            </td>
            <td style="padding-left:5px;">
                <asp:TextBox ID="txtCategoryName" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">
                Short Name (Alias)<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Short Name (Alias) Required!" Font-Bold="true" Display="Dynamic" ControlToValidate="txtShortName" ForeColor="Red">*</asp:RequiredFieldValidator> : 
            </td>
            <td style="padding-left:5px;">
                <asp:TextBox ID="txtShortName" MaxLength="5" CssClass="form-control" runat="server"></asp:TextBox> 
            </td>
        </tr>
        <tr>
            <td style="text-align:right; padding-right:5px;">
                Preference : 
            </td>
            <td style="padding-left:5px;">
                <asp:DropDownList ID="ddlPrefernce" CssClass="form-control" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                    <asp:ListItem>32</asp:ListItem>
                    <asp:ListItem>33</asp:ListItem>
                    <asp:ListItem>34</asp:ListItem>
                    <asp:ListItem>35</asp:ListItem>
                    <asp:ListItem>36</asp:ListItem>
                    <asp:ListItem>37</asp:ListItem>
                    <asp:ListItem>38</asp:ListItem>
                    <asp:ListItem>39</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>41</asp:ListItem>
                    <asp:ListItem>42</asp:ListItem>
                    <asp:ListItem>43</asp:ListItem>
                    <asp:ListItem>44</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                    <asp:ListItem>46</asp:ListItem>
                    <asp:ListItem>47</asp:ListItem>
                    <asp:ListItem>48</asp:ListItem>
                    <asp:ListItem>49</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        
        <tr>
            <td style="text-align:right; padding-right:5px;">
                Start Date : 
            </td>
            <td style="padding-left:5px; padding-bottom:10px; padding-top:10px;">
               
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
            <td style="text-align:right; padding-right:5px;">
                Registration End Date : 
            </td>
            <td style="padding-left:5px; padding-bottom:10px;">
             
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
            <td style="text-align:right; padding-right:5px;">
                Allowed Participants<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Maximum Allowerd Participants Required!" Font-Bold="true" Display="Dynamic" ControlToValidate="txtParticipants" ForeColor="Red">*</asp:RequiredFieldValidator><asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Invalid Number of Participants!" Display="Dynamic" ControlToValidate="txtParticipants" MaximumValue="999" MinimumValue="1" Font-Bold="True" ForeColor="Red" Text="*"></asp:RangeValidator> : 
            </td>
            <td style="padding-left:5px;">
                <asp:TextBox ID="txtParticipants" MaxLength="3" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Button ID="btnSaveCategory" CssClass="btn btn-primary btn-lg" Width="100%" runat="server" Text="Save Entry" OnClick="btnSaveCategory_Click" />
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
    <asp:GridView ID="gvEventCategory" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" CssClass="gridView" />
        <Columns>
            <asp:TemplateField HeaderText="Category ID">
                <ItemTemplate>
                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("Category_ID") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event Name">
                <ItemTemplate>
                    <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("Event_Name") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category Name">
                <ItemTemplate>
                    <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("Category_Name") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Short Name">
                <ItemTemplate>
                    <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("Short_Name") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Preference">
                <ItemTemplate>
                    <asp:Literal ID="Literal5" runat="server" Text='<%# Eval("Preference") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Start Date">
                <ItemTemplate>
                    <asp:Literal ID="Literal6" runat="server" Text='<%# Eval("Reg_StartDate") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Date">
                <ItemTemplate>
                    <asp:Literal ID="Literal7" runat="server" Text='<%# Eval("Reg_EndDate") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Allowed Participants">
                <ItemTemplate>
                    <asp:Literal ID="Literal8" runat="server" Text='<%# Eval("TotalNoOf_Participents") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update">
                <ItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Category_ID") %>' CssClass="btn btn-success" OnClick="btnUpdate_Click" Text="Update" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Category_ID") %>' CssClass="btn btn-danger" OnClick="btnDelete_Click" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
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

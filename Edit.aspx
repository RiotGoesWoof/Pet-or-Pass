<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit an Animal -- Pet or Pass</title>
        <style type="text/css">
        body {
            background-image: url("/catfix.jpg");            
            background-size: 100%;
        }
        #Header{
            margin-left: -.5%;
            margin-right: -.5%;
            margin-top: -.5%;
            width: 100%;            
            text-align: center;
            position: fixed;
            background-image: url("/grass.jpg");
        }        
        .auto-style21 {            
            background-color: #66FF66;
        }
        .auto-style2 {
            width: 20%;
            height: 376px;
            background-color: #F9B510;
        }
        .auto-style9 {
            height: 26px;
            text-align: center;
            background-color: #F9B510;
        }
        .auto-style22 {
            width: 375px;
            margin-top: 15px;
        }
        .auto-style3 {
            height: 26px;
            text-align: center;
            width: 144px;
            background-color: #F9B510;
        }
        .auto-style4 {
            text-align: center;
            height: 26px;
            background-color: #F9B510;
            width: 234px;
        }
        .auto-style15 {
            text-align: center;
            width: 144px;
            background-color: #F9B510;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Header">
                <asp:LinkButton ID="HomeButton" runat="server" PostBackUrl="~/Home.aspx" CssClass="auto-style21" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Home</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="Petlink" runat="server" CssClass="auto-style21" PostBackUrl="~/Pet.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Pet or Pass!</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="AddAn" runat="server" CssClass="auto-style21" PostBackUrl="~/Add.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Add Animal</asp:LinkButton>
             &nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="EditAn" runat="server" CssClass="auto-style21" PostBackUrl="~/Edit.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Edit Animal</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="UProf" runat="server" CssClass="auto-style21" PostBackUrl="~/UserPage.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Profile</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="Logout" runat="server" CssClass="auto-style21" OnClick="logmeout" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Log Out</asp:LinkButton>
        </div>
        <br />
        <br />
        <br />
    <table class="auto-style2" align="center">
        <tr>
            <td class="auto-style9" colspan="2">
    <p class="auto-style22">
        Want to add animals to the collection? Please do! Just fill out this form!</p>
                <p class="auto-style22">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </p>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Select Animal:</td>
            <td class="auto-style4">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Pet" DataTextField="Name" DataValueField="AnimalID" OnSelectedIndexChanged="DropDownChange" AutoPostBack="True" AppendDataBoundItems="true">
                <asp:ListItem>-- Choose Animal --</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="Pet" runat="server" ConnectionString="<%$ ConnectionStrings:Pet %>" SelectCommand="SELECT [AnimalID], [Name] FROM [Animal] ORDER BY [Name]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">*Name:</td>
            <td class="auto-style4">
                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">*Description:</td>
            <td class="auto-style4">
                <asp:TextBox ID="Description" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">*Image Link:</td>
            <td class="auto-style4">
                <asp:TextBox ID="Image" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style9" colspan="2">Psst! The pros use
                <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl="https://goo.gl/">Google&#39;s Link Shortener</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td id="mail" class="auto-style15">*Soft Points</td>
            <td id="email0" class="auto-style4">
                <asp:TextBox ID="SoftP" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">*Hard Points:</td>
            <td class="auto-style4">
                <asp:TextBox ID="HardP" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style9" colspan="2">
                <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Edit Animal" />
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Delete" runat="server" OnClick="Delete_Click" Text="Or delete it..." />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

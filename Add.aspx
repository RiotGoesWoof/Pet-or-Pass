<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add an animal here! -- Pet or Pass</title>
    <style type="text/css">
        body {
            background-image: url("/santa.jpg");            
            background-size: 100%;
        }
        #Header{
            margin-left: -.5%;
            margin-right: -.5%;
            margin-top: -.5%;
            width: 100%;
            position: fixed;
            background-image: url("/grass.jpg");
        }
        .auto-style20 {
            text-align: center;
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
        <div class="auto-style20">
        <div id="Header" class="auto-style20">
            <asp:LinkButton ID="HomeButton" runat="server" PostBackUrl="~/Home.aspx" CssClass="auto-style21" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Home</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="Petlink" runat="server" CssClass="auto-style21" PostBackUrl="~/Pet.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Pet or Pass!</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="Loginlink0" runat="server" CssClass="auto-style21" PostBackUrl="~/Add.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Add Animal</asp:LinkButton>
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
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://goo.gl/">Google&#39;s Link Shortener</asp:HyperLink>
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
                <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Add Animal" />
            </td>
        </tr>
    </table>
        </div>
    </form>
</body>
</html>

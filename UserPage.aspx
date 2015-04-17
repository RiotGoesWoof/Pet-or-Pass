<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserPage.aspx.cs" Inherits="UserPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background-image: url("/wolf.jpg");            
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
        #parabody{
            text-align: center;
            background-color: #F9B510;
            color: #000099;
            font-size: x-large;
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
            text-align: left;
            height: 26px;
            background-color: #F9B510;
        }
        .auto-style14 {
            height: 26px;
            background-color: #F9B510;
        }
        .auto-style15 {
            text-align: center;
            width: 144px;
            background-color: #F9B510;
        }
        .auto-style23 {
            background-color: #F9B510;
        }
        .auto-style24 {
            text-align: center;
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
            <asp:LinkButton ID="Loginlink0" runat="server" CssClass="auto-style21" PostBackUrl="~/Add.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Add Animal</asp:LinkButton>
         &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="EditAn" runat="server" CssClass="auto-style21" PostBackUrl="~/Edit.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Edit Animal</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="UProf" runat="server" CssClass="auto-style21" PostBackUrl="~/Edit.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Profile</asp:LinkButton>
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
        Your overall Pet or Pass score is...</p>
                <p class="auto-style22">
                    <asp:Label ID="UserScore" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                </p>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">*First Name:</td>
            <td class="auto-style4">
                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">*User Name:</td>
            <td class="auto-style14">
                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">*Password:</td>
            <td class="auto-style14">
                <asp:TextBox ID="Password" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td id="mail" class="auto-style15">*Email Address:</td>
            <td id="email0" class="auto-style14">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">*Age:</td>
            <td class="auto-style14">
                <asp:TextBox ID="Age" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Location:</td>
            <td class="auto-style14">
                <asp:TextBox ID="Location" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Bio:</td>
            <td class="auto-style14">
                <asp:TextBox ID="Bio" runat="server" Height="131px" Width="257px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Favorite Animal:</td>
            <td class="auto-style14">
                <asp:TextBox ID="FavAnimal" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style9" colspan="2">
                <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Update your info" />
        <asp:GridView ID="Choices" align="center" runat="server" CssClass="auto-style23">
        </asp:GridView>
            </td>
        </tr>
    </table>
        <div class="auto-style24">
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login or Create -- Pet or Pass</title>
    <style type="text/css">
        body {
            background-image: url("/porpy.jpg");            
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
        .auto-style2 {
            width: 20%;
            height: 376px;
            background-color: #F9B510;
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
        .auto-style9 {
            height: 26px;
            text-align: center;
            background-color: #F9B510;
        }
        .auto-style11 {
            width: 14%;
            height: 78px;
            background-color: #F9B510;
        }
        .auto-style12 {
            width: 3132px;
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
        .auto-style16 {
            width: 36px;
        }
        .auto-style17 {
            height: 26px;
            width: 36px;
        }
        .auto-style18 {            
            color: red;
            text-align: center;
        }
        .auto-style19 {
            text-align: right;
        }
        .auto-style21 {
            width: 3132px;
            height: 26px;
        }
        .auto-style22 {
            width: 375px;
            margin-top: 15px;
        }
        .auto-style23 {
            background-color: #66FF66;
        }
        </style>
    </head>
<body>
    <form id="form1" runat="server" autocomplete="on">
        <div id="Header">
            <asp:LinkButton ID="HomeButton" runat="server" PostBackUrl="~/Home.aspx" CssClass="auto-style23" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099">Home</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="Petlink" runat="server" CssClass="auto-style23" PostBackUrl="~/Pet.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099">Pet or Pass!</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="EditAn" runat="server" CssClass="auto-style23" PostBackUrl="~/Edit.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099">Edit Animal</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="Loginlink0" runat="server" CssClass="auto-style23" PostBackUrl="~/Add.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099">Add Animal</asp:LinkButton>
        </div>
        <br />
        <br />
        <br />
    <table class="auto-style11" align="center">
        <tr>
            <td class="auto-style18" colspan="2">
                <asp:Label ID="InvalidLabel" runat="server" Visible="false" Text="Invalid Credentials"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style12">*User Name:</td>
            <td class="auto-style16">
                <asp:TextBox ID="Uname" runat="server" Width="133px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style21">*Password:</td>
            <td class="auto-style17">
                <asp:TextBox ID="Upass" runat="server" Width="133px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style19">
                <asp:Button ID="Log" runat="server" OnClick="loginclick" Text="Log In" />
            </td>
        </tr>
    </table>
        <br />
        <br />
    <table class="auto-style2" align="center">
        <tr>
            <td class="auto-style9" colspan="2">
    <p class="auto-style22">
        Or if you don&#39;t already have an account
                    you can create one right here!</p>
                <p class="auto-style22">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
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
            <td id="email" class="auto-style14">
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
                <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Create Account" />
            </td>
        </tr>
    </table>
    </form>
    <p class="auto-style18">
        &nbsp;</p>
</body>
</html>

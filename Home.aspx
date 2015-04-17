<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pet or Pass! -- Rate animals and get your personality profile!</title>
    <style type="text/css">
        body {
            background-image: url("/cute.jpg");            
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
            <asp:LinkButton ID="UProf" runat="server" CssClass="auto-style21" PostBackUrl="~/UserPage.aspx" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Profile</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="Logout" runat="server" CssClass="auto-style21" OnClick="logmeout" Font-Bold="True" Font-Size="100%" Font-Underline="False" ForeColor="#000099" Height="100%">Log Out</asp:LinkButton>
    </div>
        <br />
        <br />
        <br />
    </form>
    <div id="parabody">
        <p>Welcome to pet or pass! This is a new social networking experiement that will give you a score based on how you rate different animals.<br /><br />
           All you have to do is sign up and you&#39;re good to go!<br /><br />
           Once you&#39;re in, just click the &quot;Pet or Pass&quot; link, and choose whether you would give the animal described a pat on the head or a cold stare as you saunter by with your inhuman heart.
        </p>
    </div>
</body>
</html>

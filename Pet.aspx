<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pet.aspx.cs" Inherits="Pet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Choose Wisely! -- Pet or Pass</title>
    <style type="text/css">
        body {
            background-image: url("/question.jpeg");            
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
        .auto-style22 {
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
            <asp:Label ID="AnimalName" runat="server" Font-Names="Arial Black" Font-Size="XX-Large" CssClass="auto-style22" Font-Bold="False"></asp:Label>
        <br />
            <asp:Image ID="Image1" runat="server" />
            <br />
            <asp:Label ID="DescripLabel" runat="server" CssClass="auto-style22" Font-Size="Large"></asp:Label>
            <br />
            <asp:Button ID="PetAn" runat="server" OnClick="PetListener" Text="Pet!" CausesValidation="False" UseSubmitBehavior="False" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="PasAn" runat="server" OnClick="PassListener" Text="Pass..." CausesValidation="False" UseSubmitBehavior="False" />
        </div>
    </form>
</body>
</html>

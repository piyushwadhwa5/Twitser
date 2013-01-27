<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Twitser</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    </head>
<body>
    <form id="form1" runat="server">
    <asp:Image ID="Image1" runat="server" Height="126px" 
        ImageUrl="~/Content/images/twitser.gif" Width="325px" />
    <div class="connect" style="vertical-align: middle; text-align: center">
    Connect With Your Twitter Acoount and authorize the application<br />
        <asp:ImageButton ID="ImageButton1" runat="server" Height="58px" 
            ImageUrl="~/Content/images/twitter-connect-button.png" 
            onclick="ImageButton1_Click" Width="196px" />
    </div>
    <div class="welcome" style="vertical-align: middle">
    <h2>&nbsp;</h2>
        <h2>&nbsp;</h2>
        <h2>Please give your suggestions at piyushwadhwa2@gmail.com</h2>
    </div>
    </form>
</body>
</html>

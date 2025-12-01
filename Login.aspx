<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="A5_WebApp_Andrew_2.Login" %>
<%@ Register Src="~/LoginPanel.ascx" TagPrefix="uc" TagName="LoginPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc:LoginPanel ID="LoginPanel1" runat="server" />
    </form>
</body>
</html>

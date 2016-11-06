<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search_pw.aspx.cs" Inherits="html_search_pw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>忘记密码</title>
    <link href="../css/search pw.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
        <h1>忘记密码</h1>
        <div id="user">
            请输入用户名
            <asp:TextBox ID="Usetxt" runat="server" placeholder="用户名"></asp:TextBox>
        </div>
        <div id="Email">
            请输入注册邮箱
            <asp:TextBox ID="Mailtxt" runat="server" placeholder="邮箱"></asp:TextBox>
            <%--<asp:Button ID="btnMail" runat="server" Text="发送" CssClass="send" />--%>
        </div>
        <%--<div id="npw">
            请输入新密码
            <input type="password" placeholder="新密码">
        </div>--%>
        <div id="logbtn">
            <asp:Button ID="btnMail" runat="server" Text="发送" CssClass="loginbtn" />
        </div>
    </form>
</body>
</html>

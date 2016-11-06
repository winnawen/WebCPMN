<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InfoDetails.aspx.cs" Inherits="admin_InfoDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 20px auto; padding-left: 15px; padding-right: 15px">
            <h2 style="text-align:center"><%=getTitle() %></h2>
            <hr />
            <div style="text-align:center"><%=Content %></div>
        </div>
    </form>
</body>
</html>

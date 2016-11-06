<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sign.aspx.cs" Inherits="html_sign" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册</title>
    <link href="../css/sign.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
        <h1 style="margin-left:-250px">注册</h1>
        <div class="centerdiv">
            <ol>
               <li> <label for="usrName">用户名：</label><asp:TextBox ID="usrName" runat="server" placeholder="用户名" require></asp:TextBox></li>
               <li> <label for="trueName">姓  名：</label><asp:TextBox ID="trueName" runat="server" placeholder="姓名" require></asp:TextBox></li>
               <li> <label for="idcard">身份证：</label><asp:TextBox ID="idcard" runat="server" placeholder="身份证" require></asp:TextBox></li>
                <li><label for="sex">性  别：</label><asp:DropDownList style="width:280px;height:40px"  ID="sex" runat="server" require><asp:ListItem Text="男" Value="男"/><asp:ListItem Text="女" Value="女"/></asp:DropDownList></li>
                <li> <label for="tbaddress">住  址：</label><asp:TextBox ID="tbaddress" runat="server" placeholder="XX栋XX楼XX号" require></asp:TextBox></asp:TextBox></li>
               <li> <label for="txtMail">邮  箱：</label><asp:TextBox ID="txtMail" runat="server" placeholder="邮箱" require></asp:TextBox></asp:TextBox></li>
               <li> <label for="pwd">密  码：</label><asp:TextBox ID="pwd" runat="server" TextMode="Password" placeholder="密码" require></asp:TextBox></li>
               <li> <label for="pwd2">确  认：</label><asp:TextBox ID="pwd2" runat="server" TextMode="Password" placeholder="确认密码" require></asp:TextBox></li>
               <li> <label for="phone">电  话：</label><asp:TextBox ID="phone" runat="server" placeholder="电话" require></asp:TextBox></li>
               <li>
                   <div id="signbtn">
                   <asp:Button ID="btnSumit" runat="server" Text="注册" CssClass="signbtn" OnClick="btnSumit_Click"/>
                    </div>
               </li>
           </ol>
        </div>
    </form>
</body>
</html>

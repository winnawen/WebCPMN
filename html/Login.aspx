<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="html_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link href="../css/login.css" rel="stylesheet" type="text/css">
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="user">
            <asp:TextBox ID="txtZH" runat="server" placeholder="账号"></asp:TextBox>
        </div>
        <div id="password">
            <asp:TextBox ID="pwd" runat="server" TextMode="Password" placeholder="密码"></asp:TextBox>
        </div>
         <div id="captcha" style="margin-left:30px"></div>
        <div id="logbtn">
            <asp:Button ID="btnDL" runat="server" CssClass="loginbtn" Text="登陆" OnClick="btnDL_Click"/>
        </div>
        <div id="bottom">
            <a href="search_pw.aspx">忘记密码？</a><a href="sign.aspx">注册</a>
        </div>
       
        <script src="http://static.geetest.com/static/tools/gt.js"></script>
        <script>
            var handler = function (captchaObj) {
                // 将验证码加到id为captcha的元素里
                captchaObj.appendTo("#captcha");
            };
            $.ajax({
                // 获取id，challenge，success（是否启用failback）
                url: "../GeeTest/getcaptcha.aspx",
                type: "get",
                dataType: "json", // 使用jsonp格式
                success: function (data) {
                    // 使用initGeetest接口
                    // 参数1：配置参数，与创建Geetest实例时接受的参数一致
                    // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
                    initGeetest({
                        gt: data.gt,
                        challenge: data.challenge,
                        product: "embed", // 产品形式
                        offline: !data.success
                    }, handler);
                }
            });
        </script>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ownerEdit.aspx.cs" Inherits="admin_ownerEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" AutoSizePanelID="From2" />
        <f:Form ID="From2" runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="false" LabelWidth="80px" LabelAlign="Right">
            <Rows>
                <f:FormRow ID="FRType" runat="server">
                    <Items>
                        <f:TextBox ID="txOwner" runat="server" Label="业主名" Required="true"></f:TextBox>
                        <f:RadioButtonList ID="ownSex" runat="server" Label="性别">
                            <f:RadioItem Text="男" Value="男" Selected="true" />
                            <f:RadioItem Text="女" Value="女" />
                        </f:RadioButtonList>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FromRow1" runat="server">
                    <Items>
                        <f:TextBox ID="txphone" runat="server" Label="手机" Required="true"></f:TextBox>
                        <f:TextBox ID="idcard" runat="server" Label="身份证" Required="true"></f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow1" runat="server">
                    <Items>
                        <f:TextBox ID="txMail" runat="server" Label="邮箱" Required="true"></f:TextBox>
                        <f:TextBox ID="txaddress" runat="server" Label="住址" Required="true"></f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow runat="server">
                    <Items>
                        <f:TextBox ID="txzh" runat="server" Label="账号" Required="true"></f:TextBox>
                    </Items>
                </f:FormRow>
            </Rows>
            <Toolbars>
                <f:Toolbar runat="server" ID="Toolbar" Position="Bottom">
                    <Items>
                        <f:ToolbarFill runat="server" ID="ToolbarFill"></f:ToolbarFill>
                        <f:Button ID="btnSave" runat="server" Text="提交" Icon="SystemSave" OnClick="btnSave_Click" ValidateForms="Form2" Enabled="true">
                        </f:Button>
                        <f:Button runat="server" ID="btnClose" Text="关闭" Icon="SystemClose"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Form>
    </form>
</body>
</html>

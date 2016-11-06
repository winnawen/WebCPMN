<%@ Page Language="C#" AutoEventWireup="true" CodeFile="staffEdit.aspx.cs" Inherits="admin_staffEdit" %>

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
                        <f:TextBox ID="txName" runat="server" Label="姓名" Required="true"></f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FromRow1" runat="server">
                    <Items>
                        <f:TextBox ID="txAge" runat="server" Label="年龄" Required="true"></f:TextBox>
                        <f:DropDownList ID="dlSex" runat="server">
                            <f:ListItem Text="男" Value="男" />
                            <f:ListItem Text="女" Value="女" />
                        </f:DropDownList>
                    </Items>
                </f:FormRow>

                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txPhone" runat="server" Label="手机" Required="true"></f:TextBox>
                    </Items>
                    <Items>
                        <f:TextBox ID="txId" runat="server" Label="员工id" Required="true"></f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txSalary" runat="server" Label="工资" Required="true"></f:TextBox>
                    </Items>
                    <Items>
                        <f:TextBox runat="server" ID="txIdCard" Label="身份证" Required="true"></f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                      <f:CheckBoxList ID="txDutty" runat="server" Label="值班信息" Required="true">
                          <f:CheckItem Text="星期一" Value="星期一"/>
                          <f:CheckItem Text="星期二" Value="星期二"/>
                          <f:CheckItem Text="星期三" Value="星期三"/>
                          <f:CheckItem Text="星期四" Value="星期四"/>
                          <f:CheckItem Text="星期五" Value="星期五"/>
                          <f:CheckItem Text="星期六" Value="星期六"/>
                          <f:CheckItem Text="星期日" Value="星期日"/>
                      </f:CheckBoxList>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="oweEdit.aspx.cs" Inherits="admin_oweEdit" %>

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
                        <f:Button ID="btnCheck" runat="server" Text="检查" OnClick="btnCheck_Click"></f:Button>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DatePicker ID="stime" Width="150px" CssClass="marginr" Required="true" Readonly="false"
                            DateFormatString="yyyy-MM-dd" EmptyText="计费开始日期"
                            ShowLabel="false" Label="时间" runat="server" EnableEdit="false">
                        </f:DatePicker>
                        <f:DatePicker ID="etime" Width="150px" CssClass="marginr" Required="true" Readonly="false"
                            DateFormatString="yyyy-MM-dd" EmptyText="计费结束日期"
                            ShowLabel="false" Label="时间" runat="server" EnableEdit="false">
                        </f:DatePicker>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FromRow1" runat="server">
                    <Items>
                        <f:TextBox ID="txlPrice" runat="server" Label="电费" Required="true"></f:TextBox>
                        <f:TextBox ID="txwPrice" runat="server" Label="水费" Required="true"></f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:CheckBox ID="cbisowe" runat="server" Label="是否缴清（缴清请打勾）"></f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow1" runat="server">
                    <Items>
                        <f:TextBox ID="txphone" runat="server" Label="手机" Required="true"></f:TextBox>
                        <f:TextBox ID="txaddress" runat="server" Label="住址" Required="true"></f:TextBox>
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

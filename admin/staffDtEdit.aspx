<%@ Page Language="C#" AutoEventWireup="true" CodeFile="staffDtEdit.aspx.cs" Inherits="admin_staffDtEdit" %>

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
                        <f:TextBox ID="txPhone" runat="server" Label="手机" Required="true" ></f:TextBox>
                    </Items>
                    <Items>
                        <f:TextBox ID="txId" runat="server" Label="员工id" Required="true"></f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <%--<f:TextBox ID="txdzro" runat="server" Label="值班区域" Required="true"></f:TextBox>--%>
                        <f:DropDownList ID="txdzro" runat="server" Label="值班区域">
                            <f:ListItem Text="一区" Value="一区"  Selected="true"/>
                            <f:ListItem Text="二区" Value="二区"  />
                            <f:ListItem Text="三区" Value="三区"  />
                            <f:ListItem Text="四区" Value="四区"  />
                            <f:ListItem Text="五区" Value="五区"  />
                        </f:DropDownList>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DatePicker runat="server" CssClass="marginr" Width="150px" Required="true" DateFormatString="yyyy-MM-dd" EmptyText="值班开始日期"
                            ShowLabel="false" Label="值班开始时间"
                            ID="dpStartDate" EnableEdit="false">
                        </f:DatePicker>
                        <f:DatePicker ID="dpEndDate" CssClass="marginr" Width="150px" Required="true" Readonly="false"
                            CompareControl="dpStartDate" DateFormatString="yyyy-MM-dd" CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" EmptyText="值班结束日期"
                            ShowLabel="false" Label="值班结束时间"
                            runat="server" EnableEdit="false">
                        </f:DatePicker>
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

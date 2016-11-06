<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsEdit.aspx.cs" Inherits="admin_NewsEdit" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PM" runat="server" AutoSizePanelID="Panel1"></f:PageManager>
        <f:Panel ID="Panel1" runat="server" BodyPadding="5px" ShowBorder="false" AutoScroll="true">
            <Items>
                <f:Form ID="Form2" runat="server" LabelWidth="100px" BodyPadding="5px" ShowHeader="false" ShowBorder="false" LabelAlign="Right" Width="950px">
                    <Rows>
                        <f:FormRow ID="FR1" runat="server">
                            <Items>
                                <f:TextArea ID="title" runat="server" Height="40px" Label="标题" Width="800px" Required="true"></f:TextArea>
                            </Items>
                        </f:FormRow>
                        <f:FormRow ID="FR2" runat="server">
                            <Items>
                                <f:TextBox ID="Author" runat="server" Label="作者" Height="30px" Required="true"></f:TextBox>
                                <f:DropDownList ID="dltype" runat="server" Label="类别">
                                    <f:ListItem Value="公共设施" Text="公共设施" />
                                    <f:ListItem Value="绿化" Text="绿化" />
                                    <f:ListItem Value="噪音" Text="噪音" />
                                </f:DropDownList>
                                <f:DatePicker ID="dpAddDate" runat="server" Label="发布时间" Required="true" EnableEdit="false"></f:DatePicker>
                            </Items>
                        </f:FormRow>
                        <f:FormRow ID="FR3" runat="server" ColumnWidths="80px 850px">
                            <Items>
                                <f:Label ID="lbContent" runat="server" Label="内容">
                                </f:Label>
                                <f:ContentPanel ID="ContentPanel1" runat="server" Height="400px" ShowBorder="false" ShowHeader="false" AutoScroll="true">
                                    <textarea name="UEditor1" id="UEditor1"></textarea>
                                </f:ContentPanel>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Position="bottom" runat="server">
                    <Items>
                        <f:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Sq_ManagerNews.aspx" Target="_self" Text="返回通告列表"></f:HyperLink>
                        <f:ToolbarFill ID="ToolbarFill" runat="server"></f:ToolbarFill>
                        <f:Button ID="btnSave" runat="server" Text="发布" Icon="SystemSave" ValidateForms="Form2" Size="Medium" OnClick="btnSave_Click"></f:Button>
                        <f:Button ID="btnClear" Icon="ArrowRefresh" Text="清 空" EnablePostBack="false" runat="server" Size="Medium"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">
        var editor = UE.getEditor('UEditor1', {
            initialFrameWidth: 800,
            initialFrameHeight: 350,
            minFrameHeight: 350,
            autoFloatEnabled: false,
            focus: true,
            autoHeightEnabled: false
        });
        // 提交数据之前同步到表单隐藏字段
        X.util.beforeAjaxPostBackScript = function () {
            editor.sync();
        };

        // 更新编辑器内容
        function updateUEditor(content) {
            window.setTimeout(function () {
                editor.setContent(content);
            }, 100);
        }
    </script>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ownerComplain.aspx.cs" Inherits="admin_ownerComplain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" AutoSizePanelID="Panel1"></f:PageManager>
        <f:Panel ID="Panel1" runat="server" ShowBorder="true" BodyPadding="5px" Layout="Fit" ShowHeader="false">
            <Toolbars>
                <f:Toolbar ID="topToolbar" runat="server" Position="Top">
                    <Items>
                        <f:Button ID="btnAdd" runat="server" Text="新增业主投诉信息" Icon="Add" EnablePostBack="false">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Grid ID="GCGrid" runat="server" OnRowCommand="GCGrid_RowCommand" OnPageIndexChange="GCGrid_PageIndexChange" EnableTextSelection="true" ForceFit="true" PageSize="15" DataKeyNames="cp_id"  AllowPaging="true" EnableColumnLines="true" ShowHeader="false" ShowBorder="false">
                    <Columns>
                        <f:RowNumberField TextAlign="Center" HeaderText="序号" Width="120px"></f:RowNumberField>
                        <f:BoundField DataField="cp_own" HeaderText="投诉人" TextAlign="Center" Width="256px"></f:BoundField>
                        <f:BoundField DataField="cp_time" HeaderText="时间" TextAlign="Center" Width="256px"></f:BoundField>
                        <f:BoundField DataField="cp_type" HeaderText="类别（安全、服务）" TextAlign="Center" Width="256px"></f:BoundField>
                        <f:BoundField DataField="cp_content" HeaderText="内容" TextAlign="Center" Width="530px"></f:BoundField>
                        <f:LinkButtonField Icon="Cancel" HeaderText="删除" Width="100px" TextAlign="Center" ColumnID="Delete" CommandName="Delete" ToolTip="删除" ConfirmText="确定要删除投诉信息吗？？" />
                    </Columns>
                    <PageItems>
                        <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server"></f:ToolbarSeparator>
                        <f:ToolbarText ID="ToolbaText1" runat="server" Text="每页记录数："></f:ToolbarText>
                        <f:DropDownList runat="server" ID="ddlPageSize" Width="80px" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                            <f:ListItem Text="每页15条" Value="15" Selected="true" />
                            <f:ListItem Text="每页20条" Value="20" />
                            <f:ListItem Text="每页30条" Value="30" />
                        </f:DropDownList>
                    </PageItems>
                </f:Grid>
            </Items>
        </f:Panel>
        <f:Window ID="Window1" Icon="UserAdd" runat="server" Hidden="true" IsModal="true" EnableMaximize="true" CloseAction="HidePostBack" OnClose="Window1_Close"
            EnableResize="true" Target="Self" EnableIFrame="true" IFrameUrl="about:blank" Width="600px" Height="400px">
        </f:Window>
    </form>
</body>
</html>

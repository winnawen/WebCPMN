<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminManager.aspx.cs" Inherits="admin_AdminManager" %>

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

            <Items>
                <f:Grid ID="GCGrid" runat="server" EnableTextSelection="true" ForceFit="true" OnRowCommand="GCGrid_RowCommand" OnPageIndexChange="GCGrid_PageIndexChange" PageSize="15" DataKeyNames="u_id" AllowPaging="true" EnableColumnLines="true" ShowHeader="false" ShowBorder="true">
                    <Columns>
                        <f:RowNumberField TextAlign="Center" HeaderText="序号" Width="61px"></f:RowNumberField>
                        <f:BoundField DataField="u_name" HeaderText="账户" TextAlign="Center"></f:BoundField>
                        <f:BoundField DataField="u_truename" HeaderText="姓名" TextAlign="Center"></f:BoundField>
                        <f:BoundField DataField="u_mail" HeaderText="邮箱" TextAlign="Center"></f:BoundField>
                        <f:BoundField DataField="u_phone" HeaderText="手机" TextAlign="Center"></f:BoundField>
                        <f:BoundField DataField="u_address" HeaderText="住址" TextAlign="Center"></f:BoundField>
                        <f:BoundField DataField="type" HeaderText="类别" TextAlign="Center"></f:BoundField>
                        <f:BoundField DataField="thisTime" HeaderText="最近登陆时间" TextAlign="Center" ></f:BoundField>
                        <f:BoundField DataField="thisIp" HeaderText="最近登陆IP" TextAlign="Center" ></f:BoundField>
                        <f:LinkButtonField Icon="Add" HeaderText="设置管理员" Width="100px" TextAlign="Center" ColumnID="Up" CommandName="Up" ToolTip="提升" ConfirmText="确定要设置为管理员？？" />
                        <f:LinkButtonField Icon="Cancel" HeaderText="删除" Width="100px" TextAlign="Center" ColumnID="Delete" CommandName="Delete" ToolTip="删除" ConfirmText="确定要删除业主信息吗？？" />
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

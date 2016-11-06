<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsInfo.aspx.cs" Inherits="admin_NewsInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" AutoSizePanelID="Panal1"></f:PageManager>
        <f:Panel ID="Panal1" runat="server" ShowHeader="false" ShowBorder="false" Layout="Fit">
            <Items>
                <f:Grid ID="Grid1" runat="server" ShowBorder="true" ShowHeader="false"   EnableRowLines="true" DataKeyNames="n_id" OnPageIndexChange="Grid1_PageIndexChange" OnRowCommand="Grid1_RowCommand" IsDatabaseSorting="true" AllowPaging="true" EmptyText="暂无信息" EnableTextSelection="true" EnableColumnLines="true" ForceFit="true" EnableCheckBoxSelect="true">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar" runat="server" Position="Top">
                            <Items>
                                <f:Button ID="btnDelete" runat="server" Text="删除所选" Icon="Delete" ConfirmText="确定要删除？" OnClick="btnDelete_Click"></f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Columns>
                        <f:RowNumberField TextAlign="center" HeaderText="序号" Width="40px"></f:RowNumberField>
                        <f:HyperLinkField HeaderText="标题" DataTextField="n_title" Target="_blank" DataNavigateUrlFormatString="infoDetails.aspx?id={0}" DataNavigateUrlFields="n_ID"></f:HyperLinkField>
                        <f:BoundField HeaderText="类别" DataField="n_type" TextAlign="Center" Width="50px" />
                        <f:BoundField HeaderText="发布时间" DataField="n_time" TextAlign="Center" Width="60px"/>
                        <f:LinkButtonField HeaderText="删除" ColumnID="Delete" CommandName="Delete" Width="30px" Icon="delete" TextAlign="center">  </f:LinkButtonField>
                    </Columns>
                    <PageItems>
                        <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                        </f:ToolbarSeparator>
                        <f:ToolbarText ID="ToolbarText1" runat="server" Text="每页记录数：">
                        </f:ToolbarText>
                        <f:DropDownList runat="server" ID="ddlPageSize" Width="80px" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                            <f:ListItem Text="每页15条" Value="15" Selected="true" />
                            <f:ListItem Text="每页20条" Value="20" />
                            <f:ListItem Text="每页30条" Value="30" />
                            <f:ListItem Text="每页50条" Value="50" />
                        </f:DropDownList>
                    </PageItems>
                </f:Grid>
            </Items>
        </f:Panel>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="../res/css/head.css" />
    <title>社区物业管理网</title>
    <style>
        .mypanel {
            display: inline-block !important;
            margin-right: 5px;
            float:left
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server"></f:PageManager>
        <f:Panel ID="Panel1" Layout="Region" ShowBorder="false" ShowHeader="false" runat="server">
            <Items>
                <f:ContentPanel ID="topPanel" CssClass="topregion" RegionPosition="Top" ShowBorder="false" ShowHeader="false" EnableCollapse="true" runat="server">
                    <div id="header" class="ui-widget-header f-mainheader">
                        <table>
                            <tr>
                                <td>
                                    <span class="title">社区物业管理网</span>
                                </td>
                                <td style="text-align: right;">
                                    <f:Button runat="server" ID="btnExit" Text="安全退出" IconAlign="Top" IconFont="PowerOff" OnClick="btnExit_Click" EnableDefaultState="false" EnableDefaultCorner="false">
                                    </f:Button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </f:ContentPanel>
                <f:Panel ID="leftPanel" CssClass="leftregion" RegionPosition="Left" RegionSplit="true" ShowBorder="true" Width="200px" ShowHeader="true" Title="功能菜单" Icon="Outline" RegionSplitWidth="3px"
                    EnableCollapse="true" Collapsed="false" Layout="Fit" runat="server">
                    <Items>
                        <f:Tree runat="server" ShowBorder="false" ShowHeader="false" AutoScroll="true" EnableSingleClickExpand="true" ID="leftMenuTree" HideHScrollbar="true" ExpanderToRight="true" HeaderStyle="true">
                        </f:Tree>
                    </Items>
                </f:Panel>
                <f:TabStrip ID="mainTabStrip" CssClass="centerregion" RegionPosition="Center" ShowBorder="true" EnableTabCloseMenu="true" runat="server">
                    <Tabs>
                        <f:Tab ID="Tab1" Title="首页" Layout="Hbox" Icon="House" runat="server">
                            <Items>
                                <f:Panel ID="Zpanel" runat="server" ShowBorder="false" EnableCollapse="false" BodyPadding="5px" ShowHeader="false" AutoScroll="true">
                                    <Items>
                                        <f:Panel ID="Panel2" runat="server" BodyPadding="5px" ShowBorder="false" ShowHeader="false" CssClass="mypanel" Width="510px">
                                            <Items>
                                                <f:Form ID="Form4" runat="server" BodyPadding="5px" ShowHeader="true" ShowBorder="true" LabelAlign="Right" LabelWidth="100px" Width="500px" Title="我的信息">
                                                    <Rows>
                                                        <f:FormRow ID="FormRow12" runat="server">
                                                            <Items>
                                                                <f:Label ID="lbLoginName" runat="server" Label="登录帐号"></f:Label>

                                                            </Items>
                                                        </f:FormRow>
                                                        <f:FormRow ID="FormRow13" runat="server">
                                                            <Items>
                                                                <f:Label ID="lbTrueName" runat="server" Label="用户名"></f:Label>
                                                            </Items>
                                                        </f:FormRow>
                                                        <f:FormRow ID="FormRow14" runat="server">
                                                            <Items>
                                                                <f:Label ID="lbType" runat="server" Label="身份"></f:Label>
                                                            </Items>
                                                        </f:FormRow>

                                                        <f:FormRow ID="FormRow15" runat="server">
                                                            <Items>
                                                                <f:Label ID="lbLastIP" runat="server" Label="上次登录IP"></f:Label>
                                                            </Items>
                                                        </f:FormRow>
                                                        <f:FormRow ID="FormRow16" runat="server">
                                                            <Items>
                                                                <f:Label ID="lbLastTime" runat="server" Label="上次登录时间"></f:Label>
                                                            </Items>
                                                        </f:FormRow>
                                                        <f:FormRow ID="FormRow17" runat="server">
                                                            <Items>
                                                                <f:Label ID="lbThisIP" runat="server" Label="本次登录IP"></f:Label>
                                                            </Items>
                                                        </f:FormRow>
                                                        <f:FormRow ID="FormRow18" runat="server">
                                                            <Items>
                                                                <f:Label ID="lbThisTime" runat="server" Label="本次登陆时间"></f:Label>
                                                            </Items>
                                                        </f:FormRow>
                                                        <f:FormRow ID="FormRow19" runat="server">
                                                            <Items>
                                                                <f:TextBox ID="txtOldPwd" runat="server" Label="原密码" TextMode="Password" Width="200px" Required="true"></f:TextBox>
                                                            </Items>
                                                        </f:FormRow>
                                                        <f:FormRow ID="FormRow20" runat="server">
                                                            <Items>
                                                                <f:TextBox ID="txtNewPwd1" runat="server" Label="新密码" TextMode="Password" Width="200px" Required="true"></f:TextBox>
                                                            </Items>
                                                        </f:FormRow>
                                                        <f:FormRow ID="FormRow21" runat="server">
                                                            <Items>
                                                                <f:TextBox ID="txtNewPwd2" runat="server" Label="确认密码" TextMode="Password" Width="200px" Required="true" CompareControl="txtNewPwd1"></f:TextBox>
                                                            </Items>
                                                        </f:FormRow>
                                                    </Rows>
                                                    <Toolbars>
                                                        <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" ToolbarAlign="Center">
                                                            <Items>
                                                                <f:Button ID="btnUpdatePwd" runat="server" Text="更新密码" ValidateForms="Form2" OnClick="btnUpdatePwd_Click"></f:Button>
                                                            </Items>
                                                        </f:Toolbar>
                                                    </Toolbars>
                                                </f:Form>
                                            </Items>
                                        </f:Panel>
                                        <f:Panel ID="Panel3" runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="true" Title="信息通告" Width="620px" CssClass="mypanel" Height="400px" Layout="Fit">
                                            <Items>
                                                <f:Grid ID="newG" runat="server" BodyPadding="5px" AllowPaging="true" ForceFit="true" EmptyText="暂无任何信息" OnPageIndexChange="newG_PageIndexChange" DataKeyNames="n_id" ShowBorder="false" PageSize="6" ShowHeader="false">
                                                    <Columns>
                                                        <f:RowNumberField HeaderText="序号" TextAlign="center"></f:RowNumberField>
                                                        <f:HyperLinkField HeaderText="标题" DataTextField="n_title" Target="_blank" DataNavigateUrlFormatString="InfoDetails.aspx?id={0}" DataNavigateUrlFields="n_id"></f:HyperLinkField>
                                                        <f:BoundField HeaderText="类别" DataField="n_type" TextAlign="center"></f:BoundField>
                                                        <f:BoundField HeaderText="日期" DataField="n_time" TextAlign="center"></f:BoundField>
                                                    </Columns>
                                                </f:Grid>
                                            </Items>
                                        </f:Panel>
                                    </Items>
                                </f:Panel>
                            </Items>
                        </f:Tab>
                    </Tabs>
                    <Tools>
                        <f:Tool runat="server" EnablePostBack="false" IconFont="Refresh" CssClass="tabtool" ToolTip="刷新" ID="toolRefresh">
                            <Listeners>
                                <f:Listener Event="click" Handler="onToolRefreshClick" />
                            </Listeners>
                        </f:Tool>
                        <f:Tool runat="server" EnablePostBack="false" IconFont="ExternalLink" CssClass="tabtool" ToolTip="在新标签页中打开" ID="toolNewWindow">
                            <Listeners>
                                <f:Listener Event="click" Handler="onToolNewWindowClick" />
                            </Listeners>
                        </f:Tool>
                        <f:Tool runat="server" EnablePostBack="false" IconFont="Expand" CssClass="tabtool" ToolTip="最大化" ID="toolMaximize">
                            <Listeners>
                                <f:Listener Event="click" Handler="onToolMaximizeClick" />
                            </Listeners>
                        </f:Tool>
                    </Tools>
                </f:TabStrip>
                <f:ContentPanel ID="bottomPanel" CssClass="bottomregion" RegionPosition="Bottom" ShowBorder="false" ShowHeader="false" EnableCollapse="false" runat="server">
                    <table class="bottomtable ui-widget-header f-mainheader" style="width: 100%;">
                        <tr>
                            <td style="text-align: center;">社区物业管理网</td>
                        </tr>
                    </table>
                </f:ContentPanel>
            </Items>
        </f:Panel>
    </form>

    <script>

        var toolRefreshClientID = '<%= toolRefresh.ClientID %>';
        var toolNewWindowClientID = '<%= toolNewWindow.ClientID %>';
        var mainTabStripClientID = '<%= mainTabStrip.ClientID %>';
        var leftPanelClientID = '<%= leftPanel.ClientID %>';
        var topPanelClientID = '<%= topPanel.ClientID %>';

        // 点击标题栏工具图标 - 刷新
        function onToolRefreshClick(event) {
            var mainTabStrip = F(mainTabStripClientID);

            var activeTab = mainTabStrip.getActiveTab();
            if (activeTab.iframe) {
                var iframeWnd = activeTab.getIFrameWindow();
                iframeWnd.location.reload();
            }
        }

        // 点击标题栏工具图标 - 在新标签页中打开
        function onToolNewWindowClick(event) {
            var mainTabStrip = F(mainTabStripClientID);

            var activeTab = mainTabStrip.getActiveTab();
            if (activeTab.iframe) {
                window.open(activeTab.getIFrameUrl(), '_blank');
            }
        }

        // 点击标题栏工具图标 - 最大化
        function onToolMaximizeClick(event) {
            var topPanel = F(topPanelClientID);
            var leftPanel = F(leftPanelClientID);

            var currentTool = this;
            if (currentTool.iconFont.indexOf('expand') >= 0) {
                topPanel.collapse();
                leftPanel.collapse();
                currentTool.setIconFont('compress');
            } else {
                topPanel.expand();
                leftPanel.expand();
                currentTool.setIconFont('expand');
            }
        }



        // 添加示例标签页
        // id： 选项卡ID
        // iframeUrl: 选项卡IFrame地址 
        // title： 选项卡标题
        // icon： 选项卡图标
        // createToolbar： 创建选项卡前的回调函数（接受tabOptions参数）
        // refreshWhenExist： 添加选项卡时，如果选项卡已经存在，是否刷新内部IFrame
        // iconFont： 选项卡图标字体
        function addExampleTab(tabOptions) {

            if (typeof (tabOptions) === 'string') {
                tabOptions = {
                    id: arguments[0],
                    iframeUrl: arguments[1],
                    title: arguments[2],
                    icon: arguments[3],
                    createToolbar: arguments[4],
                    refreshWhenExist: arguments[5],
                    iconFont: arguments[6]
                };
            }

            F.addMainTab(F(mainTabStripClientID), tabOptions);
        }


        // 移除选中标签页
        function removeActiveTab() {
            var mainTabStrip = F(mainTabStripClientID);

            var activeTab = mainTabStrip.getActiveTab();
            activeTab.hide();
        }

        // 获取当前激活选项卡的ID
        function getActiveTabId() {
            var mainTabStrip = F(mainTabStripClientID);

            var activeTab = mainTabStrip.getActiveTab();
            if (activeTab) {
                return activeTab.id;
            }
            return '';
        }

        // 激活选项卡，并刷新其中的内容，示例：表格控件->杂项->在新标签页中打开（关闭后刷新父选项卡）
        function activeTabAndRefresh(tabId) {
            var mainTabStrip = F(mainTabStripClientID);
            var targetTab = mainTabStrip.getTab(tabId);

            if (targetTab) {
                mainTabStrip.activeTab(targetTab);
                targetTab.refreshIFrame();
            }
        }

        // 激活选项卡，并刷新其中的内容，示例：表格控件->杂项->在新标签页中打开（关闭后更新父选项卡中的表格）
        function activeTabAndUpdate(tabId, param1) {
            var mainTabStrip = F(mainTabStripClientID);
            var targetTab = mainTabStrip.getTab(tabId);

            if (targetTab) {
                mainTabStrip.activeTab(targetTab);
                targetTab.getIFrameWindow().updatePage(param1);
            }
        }

        function onSignOutClick() {
            window.open('../html/login.aspx', '_self');
        }

        F.ready(function () {

            var mainTabStrip = F(mainTabStripClientID);

            var leftPanel = F(leftPanelClientID);
            var mainMenu = leftPanel.items[0];

            // 初始化主框架中的树(或者Accordion+Tree)和选项卡互动，以及地址栏的更新
            // treeMenu： 主框架中的树控件实例，或者内嵌树控件的手风琴控件实例
            // mainTabStrip： 选项卡实例
            // updateLocationHash: 切换Tab时，是否更新地址栏Hash值
            // refreshWhenExist： 添加选项卡时，如果选项卡已经存在，是否刷新内部IFrame
            // refreshWhenTabChange: 切换选项卡时，是否刷新内部IFrame
            F.initTreeTabStrip(mainMenu, mainTabStrip, true, false, false);
        });
    </script>
</body>
</html>

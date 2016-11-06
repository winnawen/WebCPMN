<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InfoPut.aspx.cs" Inherits="admin_InfoPut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel7" runat="server" />
        <f:Panel ID="Panel7" runat="server" Margin="5px" BodyPadding="5px" AutoScroll="true"
            Title="信息发布" ShowBorder="true" ShowHeader="True" Layout="VBox">
            <Items>
                <f:Form ID="Form5" ShowBorder="true" ShowHeader="true" Title="投诉信息" BodyPadding="5 5 0 5" runat="server" CssStyle="border-bottom:none;" EnableCollapse="true">
                    <Toolbars>
                        <f:Toolbar ID="Tool1" runat="server">
                            <Items>
                                <f:Button ID="cpBtn" runat="server" Text="发布" OnClick="cpBtn_Click"></f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:RadioButtonList ID="cpObject" runat="server" Label="类别" >
                                    <f:RadioItem Text="小区安全" Value="小区安全" Selected="true"/>
                                    <f:RadioItem Text="卫生环境" Value="卫生环境" />
                                    <f:RadioItem Text="资费" Value="资费" />
                                    <f:RadioItem Text="公共设施" Value="公共设施" />
                                </f:RadioButtonList>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextArea ID="txtContent" runat="server" Label="详细内容" Text="请输入详细信息"></f:TextArea>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>

                <f:Form ID="Form2" ShowBorder="true" ShowHeader="true" Title="报修信息" BodyPadding="5 5 0 5" runat="server" CssStyle="border-bottom:none;" EnableCollapse="true">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar1" runat="server">
                            <Items>
                                <f:Button ID="btnBx" runat="server" Text="发布" OnClick="btnBx_Click"></f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:RadioButtonList ID="bxType" runat="server" Label="类别">
                                    <f:RadioItem Text="私人设施" Value="私人设施" Selected="true" />
                                    <f:RadioItem Text="公共设施" Value="公共设施" />
                                </f:RadioButtonList>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                               <f:TextBox ID="sbName" runat="server" Label="设备名"></f:TextBox>
                                <f:DatePicker ID="fixtime" Width="70px" CssClass="marginr" Required="true" Readonly="false"
                                    CompareControl="dpStartDate" DateFormatString="yyyy-MM-dd" CompareOperator="GreaterThan" EmptyText="日期"
                                    ShowLabel="false" Label="时间" runat="server" EnableEdit="false">
                                </f:DatePicker>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                               <f:TextBox ID="txown" runat="server" Label="报修人"></f:TextBox>
                                <f:TextBox ID="bxphone" runat="server" Label="手机号"></f:TextBox> 
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                 <f:TextBox ID="txaddress" runat="server" Label="住址"></f:TextBox>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>

                <f:Form ID="Form3" ShowBorder="true" ShowHeader="true" Title="停车信息" BodyPadding="5 5 0 5" runat="server" CssStyle="border-bottom:none;" EnableCollapse="true">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar2" runat="server">
                            <Items>
                                <f:Button ID="btnTc" runat="server" Text="发布" OnClick="btnTc_Click"></f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="txphone" runat="server" Label="手机" Width="70px"></f:TextBox>
                                <f:DatePicker ID="Tctime" Width="70px" CssClass="marginr" Required="true" Readonly="false"
                                    CompareControl="dpStartDate" DateFormatString="yyyy-MM-dd" CompareOperator="GreaterThan" EmptyText="日期"
                                    ShowLabel="false" Label="时间" runat="server" EnableEdit="false">
                                </f:DatePicker>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="txTc" runat="server" Label="车牌号" Width="70px"></f:TextBox>
                                <%--<f:TextBox ID="txidcard" runat="server" Label="身份证" Width="70px"></f:TextBox>--%>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>

                <%--<f:Form ID="Form4" ShowBorder="true" ShowHeader="true" Title="反馈信息" BodyPadding="5 5 0 5" runat="server" CssStyle="border-bottom:none;" EnableCollapse="true">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar3" runat="server">
                            <Items>
                                <f:Button ID="btnFk" runat="server" Text="发布" OnClick="btnFk_Click"></f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="txFkPhone" runat="server" Label="手机" Width="70px"></f:TextBox>
                                <f:DatePicker ID="FkTime" Width="70px" CssClass="marginr" Required="true" Readonly="false"
                                    CompareControl="dpStartDate" DateFormatString="yyyy-MM-dd" CompareOperator="GreaterThan" EmptyText="日期"
                                    ShowLabel="false" Label="时间" runat="server" EnableEdit="false">
                                </f:DatePicker>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextArea ID="TxFk" runat="server" Label="详细内容" Text="感谢您的宝贵的建议和意见"></f:TextArea>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>--%>
            </Items>
        </f:Panel>
    </form>
</body>
</html>

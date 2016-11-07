<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QueryInfo.aspx.cs" Inherits="admin_QueryInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />


        <f:Panel ID="Panel1" runat="server" Width="850px" Height="350px" ShowBorder="True" EnableCollapse="true"
            Layout="VBox" BodyPadding="5px" BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="欠费信息查询">
            <Items>
                <f:SimpleForm ID="SimpleForm1" CssClass="mysimpleform" runat="server" ShowBorder="false" EnableCollapse="true"
                    Layout="Column" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="时间段："></f:Label>
                        <f:DatePicker runat="server" Width="150px" CssClass="marginr" DateFormatString="yyyy-MM-dd" EmptyText="请选择开始日期"
                            ShowLabel="false" Label="开始时间"
                            ID="stime1" EnableEdit="false">
                        </f:DatePicker>
                        <f:DatePicker ID="etime1" Width="150px" CssClass="marginr" Readonly="false"
                            CompareControl="dpStartDate" DateFormatString="yyyy-MM-dd" CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" EmptyText="请选择结束日期"
                            ShowLabel="false" Label="结束时间"
                            runat="server" EnableEdit="false">
                        </f:DatePicker>
                        <f:Button runat="server" ID="Button3" CssClass="marginr" Text="重置起止时间">
                            <Listeners>
                                <f:Listener Event="click" Handler="onClearDateClick" />
                            </Listeners>
                        </f:Button>
                        <f:Button runat="server" ID="Button4" Text="查询" ValidateForms="SimpleForm2" OnClick="Button4_Click"></f:Button>
                    </Items>
                </f:SimpleForm>
                <f:Panel BoxFlex="1" Margin="0" ShowBorder="true" ShowHeader="false" runat="server" Layout="Fit">
                    <Items>
                        <f:Grid ID="GCGrid" runat="server" EnableTextSelection="true" ForceFit="true" PageSize="10" DataKeyNames="owe_id" AllowPaging="true" EnableColumnLines="true" ShowHeader="false" ShowBorder="false" OnPageIndexChange="GCGrid_PageIndexChange">
                            <Columns>
                                <f:RowNumberField TextAlign="Center" HeaderText="序号" Width="87px"></f:RowNumberField>
                                <f:BoundField DataField="owe_owner" HeaderText="业主名" TextAlign="Center" Width="223px"></f:BoundField>
                                <f:BoundField DataField="owe_stime" HeaderText="开始时间" TextAlign="Center" Width="215px"></f:BoundField>
                                <f:BoundField DataField="owe_etime" HeaderText="结束时间" TextAlign="Center" Width="215px"></f:BoundField>
                                <f:BoundField DataField="owe_phone" HeaderText="手机" TextAlign="Center" Width="250px"></f:BoundField>
                                <f:BoundField DataField="owe_address" HeaderText="住址" TextAlign="Center" Width="716px"></f:BoundField>
                                <f:BoundField DataField="owe_price" HeaderText="费用（水费、电费）" TextAlign="Center" Width="438px"></f:BoundField>
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Panel>

            </Items>
        </f:Panel>

       <%-- <f:Panel ID="Panel2" runat="server" Width="850px" Height="350px" ShowBorder="True" EnableCollapse="true"
            Layout="VBox" BodyPadding="5px" BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="停车信息查询">
            <Items>
                <f:SimpleForm ID="SimpleForm3" CssClass="mysimpleform" runat="server" ShowBorder="false" EnableCollapse="true"
                    Layout="Column" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="时间段："></f:Label>
                        <f:DatePicker runat="server" Width="150px" CssClass="marginr" DateFormatString="yyyy-MM-dd" EmptyText="请选择开始日期"
                            ShowLabel="false" Label="开始时间"
                            ID="stime2" EnableEdit="false">
                        </f:DatePicker>
                        <f:DatePicker ID="etime2" Width="150px" CssClass="marginr" Readonly="false"
                            CompareControl="dpStartDate" DateFormatString="yyyy-MM-dd" CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" EmptyText="请选择结束日期"
                            ShowLabel="false" Label="结束时间"
                            runat="server" EnableEdit="false">
                        </f:DatePicker>
                        <f:Button runat="server" ID="Button5" CssClass="marginr" Text="重置起止时间">
                            <Listeners>
                                <f:Listener Event="click" Handler="onClearDateClick" />
                            </Listeners>
                        </f:Button>
                        <f:Button runat="server" ID="Button6" Text="查询" ValidateForms="SimpleForm3" OnClick="Button6_Click"></f:Button>
                    </Items>
                </f:SimpleForm>
                <f:Panel BoxFlex="1" Margin="0" ShowBorder="true" ShowHeader="false" runat="server" Layout="Fit">
                    <Items>
                        <f:Grid ID="Grid1" runat="server" EnableTextSelection="true" ForceFit="true" PageSize="10" DataKeyNames="park_id" AllowPaging="true" EnableColumnLines="true" ShowHeader="false" ShowBorder="false" OnPageIndexChange="Grid1_PageIndexChange">
                            <Columns>
                                <f:RowNumberField TextAlign="Center" HeaderText="序号" Width="87px"></f:RowNumberField>
                                <f:BoundField DataField="park_owner" HeaderText="车位买家" TextAlign="Center" Width="210px"></f:BoundField>
                                <f:BoundField DataField="park_phone" HeaderText="手机号" TextAlign="Center" Width="246px"></f:BoundField>
                                <f:BoundField DataField="park_CPH" HeaderText="车牌号" TextAlign="Center" Width="210px"></f:BoundField>
                                <f:BoundField DataField="park_CWID" HeaderText="车位ID" TextAlign="Center" Width="210px"></f:BoundField>
                                <f:BoundField DataField="park_time" HeaderText="时间" TextAlign="Center" Width="240px"></f:BoundField>
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>--%>

        <f:Panel ID="Panel3" runat="server" Width="850px" Height="350px" ShowBorder="True" EnableCollapse="true"
            Layout="VBox" BodyPadding="5px" BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="投诉信息查询">
            <Items>
                <f:SimpleForm ID="SimpleForm4" CssClass="mysimpleform" runat="server" ShowBorder="false" EnableCollapse="true"
                    Layout="Column" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="时间段："></f:Label>
                        <f:DatePicker runat="server" Width="150px" CssClass="marginr" DateFormatString="yyyy-MM-dd" EmptyText="请选择开始日期"
                            ShowLabel="false" Label="开始时间"
                            ID="stime3" EnableEdit="false">
                        </f:DatePicker>
                        <f:DatePicker ID="etime3" Width="150px" CssClass="marginr" Readonly="false"
                            CompareControl="dpStartDate" DateFormatString="yyyy-MM-dd" CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" EmptyText="请选择结束日期"
                            ShowLabel="false" Label="结束时间"
                            runat="server" EnableEdit="false">
                        </f:DatePicker>
                        <f:Button runat="server" ID="Button1" CssClass="marginr" Text="重置起止时间">
                            <Listeners>
                                <f:Listener Event="click" Handler="onClearDateClick" />
                            </Listeners>
                        </f:Button>
                        <f:Button runat="server" ID="Button2" Text="查询" ValidateForms="SimpleForm4" OnClick="Button2_Click"></f:Button>
                    </Items>
                </f:SimpleForm>
                <f:Panel BoxFlex="1" Margin="0" ShowBorder="true" ShowHeader="false" runat="server" Layout="Fit">
                    <Items>
                        <f:Grid ID="Grid2" runat="server" OnPageIndexChange="Grid2_PageIndexChange" EnableTextSelection="true" ForceFit="true" PageSize="15" DataKeyNames="cp_id" AllowPaging="true" EnableColumnLines="true" ShowHeader="false" ShowBorder="false">
                            <Columns>
                                <f:RowNumberField TextAlign="Center" HeaderText="序号" Width="120px"></f:RowNumberField>
                                <f:BoundField DataField="cp_own" HeaderText="投诉人" TextAlign="Center" Width="256px"></f:BoundField>
                                <f:BoundField DataField="cp_time" HeaderText="时间" TextAlign="Center" Width="256px"></f:BoundField>
                                <f:BoundField DataField="cp_type" HeaderText="类别（安全、服务）" TextAlign="Center" Width="256px"></f:BoundField>
                                <f:BoundField DataField="cp_content" HeaderText="内容" TextAlign="Center" Width="530px"></f:BoundField>
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>

    <script>

        function onClearDateClick(event) {
            // this -> 按钮实例；获取按钮所在的表单ID
            var formId = this.el.parents('.f-form').attr('id');

            F(formId).reset();
        }

    </script>
</body>
</html>

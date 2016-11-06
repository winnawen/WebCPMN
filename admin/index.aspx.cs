using System;
using System.Data;
using FineUIPro;
using SC.Helper;
using System.Data.SqlClient;
using System.Text;

public partial class index : cAdmin
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            BindInfo();
            BindGrid(0);
        }
    }

    private void BindInfo()
    {

        SqlDataReader sdr = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "select u_truename,u_pwd,u_mail,u_phone,u_address,u_type,lastip,lasttime,thisip,thistime from web_usr where u_name='" + Session["loginName"].ToString() + "'");
        if (sdr.HasRows)
        {
            if (sdr.Read())
            {
                lbLoginName.Text = Session["loginName"].ToString();
                lbType.Text = sdr["u_type"].ToString() == "1" ? "物业管理员" : "业主";
                lbLastIP.Text = sdr["lastIP"].ToString();
                lbTrueName.Text = sdr["u_truename"].ToString();
                lbLastTime.Text = sdr["lastTime"].ToString();
                lbThisIP.Text = sdr["thisIP"].ToString();
                lbThisTime.Text = sdr["thisTime"].ToString();
                sdr.Close();
                sdr.Dispose();
            }
            else
            {
                sdr.Close();
                sdr.Dispose();
                Url_NOMessage();
                return;
            }
        }
        else
        {
            if (!sdr.IsClosed)
            {
                sdr.Close();
                sdr.Dispose();
            }
            Url_NOMessage();
            return;
        }
    }

    private void LoadData()
    {
        // 模拟从数据库返回数据表
        DataTable table = CreateDataTable();

        DataSet ds = new DataSet();
        ds.Tables.Add(table);
        ds.Relations.Add("TreeRelation", ds.Tables[0].Columns["ID"], ds.Tables[0].Columns["fartherID"]);

        foreach (DataRow row in ds.Tables[0].Rows)
        {
            if (row.IsNull("fartherID") && row.IsNull("url"))
            {
                FineUIPro.TreeNode node = new FineUIPro.TreeNode();
                node.Text = row["name"].ToString();
                node.Expanded = false;
                node.Icon = IconHelper.String2Icon(row["icon"].ToString(), false);
                leftMenuTree.Nodes.Add(node);
                ResolveSubTree(row, node);
            }
            else if (row.IsNull("fartherID") && !row.IsNull("url"))
            {
                FineUIPro.TreeNode node = new FineUIPro.TreeNode();
                node.Text = row["name"].ToString();
                node.NavigateUrl = row["url"].ToString();
                node.Icon = IconHelper.String2Icon(row["icon"].ToString(), false);
                leftMenuTree.Nodes.Add(node);
            }
        }
    }

    private void ResolveSubTree(DataRow dataRow, FineUIPro.TreeNode treeNode)
    {
        DataRow[] rows = dataRow.GetChildRows("TreeRelation");
        if (rows.Length > 0)
        {
            treeNode.Expanded = false;
            foreach (DataRow row in rows)
            {

                FineUIPro.TreeNode node = new FineUIPro.TreeNode();
                node.Text = row["name"].ToString();
                node.NavigateUrl = row["url"].ToString();
                node.Icon = IconHelper.String2Icon(row["icon"].ToString(), false);
                treeNode.Nodes.Add(node);
                ResolveSubTree(row, node);
            }
        }
    }

    #region CreateDataTable
    private DataTable CreateDataTable()
    {
        DataTable table = new DataTable();
        DataColumn column1 = new DataColumn("ID", typeof(string));
        DataColumn column2 = new DataColumn("name", typeof(String));
        DataColumn column3 = new DataColumn("fartherID", typeof(string));
        DataColumn column4 = new DataColumn("url", typeof(string));
        DataColumn column5 = new DataColumn("icon", typeof(string));


        table.Columns.Add(column1);
        table.Columns.Add(column2);
        table.Columns.Add(column3);
        table.Columns.Add(column4);
        table.Columns.Add(column5);

        DataRow row = table.NewRow();
        if (Session["uType"].ToString() == "0")
        {
            row = table.NewRow();
            row[0] = "01";
            row[1] = "信息发布";
            row[2] = DBNull.Value;
            row[3] = "InfoPut.aspx";
            row[4] = "";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "02";
            row[1] = "信息查询";
            row[2] = DBNull.Value;
            row[3] = "QueryInfo.aspx";
            row[4] = "";
            table.Rows.Add(row);
        }

        if (Session["uType"].ToString() == "1")
        {

            row = table.NewRow();
            row[0] = "01";
            row[1] = "员工信息管理";
            row[2] = DBNull.Value;
            row[3] = "staffInfo.aspx";
            row[4] = "User";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "02";
            row[1] = "业主信息管理";
            row[2] = DBNull.Value;
            row[3] = "ownerInfo.aspx";
            row[4] = "User";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "03";
            row[1] = "值班员工信息管理";
            row[2] = DBNull.Value;
            row[3] = "staffDuty.aspx";
            row[4] = "User";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "04";
            row[1] = "欠费信息管理";
            row[2] = DBNull.Value;
            row[3] = "oweInfo.aspx";
            row[4] = "Application";
            table.Rows.Add(row);



            row = table.NewRow();
            row[0] = "05";
            row[1] = "停车信息管理";
            row[2] = DBNull.Value;
            row[3] = "parkInfo.aspx";
            row[4] = "Application";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "06";
            row[1] = "业主投诉信息管理";
            row[2] = DBNull.Value;
            row[3] = "ownerComplain.aspx";
            row[4] = "Application";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "07";
            row[1] = "设备维修信息管理";
            row[2] = DBNull.Value;
            row[3] = "facilityFix.aspx";
            row[4] = "Application";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "08";
            row[1] = "管理员管理";
            row[2] = DBNull.Value;
            row[3] = "AdminManager.aspx";
            row[4] = "User";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "09";
            row[1] = "新闻信息管理";
            row[2] = DBNull.Value;
            row[3] = DBNull.Value;
            row[4] = "ApplicationViewDetail";
            table.Rows.Add(row);



            row = table.NewRow();
            row[0] = "091";
            row[1] = "发布新闻";
            row[2] = "09";
            row[3] = "NewsEdit.aspx";
            row[4] = "Add";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = "092";
            row[1] = "新闻列表";
            row[2] = "09";
            row[3] = "NewsInfo.aspx";
            row[4] = "Application";
            table.Rows.Add(row);
        }
        return table;
    }

    #endregion

    protected void btnUpdatePwd_Click(object sender, EventArgs e)
    {
        if (txtOldPwd.Text.Trim() == "" || txtNewPwd1.Text.Trim() == "" || txtNewPwd2.Text.Trim() == "")
        {
            Alert.Show("旧密码、新密码、确认密码均不能为空！", MessageBoxIcon.Warning);
            return;
        }
        SqlParameter[] paras ={
                                  new SqlParameter("@loginName",Session["loginName"].ToString()),
                                  new SqlParameter("@pwd",System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtOldPwd.Text.Trim(), "MD5").ToLower())
                                           };
        object result = SqlHelper.ExecuteScalar(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "select count(u_name) from web_usr where u_name=@loginName and u_pwd=@pwd", paras);
        if (result != null && result != "")
        {
            if ((int)result > 0)
            {
                SqlParameter[] paras1 ={
                                  new SqlParameter("@loginName",Session["loginName"].ToString()),
                                  new SqlParameter("@pwd",System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtNewPwd1.Text.Trim(), "MD5").ToLower())
                                            };
                if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "update web_usr set u_pwd=@pwd where u_name=@loginName", paras1) > 0)
                {
                    Alert.Show("更新密码成功，请记住新密码！");
                    txtOldPwd.Text = "";
                    txtNewPwd1.Text = "";
                    txtNewPwd2.Text = "";
                }
                else
                {
                    Alert.Show("密码更新失败，请稍后再试...", MessageBoxIcon.Error);
                }
            }
            else
            {
                Alert.Show("旧密码不正确，请重新输入！", MessageBoxIcon.Error);
            }
        }
        else
        {
            Alert.Show("旧密码不正确，请重新输入！", MessageBoxIcon.Error);
        }

    }

    protected void btnExit_Click(object sender, EventArgs e)
    {
        Session.Clear();
        FineUIPro.PageContext.Redirect("../html/Login.aspx", "_self");
        return;
    }

    protected void newG_PageIndexChange(object sender, GridPageEventArgs e)
    {
        newG.PageIndex = e.NewPageIndex;
        BindGrid(newG.PageIndex);
    }

    private void BindGrid(int pageIndex)
    {
        CommonHelper com = new CommonHelper();
        DataTable dt = new DataTable();
        StringBuilder sb = new StringBuilder();
        sb.Append("n_id is not null ");
        newG.RecordCount = com.getDataCount("web_news", sb.ToString(), DB_JOB);
        dt = com.getDataList(pageIndex, newG.PageSize, "web_news", "N_ID,N_title,N_time,n_type", "N_ID", sb.ToString(), "order by N_ID desc", DB_JOB);
        if (pageIndex == 0)
        {
            newG.PageIndex = 0;
        }
        newG.DataSource = dt;
        newG.DataBind();
    }
}
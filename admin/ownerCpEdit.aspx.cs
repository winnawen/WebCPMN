using FineUIPro;
using SC.Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ownerCpEdit : cAdmin
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnClose.OnClientClick = ActiveWindow.GetHidePostBackReference();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlParameter[] paras =
        {
            new SqlParameter("@owner",txOwner.Text.ToString()),
            new SqlParameter("@time",otime.Text.ToString()),
            new SqlParameter("@type",tsType.SelectedValue),
            new SqlParameter("@content",tscontent.Text.ToString()),
        };
        string strsql = "insert into web_cp values(@owner,@time,@type,@content)";
        if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, strsql, paras) > 0)
        {
            Alert.Show("添加成功");
        }
    }

}
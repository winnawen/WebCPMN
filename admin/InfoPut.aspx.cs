using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SC.Helper;
using System.Data.SqlClient;
using System.Data;
using FineUIPro;

public partial class admin_InfoPut : cAdmin
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void cpBtn_Click(object sender, EventArgs e)
    {
        
        SqlParameter[] paras =
        {
            new SqlParameter("@own",Session["loginName"].ToString()),
            new SqlParameter("@time",DateTime.Now.ToString("d")),
            new SqlParameter("@type",cpObject.SelectedValue),
            new SqlParameter("@ct",txtContent.Text.ToString()),
        };
        if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "insert into web_cp values(@own,@time,@type,@ct)", paras) > 0)
        {
            Alert.Show("发布成功", MessageBoxIcon.Success);
        }
        else
        {
            Alert.Show("发布失败", MessageBoxIcon.Error);
        }

    }

    protected void btnBx_Click(object sender, EventArgs e)
    {
        SqlParameter[] paras =
        {
            new SqlParameter("@type",bxType.SelectedValue),
            new SqlParameter("@name",sbName.Text.ToString()),
            new SqlParameter("@time",fixtime.Text.ToString()),
            new SqlParameter("@own",txown.Text.ToString()),
            new SqlParameter("@address",txaddress.Text.ToString()),
        };
        if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "insert into web_fix values(@type,@name,@time,@own,@address,0)", paras) > 0)
        {
            Alert.Show("发布成功", MessageBoxIcon.Success);
        }
        else
        {
            Alert.Show("发布失败", MessageBoxIcon.Error);
        }
    }

    //protected void btnTc_Click(object sender, EventArgs e)
    //{
    //    SqlParameter[] paras =
    //    {
    //        new SqlParameter("@own",Session["loginName"].ToString()),
    //        new SqlParameter("@phone",txphone.Text.ToString()),
    //        new SqlParameter("@cp",txTc.Text.ToString()),
    //        //new SqlParameter("@idcard",txidcard.Text.ToString()),
    //        new SqlParameter("@time",Tctime.Text.ToString()),
    //    };
    //    if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "insert into web_tc values(@own,@phone,@cp,@time)", paras) > 0)
    //    {
    //        Alert.Show("发布成功", MessageBoxIcon.Success);
    //    }
    //    else
    //    {
    //        Alert.Show("发布失败", MessageBoxIcon.Error);
    //    }
    //}

    protected void btnFk_Click(object sender, EventArgs e)
    {
        SqlParameter[] paras =
        {
            new SqlParameter("@own",Session["loginName"].ToString()),
            new SqlParameter("@time",FkTime.Text.ToString()),
            new SqlParameter("@type",cpObject.SelectedValue),
            new SqlParameter("@ct",txtContent.Text.ToString()),
        };
        if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "insert into web_cp values(@own,@time,@type,@ct)", paras) > 0)
        {
            Alert.Show("发布成功", MessageBoxIcon.Success);
        }
        else
        {
            Alert.Show("发布失败", MessageBoxIcon.Error);
        }
    }
}
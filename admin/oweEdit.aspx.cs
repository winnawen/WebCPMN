using FineUIPro;
using SC.Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_oweEdit : cAdmin
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
        Regex phoneregex = new Regex(@"^[0-9]{11}");
        if (!phoneregex.IsMatch(txphone.Text.ToString()) || txOwner.Text.ToString() == ""||stime.Text.ToString()=="" || etime.Text.ToString() == "" || txphone.Text.ToString() == "" || txaddress.Text.ToString() == "" || txPrice.Text.ToString() == "")
        {
            Alert.Show("请输入正确信息", MessageBoxIcon.Error);
            return;
        }
        SqlParameter[] paras =
        {
            new SqlParameter("@owner",txOwner.Text.ToString()),
            new SqlParameter("@stime",stime.Text.ToString()),
            new SqlParameter("@etime",etime.Text.ToString()),
            new SqlParameter("@phone",txphone.Text.ToString()),
            new SqlParameter("@address",txaddress.Text.ToString()),
            new SqlParameter("@price",txPrice.Text.ToString()),
        };
        string strsql = "insert into web_owe values(@owner,@stime,@etime,@phone,@address,@price)";
        if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, strsql, paras) > 0)
        {
            Alert.Show("添加成功");
        }
    }

}
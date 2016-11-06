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

public partial class admin_staffEdit : cAdmin
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
        string selectstr = null;
        foreach(string v in txDutty.SelectedValueArray){
            selectstr += v+"|";
        }
        SqlParameter[] paras =
        {
            new SqlParameter("@name",txName.Text.ToString()),
            new SqlParameter("@age",txAge.Text.ToString()),
            new SqlParameter("@sex",dlSex.SelectedValue),
            new SqlParameter("@phone",txPhone.Text.ToString()),
            new SqlParameter("@ygid",txId.Text.ToString()),
            new SqlParameter("@salary",txSalary.Text.ToString()),
            new SqlParameter("@idcard",txIdCard.Text.ToString()),
            new SqlParameter("@dutty",selectstr),
        };
        string strsql = "insert into web_staff (staff_owner,staff_age,staff_sex,staff_phone,staff_YGID,staff_salary,staff_idcard,staff_dutty) values(@name,@age,@sex,@phone,@ygid,@salary,@idcard,@dutty)";
        if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, strsql, paras) > 0)
        {
            Alert.Show("添加成功");
        }
    }

}
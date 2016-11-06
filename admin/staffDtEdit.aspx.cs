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

public partial class admin_staffDtEdit : cAdmin
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
            new SqlParameter("@name",txName.Text.ToString()),
            new SqlParameter("@age",txAge.Text.ToString()),
            new SqlParameter("@sex",dlSex.SelectedValue),
            new SqlParameter("@phone",txPhone.Text.ToString()),
            new SqlParameter("@ygid",txId.Text.ToString()),
            new SqlParameter("@dzero",txdzro.SelectedValue.ToString()),
            new SqlParameter("@time",dpStartDate.Text.ToString()+"——"+dpEndDate.Text.ToString()),
        };
        string strsql = "insert into web_duty values(@name,@age,@sex,@phone,@ygid,@dzero,@time)";
        if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, strsql, paras) > 0)
        {
            Alert.Show("添加成功");
        }
    }
}
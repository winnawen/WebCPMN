using FineUIPro;
using SC.Helper;
using System;
using System.Data;
using System.Data.SqlClient;


public partial class admin_facilityEdit : cAdmin
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
        if (txName.Text.ToString()==""|| Ftime.Text.ToString()==""|| txPeople.Text.ToString()==""|| txAddress.Text.ToString()==""|| txPrice.Text.ToString()=="")
        {
            Alert.Show("请输入正确信息", MessageBoxIcon.Error);
            return;
        }
        SqlParameter[] paras =
        {
            new SqlParameter("@type",bxType.SelectedValue),
            new SqlParameter("@name",txName.Text.ToString()),
            new SqlParameter("@time",Ftime.Text.ToString()),
            new SqlParameter("@own",txPeople.Text.ToString()),
            new SqlParameter("@address",txAddress.Text.ToString()),
            new SqlParameter("@price",txPrice.Text.ToString())
        };
        string strsql = "insert into web_fix values(@Type,@name,@time,@own,@address,@price)";
        if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, strsql, paras) > 0)
        {
            Alert.Show("添加成功");
        }
    }
}
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
    private int userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnClose.OnClientClick = ActiveWindow.GetHidePostBackReference();
            btnSave.Enabled = false;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Regex phoneregex = new Regex(@"^[0-9]{11}");
        if (!phoneregex.IsMatch(txphone.Text.ToString()) || txOwner.Text.ToString() == ""||stime.Text.ToString()=="" || etime.Text.ToString() == "" || txphone.Text.ToString() == "" || txaddress.Text.ToString() == "" || txlPrice.Text.ToString() == "" || txwPrice.Text.ToString() == "")
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
            new SqlParameter("@wprice",txwPrice.Text.ToString()),
            new SqlParameter("@lprice",txlPrice.Text.ToString()),
            new SqlParameter("@isowe",cbisowe.Checked?"是":"否"),
            new SqlParameter("@uid",userid),
        };
        if (userid==null)
        {
            Alert.Show("'");
        }
       
        string strsql = "insert into web_owe values(@owner,@stime,@etime,@phone,@address,@wprice,@lprice,@isowe,@uid)";
        if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, strsql, paras) > 0)
        {
            Alert.Show("添加成功");
        }
    }

   

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        string sqlstr = "select u_id,u_phone,u_address from web_usr where u_truename='" + txOwner.Text.ToString().Trim()+"'";
        SqlDataReader sdr = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, sqlstr);
        if (sdr.HasRows)
        {
            if (sdr.Read())
            {
                userid = Convert.ToInt32(sdr["u_id"].ToString());
                txphone.Text = sdr["u_phone"].ToString();
                txaddress.Text = sdr["u_address"].ToString();
                sdr.Close();
                sdr.Dispose();
                btnSave.Enabled = true;
            }
            else
            {
                sdr.Close();
                sdr.Dispose();
                Alert.Show("不存在，请检查信息");
            }
        }
        else
        {
            if (!sdr.IsClosed)
            {
                sdr.Close();
                sdr.Dispose();
            }
            Alert.Show("不存在，请检查信息");
        }

    }

}
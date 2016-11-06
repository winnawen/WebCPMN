using FineUIPro;
using SC.Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ownerEdit : cAdmin
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
            new SqlParameter("@txzh",txzh.Text.ToString()),
            new SqlParameter("@pwd",FormsAuthentication.HashPasswordForStoringInConfigFile(idcard.Text.ToString().Substring(idcard.Text.ToString().Length-6).Trim(), "MD5").ToLower()),
            new SqlParameter("@truename",txOwner.Text.ToString()),
            new SqlParameter("@sex",ownSex.SelectedValue),
            new SqlParameter ("@type",'0' ),
            new SqlParameter("@phone",txphone.Text.ToString()),
            new SqlParameter("@idcard", idcard.Text.ToString()),
            new SqlParameter("@mail",txMail.Text.ToString()),
            new SqlParameter("@address",txaddress.Text.ToString()),

        };
        string strsql = "insert into web_usr (u_name,u_pwd,u_mail,u_phone,u_type,u_truename,u_address,u_sex,u_idcard) values(@txzh,@pwd,@mail,@phone,@type,@truename,@address,@sex,@idcard)";
        if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, strsql, paras) > 0)
        {
            Alert.Show("添加成功");
        }
    }

}
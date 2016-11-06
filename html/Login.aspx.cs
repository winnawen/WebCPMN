using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GeetestSDK;
using SC.Helper;
using System.Data;
using System.Data.SqlClient;

public partial class html_Login : cMain
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnDL_Click(object sender, EventArgs e)
    {
        if (txtZH.Text.ToString() == "" || pwd.Text.ToString() == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "status", "alert('输入不能为空');", true);
            return;
        }

        GeetestLib geetest = new GeetestLib(GeetestConfig.publicKey, GeetestConfig.privateKey);
        Byte gt_server_status_code = (Byte)Session[GeetestLib.gtServerStatusSessionKey];
        String userID = (String)Session["userID"];
        int result = 0;
        String challenge = Request.Form.Get(GeetestLib.fnGeetestChallenge);
        String validate = Request.Form.Get(GeetestLib.fnGeetestValidate);
        String seccode = Request.Form.Get(GeetestLib.fnGeetestSeccode);
        if (gt_server_status_code == 1) result = geetest.enhencedValidateRequest(challenge, validate, seccode, userID);
        else result = geetest.failbackValidateRequest(challenge, validate, seccode);
        SqlParameter[] paras =
        {
            new SqlParameter("@name",txtZH.Text.ToString().Trim()),
            new SqlParameter("@pwd",System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pwd.Text.Trim(), "MD5").ToLower())
        };
        if (result != 1)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('请输入验证码！');", true);
            return;
        }

        SqlDataReader sdr = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "select u_id,u_name,u_type,thisIP,thisTime from web_usr where u_name=@name and u_pwd=@pwd", paras);
        if (sdr.HasRows)
        {
            if (sdr.Read())
            {
                Session["userId"] = sdr["u_id"].ToString();
                Session["loginName"] = sdr["u_name"].ToString();
                Session["uType"] = sdr["u_type"].ToString();
                SqlParameter[] tparas =
                {
                    new SqlParameter("@id",sdr["u_id"].ToString()),
                    new SqlParameter("@lip",sdr["thisIP"].ToString()),
                    new SqlParameter("@lt",sdr["thisTime"].ToString()),
                    new SqlParameter("@tip",IPAddress),
                    //new SqlParameter("@tt",DateTime.Now.ToString())
                };
                SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "update web_usr set lastIP=@lip,lastTime=@lt,thisIP=@tip,thistime='"+DateTime.Now.ToString()+"' where u_id=@id", tparas);
                Response.Redirect("../admin/index.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('帐号或者密码错误，晴重新输入！');", true);
            }

        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('帐号或者密码错误，晴重新输入！');", true);
        }
    }
}
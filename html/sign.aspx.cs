using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SC.Helper;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

public partial class html_sign : cMain
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnSumit_Click(object sender, EventArgs e)
    {
        Regex npRegex = new Regex(@"^[a-z0-9A-Z]{5,16}");

        if (usrName.Text.ToString().Length > 16 || usrName.Text.ToString().Length < 6)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('用户名长度为6至16位')", true);
            return;
        }
        Regex mailregex = new Regex(@"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (txtMail.Text.ToString() == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('邮箱不能为空')", true);
            return;
        }
        if (!mailregex.IsMatch(txtMail.Text.ToString()))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('输入的不是邮箱')", true);
            return;
        }
        if (idcard.Text.ToString() == ""|| idcard.Text.ToString().Length != 18)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('请填写正确的身份证')", true);
            return;
        }
        if (trueName.Text.ToString()=="")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('请填写真实姓名')", true);
            return;
        }
        if (tbaddress.Text.ToString()=="")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('请输入真实地址')", true);
            return;
        }
        if (pwd.Text.ToString()=="")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('输入密码不能为空')", true);
            return;
        }

        if (!npRegex.IsMatch(pwd.Text.ToString()))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('密码输入有误，请输入由数字和字母组成，5-16位密码')", true);
            return;
        }
        if (pwd.Text.ToString() != pwd2.Text.ToString())
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('两次密码输入不一致')", true);
            return;
        }
        if (phone.Text.ToString()==""|| phone.Text.ToString().Length!=11)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('请输入正确的手机号')", true);
            return;
        }
        Regex phoneregex = new Regex(@"^[0-9]{11}");
        if (!phoneregex.IsMatch(phone.Text.ToString()))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('请输入合法手机号')", true);
            return;
        }
        SqlParameter[] paras =
        {
            new SqlParameter ("@name",usrName.Text.ToString()),
            new SqlParameter ("@pwd",FormsAuthentication.HashPasswordForStoringInConfigFile(pwd.Text.Trim(), "MD5").ToLower()),
            new SqlParameter ("@mail",txtMail.Text.ToString()),
            new SqlParameter ("@phone",phone.Text.ToString()),
            new SqlParameter ("@type",'0' ),
            new SqlParameter ("@truename",trueName.Text.ToString()),
            new SqlParameter ("@address",tbaddress.Text.ToString()),
            new SqlParameter ("@sex",sex.SelectedValue.ToString()),
            new SqlParameter ("@idcard",idcard.Text.ToString()),
    };
        if ( Convert.ToInt32( SqlHelper.ExecuteScalar(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "select count(*) from web_usr where u_name=@name", paras)) > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "one", "alert('改用户已存在')", true);
            return;
        }
        if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "insert into web_usr (u_name,u_pwd,u_mail,u_phone,u_type,u_truename,u_address,u_sex,u_idcard) values(@name,@pwd,@mail,@phone,@type,@truename,@address,@sex,@idcard)", paras)>0)
        {
            Response.Write("<script>alert('注册成功');window.location='Login.aspx';</script>");
        } 
    }
}
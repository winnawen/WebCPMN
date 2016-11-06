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

public partial class admin_NewsEdit : cAdmin
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnClear.OnClientClick = Form2.GetResetReference();
            dpAddDate.Text = DateTime.Now.ToShortDateString();
        }
       
        if (Request["id"] != null)
        {
            try
            {
                Convert.ToInt32(Request["id"]);
            }
            catch (Exception ex)
            {
                Url_ErrorPath();
            }
            BindData(Request["id"].ToString());
        }
        else
        {
            Author.Text = Session["loginName"].ToString();
        }
    }

    private void BindData(string v)
    {
        SqlParameter para = new SqlParameter("@id", v);
        SqlDataReader sdr = SqlHelper.ExecuteReader(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "select * from web_news where n_ID=@id", para);
        if (sdr.HasRows)
        {
            if (sdr.Read())
            {
                title.Text = sdr["n_title"].ToString();
                Author.Text = sdr["u_id"].ToString();
                dpAddDate.Text = sdr["n_time"].ToString();
                PageContext.RegisterStartupScript(String.Format("updateUEditor({0});", JsHelper.Enquote(sdr["i_content"].ToString())));
                btnSave.Text = "修 改";
                sdr.Close();
                sdr.Dispose();
            }
            else
            {
                if (!sdr.IsClosed)
                {
                    sdr.Close();
                    sdr.Dispose();
                }
            }
        }
        else
        {
            if (!sdr.IsClosed)
            {
                sdr.Close();
                sdr.Dispose();
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Url_NOSession();
            return;
        }
        if (Request["id"] != null)
        {
            SqlParameter[] paras = {
                new SqlParameter("@id",Request["id"]),
            new SqlParameter("@title",title.Text),
            new SqlParameter("@author", Author.Text),
            new SqlParameter("@time", dpAddDate.Text),
            new SqlParameter("@content",Request.Form["UEditor1"].ToString()),
            new SqlParameter("@type",dltype.SelectedValue),
        };
            if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "update web_news set n_title=@title,u_id=@author,n_time=@time,n_content=@content,n_type=@type where n_ID=@id", paras) > 0)
            {
                Alert.Show("修改成功");
            }
        }
        else
        {
            SqlParameter[] paras =
            {
               new SqlParameter("@title",title.Text.ToString()),
            new SqlParameter("@author", Author.Text.ToString()),
            new SqlParameter("@time", dpAddDate.Text.ToString()),
            new SqlParameter("@content",Request.Form["UEditor1"].ToString()),
            new SqlParameter("@type",dltype.SelectedValue),
            };
            if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "insert into web_news values(@title,@content,@time,@author,@type)", paras) > 0)
            {
                Alert.Show("添加成功");
            }
        }
    }
}
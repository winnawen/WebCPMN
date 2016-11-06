using SC.Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_InfoDetails :cMain
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["id"] == null)
        {
            Url_ErrorPath();
            return;
        }
        SqlParameter para = new SqlParameter("@id", Request["id"].ToString());
        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "select * from web_news where n_id=@id", para).Tables[0];
        Title1 = dt.Rows[0]["n_title"].ToString();
        Content = dt.Rows[0]["n_content"].ToString();
    }
    public string getTitle() {
        return Title1;
    }
    string title;
    string content;
    public string Title1
    {
        get
        {
            return title;
        }

        set
        {
            title = value;
        }
    }

    public string Content
    {
        get
        {
            return content;
        }

        set
        {
            content = value;
        }
    }
}
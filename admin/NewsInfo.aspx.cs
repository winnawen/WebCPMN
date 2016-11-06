using FineUIPro;
using SC.Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_NewsInfo :cAdmin
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Grid1.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            BindData(0);
        }
    }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        Grid1.PageIndex = Convert.ToInt32(ddlPageSize.SelectedValue);
        BindData(0);
    }

    private void BindData(int pageIndex)
    {
        SqlParameter para = new SqlParameter("@author", Session["loginName"].ToString());
        CommonHelper com = new CommonHelper();
        DataTable dt = new DataTable();
        StringBuilder sb = new StringBuilder();
        sb.Append(" n_id is not null");
        Grid1.RecordCount = com.getDataCount("web_news", sb.ToString(), DB_JOB, para);
        dt = com.getDataList(pageIndex, Grid1.PageSize, "web_news", "n_id,n_title,n_time,n_type", "n_ID", sb.ToString(), "order by n_id desc", DB_JOB, para);
        if (pageIndex == 0)
        {
            Grid1.PageIndex = 0;
        }
        Grid1.DataSource = dt;
        Grid1.DataBind();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();

        int selectedCount = Grid1.SelectedRowIndexArray.Length;
        if (selectedCount > 0)
        {
            int i = 0;
            List<SqlParameter> list = new List<SqlParameter>();
            foreach (int rowindex in Grid1.SelectedRowIndexArray)
            {
                i++;
                object[] key = Grid1.DataKeys[rowindex];
                if (i == 1)
                {
                    sb.Append(" n_id=@id" + i.ToString());
                    list.Add(new SqlParameter("@id" + i.ToString(), key[0].ToString()));
                }
                else
                {
                    sb.Append(" or n_id=@id" + i.ToString());
                    list.Add(new SqlParameter("@id" + i.ToString(), key[0].ToString()));
                }
            }
            if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "delete from web_news where " + sb.ToString(), list.ToArray()) > 0)
            {
                Alert.Show("成功删除选中的信息。");
                BindData(0);
            }
            else
            {
                Alert.Show("删除选中的信息失败，请稍后再试...", MessageBoxIcon.Warning);
            }
        }
        else
        {
            Alert.Show("没有选中任何信息！");
        }
    }

    protected void Grid1_PageIndexChange(object sender, FineUIPro.GridPageEventArgs e)
    {
        Grid1.PageIndex = e.NewPageIndex;
        BindData(Grid1.PageIndex);
    }

    protected void Grid1_RowCommand(object sender, FineUIPro.GridCommandEventArgs e)
    {
        object[] key = Grid1.DataKeys[e.RowIndex];
        SqlParameter para = new SqlParameter("@id", key[0].ToString());
        if (e.CommandName == "Delete")
        {
            if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "delete web_news where n_id=@id", para) > 0)
            {
                Alert.Show(MessageHelper.DELETE_SUCCESS);
                BindData(0);
            }
            else
            {
                Alert.Show(MessageHelper.DELETE_FAIL, MessageBoxIcon.Error);
            }
        }
    }
}
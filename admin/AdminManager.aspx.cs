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

public partial class admin_AdminManager : cAdmin
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid(0);
    }

    private void BindGrid(int pageIndex)
    {
        CommonHelper com = new CommonHelper();
        DataTable dt = new DataTable();
        StringBuilder sb = new StringBuilder();
        sb.Append("u_id is not null");
        try
        {
            GCGrid.RecordCount = com.getDataCount("web_usr", sb.ToString(), DB_JOB);
            dt = com.getDataList(pageIndex, GCGrid.PageSize, "web_usr", "u_id,u_name,u_truename,u_mail,u_phone,u_address,(case u_type when '0' then '业主' when '1' then '物业管理员' end) as type,thisIP,thisTime", "u_id", sb.ToString(), "order by u_id desc", DB_JOB);
        }
        catch (Exception ex)
        {
            Alert.Show(ex.Message);
            return;
        }
        if (pageIndex == 0)
        {
            GCGrid.PageIndex = 0;
        }
        GCGrid.DataSource = dt;
        GCGrid.DataBind();
    }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        GCGrid.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
        BindGrid(0);
    }
    protected void Window1_Close(object sender, FineUIPro.WindowCloseEventArgs e)
    {
        BindGrid(GCGrid.PageIndex);
    }
    protected void GCGrid_RowCommand(object sender, FineUIPro.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            object[] key = GCGrid.DataKeys[e.RowIndex];
            SqlParameter para = new SqlParameter("@id", key[0].ToString());
            if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "delete from web_usr where u_id =@id", para) > 0)
            {
                Alert.Show(MessageHelper.DELETE_SUCCESS);
                BindGrid(GCGrid.PageIndex);
            }
            else
            {
                Alert.Show(MessageHelper.DELETE_FAIL, MessageBoxIcon.Error);
            }
        }
        if (e.CommandName == "Up")
        {
            object[] key = GCGrid.DataKeys[e.RowIndex];
            SqlParameter para = new SqlParameter("@id", key[0].ToString());
            if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "update web_usr set u_type=1 where u_id =@id", para) > 0)
            {
                Alert.Show("提升成功");
                BindGrid(GCGrid.PageIndex);
            }
            else
            {
                Alert.Show("提升失败", MessageBoxIcon.Error);
            }
        }
    }

    protected void GCGrid_PageIndexChange(object sender, GridPageEventArgs e)
    {
        GCGrid.PageIndex = e.NewPageIndex;
    }
}
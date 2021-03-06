﻿using FineUIPro;
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

public partial class admin_facilityFix : cAdmin
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnAdd.OnClientClick = Window1.GetShowReference("facilityEdit.aspx", "新增维修");
            BindGrid(0);
        }
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

    private void BindGrid(int pageIndex)
    {
        CommonHelper com = new CommonHelper();
        DataTable dt = new DataTable();
        StringBuilder sb = new StringBuilder();
        sb.Append("fix_id is not null");
        try
        {
            GCGrid.RecordCount = com.getDataCount("web_fix ", sb.ToString(), DB_JOB);
            dt = com.getDataList(pageIndex, GCGrid.PageSize, "web_fix", "fix_id,fix_type,fix_name,fix_time,fix_own,fix_address,fix_price", "fix_id", sb.ToString(), "order by fix_ID desc", DB_JOB);
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

    protected void GCGrid_RowCommand(object sender, FineUIPro.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            object[] key = GCGrid.DataKeys[e.RowIndex];
            SqlParameter para = new SqlParameter("@id", key[0].ToString());
            if (SqlHelper.ExecuteNonQuery(SqlHelper.GetConnSting(DB_JOB), CommandType.Text, "delete from web_fix where fix_id =@id", para) > 0)
            {
                Alert.Show(MessageHelper.DELETE_SUCCESS);
                BindGrid(GCGrid.PageIndex);
            }
            else
            {
                Alert.Show(MessageHelper.DELETE_FAIL, MessageBoxIcon.Error);
            }
        }
    }

    protected void GCGrid_PageIndexChange(object sender, GridPageEventArgs e)
    {
        GCGrid.PageIndex = e.NewPageIndex;
    }
}
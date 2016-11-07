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

public partial class admin_QueryInfo : cAdmin
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    #region
    private void BindGrid1(int pageIndex)
    {
        CommonHelper com = new CommonHelper();
        DataTable dt = new DataTable();
        StringBuilder sb = new StringBuilder();
        SqlParameter[] paras =
        {
            new SqlParameter("@stime",stime1.Text.ToString()),
            new SqlParameter("@etime",etime1.Text.ToString()),
            new SqlParameter("@uid",Session["userId"].ToString()),
        };
        sb.Append("owe_id is not null and owe_stime>=@stime and owe_etime<=@etime and u_id=@uid");
        try
        {
            GCGrid.RecordCount = com.getDataCount("web_owe ", sb.ToString(), DB_JOB,paras);
            dt = com.getDataList(pageIndex, GCGrid.PageSize, "web_owe", "*", "owe_id", sb.ToString(), "order by owe_ID desc", DB_JOB,paras);
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
    
    protected void GCGrid_PageIndexChange(object sender, GridPageEventArgs e)
    {
        GCGrid.PageIndex = e.NewPageIndex;
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        BindGrid1(0);
    }
    #endregion




    #region

    //private void BindGrid2(int pageIndex)
    //{
    //    CommonHelper com = new CommonHelper();
    //    DataTable dt = new DataTable();
    //    StringBuilder sb = new StringBuilder();
    //    SqlParameter[] paras =
    //    {
    //        new SqlParameter("@stime",stime2.Text.ToString()),
    //        new SqlParameter("@etime",etime2.Text.ToString()),
    //    };
    //    sb.Append("park_id is not null and park_time>=@stime and park_time<=@etime");
    //    try
    //    {
    //        Grid1.RecordCount = com.getDataCount("web_park ", sb.ToString(), DB_JOB,paras);
    //        dt = com.getDataList(pageIndex, Grid1.PageSize, "web_park", "*", "park_id", sb.ToString(), "order by park_id desc", DB_JOB,paras);
    //    }
    //    catch (Exception ex)
    //    {
    //        Alert.Show(ex.Message);
    //        return;
    //    }
    //    if (pageIndex == 0)
    //    {
    //        Grid1.PageIndex = 0;
    //    }
    //    Grid1.DataSource = dt;
    //    Grid1.DataBind();
    //}
    //protected void Grid1_PageIndexChange(object sender, GridPageEventArgs e)
    //{
    //    Grid1.PageIndex = e.NewPageIndex;
    //}

    //protected void Button6_Click(object sender, EventArgs e)
    //{
    //    BindGrid2(0);
    //}
    #endregion


    #region
    protected void Grid2_PageIndexChange(object sender, GridPageEventArgs e)
    {
        Grid2.PageIndex = e.NewPageIndex;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        BindGrid3(0);
    }

    private void BindGrid3(int pageIndex)
    {
        CommonHelper com = new CommonHelper();
        DataTable dt = new DataTable();
        StringBuilder sb = new StringBuilder();
        SqlParameter[] paras =
        {
            new SqlParameter("@stime",stime3.Text.ToString()),
            new SqlParameter("@etime",etime3.Text.ToString()),
        };
        sb.Append("cp_id is not null and cp_time>=@stime and cp_time<=@etime");
        try
        {
            Grid2.RecordCount = com.getDataCount("web_cp ", sb.ToString(), DB_JOB,paras);
            dt = com.getDataList(pageIndex, Grid2.PageSize, "web_cp", "*", "cp_id", sb.ToString(), "order by cp_id desc", DB_JOB,paras);
        }
        catch (Exception ex)
        {
            Alert.Show(ex.Message);
            return;
        }
        if (pageIndex == 0)
        {
            Grid2.PageIndex = 0;
        }
        Grid2.DataSource = dt;
        Grid2.DataBind();
    }
    #endregion


}
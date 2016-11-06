using System;
using System.Text.RegularExpressions;
using System.Web;
using SC.Helper;

/// <summary>
///cAdmin 的摘要说明
/// </summary>
public class cAdmin : cMain
{
    protected cAdmin()
    {
        this.Load += new EventHandler(cAdmin_Load);
        
    }

    
    //加载时判断session是否为空，不为空时是否有权限访问对应的页面
    private void cAdmin_Load(object sender, EventArgs e)
    {
        //Session["loginName"] = "admin1";
        //Session["uType"] = '1';
        if (Session["loginName"] == null || Session["uType"] == null)
        {
            Response.Write("<script>alert('您尚未登录！请登录后重试');window.top.location='../html/login.aspx'</script>");
            Response.End();
        }
    }


}
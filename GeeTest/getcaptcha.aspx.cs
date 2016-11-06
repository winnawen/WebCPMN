using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GeetestSDK;

public partial class GeeTest_getcaptcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "application/json";
        Response.Write(getCaptcha());
        Response.End();
    }
    private String getCaptcha()
    {
        GeetestLib geetest = new GeetestLib(GeetestConfig.publicKey, GeetestConfig.privateKey);
        String userID = "test";
        Byte gtServerStatus = geetest.preProcess(userID);
        Session[GeetestLib.gtServerStatusSessionKey] = gtServerStatus;
        Session["userID"] = userID;
        return geetest.getResponseStr();
    }
    public class GeetestConfig
    {
        public const String publicKey = "1259ee8520de938a85e2259e02dea0f8";
        public const String privateKey = "d5e24e60eab27be059c9c38b01560b14";
    }
}


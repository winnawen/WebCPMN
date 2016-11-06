using SC.Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;

/// <summary>
/// cMain 的摘要说明
/// </summary>
public class cMain : System.Web.UI.Page
{
	public cMain()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    #region 常量
    /// <summary>
    /// db_job数据库
    /// </summary>
    protected const string DB_JOB = "WebDb";

    /// <summary>
    /// 密钥
    /// </summary>
    protected const string SECRETKEY = "WebCPMN692006";
    #endregion

    #region 跳转地址

    /// <summary>
    /// 没权限
    /// </summary>
    protected void Url_NoPower()
    {
        Response.Redirect(ConfigHelper.PAGE_NOPOWER, true);
        Response.End();
    }

    /// <summary>
    /// 访问路径非法
    /// </summary>
    protected void Url_ErrorPath()
    {
        Response.Redirect(ConfigHelper.PAGE_ERRPATH, true);
        Response.End();
    }

    /// <summary>
    /// 自动退出
    /// </summary>
    protected void Url_NOSession()
    {
        Response.Redirect(ConfigHelper.PAGE_INDEX, true);
        Response.End();
    }

    /// <summary>
    /// 找不到信息
    /// </summary>
    protected void Url_NOMessage()
    {
        Response.Redirect(ConfigHelper.PAGE_NOFOUND, true);
        Response.End();
    }

    #endregion

    #region 公共方法
    /// <summary>
    /// 返回加密字符串
    /// </summary>
    /// <param name="txt">需要加密字符串</param>
    /// <returns>已加密字符串</returns>
    protected string EnCodeTxt(string txt)
    {
        return Md5Hash(txt + SECRETKEY).ToLower();
    }

    /// <summary>
    /// 32位MD5加密
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    private string Md5Hash(string input)
    {
        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
        byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
        StringBuilder sBuilder = new StringBuilder();
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }
        return sBuilder.ToString();
    }
    #endregion


    #region bool IsIPAddress(str1) 判断是否是IP格式

    /// <summary> 
    /// 取得客户端真实IP。如果有代理则取第一个非内网地址 
    /// </summary> 
    public static string IPAddress
    {
        get
        {
            string result = String.Empty;

            result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (result != null && result != String.Empty)
            {
                //可能有代理 
                if (result.IndexOf(".") == -1)    //没有“.”肯定是非IPv4格式 
                    result = null;
                else
                {
                    if (result.IndexOf(",") != -1)
                    {
                        //有“,”，估计多个代理。取第一个不是内网的IP。 
                        result = result.Replace(" ", "").Replace("'", "");
                        string[] temparyip = result.Split(",;".ToCharArray());
                        for (int i = 0; i < temparyip.Length; i++)
                        {
                            if (IsIPAddress(temparyip[i])
                                && temparyip[i].Substring(0, 3) != "10."
                                && temparyip[i].Substring(0, 7) != "192.168"
                                && temparyip[i].Substring(0, 7) != "172.16.")
                            {
                                return temparyip[i];    //找到不是内网的地址 
                            }
                        }
                    }
                    else if (IsIPAddress(result)) //代理即是IP格式 
                        return result;
                    else
                        result = null;    //代理中的内容 非IP，取IP 
                }
            }

            string IpAddress = (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null && HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != String.Empty) ? HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] : HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];



            if (null == result || result == String.Empty)
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];

            if (result == null || result == String.Empty)
                result = HttpContext.Current.Request.UserHostAddress;

            return result;
        }
    }


    /// <summary>
    /// 判断是否是IP地址格式 0.0.0.0
    /// </summary>
    /// <param name="str1">待判断的IP地址</param>
    /// <returns>true or false</returns>
    public static bool IsIPAddress(string str1)
    {
        if (str1 == null || str1 == string.Empty || str1.Length < 7 || str1.Length > 15) return false;

        string regformat = @"^\d{1,3}[\.]\d{1,3}[\.]\d{1,3}[\.]\d{1,3}$";

        Regex regex = new Regex(regformat, RegexOptions.IgnoreCase);
        return regex.IsMatch(str1);
    }

    /// <summary>
    /// 穿过代理服务器获取真实IP
    /// </summary>
    /// <returns></returns>
    public static string AcceptTrueIP()
    {
        string user_IP = null;
        if (HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
        {
            user_IP = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        else
        {
            user_IP = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
        }
        return user_IP;
    }
    #endregion
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BBSManager.xmlfilename = Request.QueryString["filename"];
        //BBSManager.xmlfilename = Request.QueryString["filename"] + "file.xml";
        HyperLink1.NavigateUrl = "~/ContentList.aspx?filename=" + Session["filename"];
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BBSManager mybbs = new BBSManager();

        string filename = Session["filename"] + @"file.xml";
        string filename1 = (string)Session["filename"];
        string xmlfilename = filename1.Substring(filename1.Length-1, 1);
        mybbs.UpdateXml(filename, TextBox1.Text, TextBox2.Text, HttpContext.Current.User.Identity.Name);
        mybbs.UpdateMsg(int.Parse(xmlfilename));
        Literal1.Text = "更新成功";

        Response.Redirect("ContentList.aspx?filename=" + Server.MapPath(".") + @"\Content\" + xmlfilename);
    }
}
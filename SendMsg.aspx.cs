using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SendMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Response.Redirect("MsgList.aspx?categoryid=" + BBSManager.categoryid);
        HyperLink1.NavigateUrl = "MsgList.aspx?categoryid=" + BBSManager.categoryid;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BBSManager mybbs = new BBSManager();
        string username = HttpContext.Current.User.Identity.Name;
        mybbs.AddMsg(TextBox1.Text, username, BBSManager.categoryid);
        mybbs.AddXML(Server.MapPath(".") + @"\Content\Content.xml", TextBox1.Text, TextBox2.Text, username);
        Literal1.Text = "帖子发布成功";
        Response.Redirect("MsgList.aspx?categoryid=" + BBSManager.categoryid);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //Response.Redirect("MsgList.aspx?categoryid=" + BBSManager.categoryid);
    }
}
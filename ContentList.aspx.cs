using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContentList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        XmlDataSource1.DataFile = Request.QueryString["filename"] + "file.xml";
        BBSManager.xmlfilename = Request.QueryString["filename"];
        Session["filename"] = Request.QueryString["filename"];
       // XmlDataSource1.DataFile = "Content\\" + BBSManager.xmlfilename + "file.xml";
        hypeylink1.NavigateUrl = "~/MsgList.aspx?categoryid=" + Session["categoryid"];
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MsgList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BBSManager.categoryid = Request.QueryString["categoryid"];
        Session["categoryid"] = Request.QueryString["categoryid"];
        //BSManager.xmlfilename = Request.QueryString["xmlfilename"];
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        string filename = Server.MapPath(".") + @"\Content\";
        Response.Redirect("contentlist.aspx?filename=" + filename + row.Cells[7].Text);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
}
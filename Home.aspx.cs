using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Convert.ToBoolean(Session["loggedIn"]))
        {
            Session["loggedIn"] = false;
            Response.Redirect("Login.aspx", false);
        }
    }

    protected void logmeout(object sender, EventArgs e)
    {
        Session["loggedIn"] = false;
        Response.Redirect("Login.aspx", false);
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Convert.ToBoolean(Session["loggedIn"]))
        {
            Session["loggedIn"] = false;
            Response.Redirect("Login.aspx", false);
        }
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Pet"].ConnectionString;

            conn.Open();
            using (SqlCommand cmd =
                new SqlCommand("INSERT INTO [Animal]" + "VALUES (@name, @descrip, @image, @softp, @hardp);", conn))
            {
                cmd.Parameters.AddWithValue("@name", Name.Text);
                cmd.Parameters.AddWithValue("@descrip", Description.Text);
                cmd.Parameters.AddWithValue("@image", Image.Text);
                cmd.Parameters.AddWithValue("@softp", Convert.ToInt32(SoftP.Text));
                cmd.Parameters.AddWithValue("@hardp", Convert.ToInt32(HardP.Text));

                SqlDataReader reader = cmd.ExecuteReader();
            }
            conn.Close();
            Label1.Text = "Your animal has been added!";

            Name.Text = "";
            Description.Text = "";
            Image.Text = "";
            SoftP.Text = "";
            HardP.Text = "";
        }
        catch (SqlException ex)
        {
            Label1.Text = "Your animal has not been added. Try shortening your image link.";
            Response.Write(ex);
        }
    }

    protected void logmeout(object sender, EventArgs e)
    {
        Session["loggedIn"] = false;
        Response.Redirect("Login.aspx", false);
    }
}
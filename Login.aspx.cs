using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Convert.ToBoolean(Session["loggedIn"]))
        {
            Session["loggedIn"] = false;
        }
        else
        {
            Response.Redirect("Home.aspx", false);
        }

    }

    protected void loginclick(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Pet"].ConnectionString;

            conn.Open();
            using (SqlCommand cmd =
                new SqlCommand("SELECT UserID FROM [User] WHERE [User].UserName=@uname AND [User].Password=@upass", conn))
            {
                cmd.Parameters.AddWithValue("@uname", Uname.Text);
                cmd.Parameters.AddWithValue("@upass", Upass.Text);

                try
                {
                    int id = (int)cmd.ExecuteScalar();

                    if (id >= 1)
                    {
                        Session["loggedIn"] = true;
                        Session["userID"] = id;
                        conn.Close();
                        Response.Redirect("Home.aspx", false);
                    }
                }
                catch (NullReferenceException exception)
                {
                    InvalidLabel.Visible = true;
                    conn.Close();
                }
            }
            conn.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex);
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
                new SqlCommand("INSERT INTO [User]" +
                            "VALUES (NULL, @username, @password, @name, @email, @age, @location, @bio, @fave, 0);", conn))
            {
                cmd.Parameters.AddWithValue("@name", Name.Text);
                cmd.Parameters.AddWithValue("@username", UserName.Text);
                cmd.Parameters.AddWithValue("@password", Password.Text);
                cmd.Parameters.AddWithValue("@email", Email.Text);
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(Age.Text));
                cmd.Parameters.AddWithValue("@location ", Location.Text);
                cmd.Parameters.AddWithValue("@bio", Bio.Text);
                cmd.Parameters.AddWithValue("@fave", FavAnimal.Text);

                SqlDataReader reader = cmd.ExecuteReader();
            }
            conn.Close();
            Label1.Text = "Your account has been created! Thank you for signing up!";
            Name.Text = "";
            UserName.Text = "";
            Password.Text = "";
            Email.Text = "";
            Age.Text = "";
            Location.Text = "";
            Bio.Text = "";
            FavAnimal.Text = "";

        }
        catch (SqlException ex)
        {
            Response.Write(ex);
        }
    }
}
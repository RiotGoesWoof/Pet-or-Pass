using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Convert.ToBoolean(Session["loggedIn"]))
        {
            Session["loggedIn"] = false;
            Response.Redirect("Login.aspx", false);
        }
        if (!IsPostBack)
        {
            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Pet"].ConnectionString;

                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT Animal.Name, Animal.SoftPoints, Animal.HardPoints, ChoiceList.Pet "+
                                                        "FROM Animal, [User], ChoiceList "+
                                                        "WHERE [User].UserID = ChoiceList.UserID "+
                                                        "AND ChoiceList.AnimalID = Animal.AnimalID "+
                                                        "AND [User].UserID = "+ Convert.ToInt32(Session["UserID"]), conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        Choices.DataSource = reader;
                        Choices.DataBind();
                    }
                }
                conn.Close();
            }
            catch (SqlException ex)
            {
                throw(ex);
            }
            try
            {
                User[] allRecords = null;
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Pet"].ConnectionString;

                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE UserID=" + Session["UserID"], conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        var list = new List<User>();
                        while (reader.Read())
                            list.Add(new User
                            {
                                uname = reader.GetString(2),
                                pass = reader.GetString(3),
                                name = reader.GetString(4),
                                email = reader.GetString(5),
                                age = reader.GetInt32(6),
                                location = reader.GetString(7),
                                bio = reader.GetString(8),
                                favan = reader.GetString(9),
                                score = reader.GetInt32(10)
                            });
                        allRecords = list.ToArray();

                        UserScore.Text = Convert.ToString(allRecords[0].score);
                        Name.Text = allRecords[0].name;
                        UserName.Text = allRecords[0].uname;
                        Password.Text = allRecords[0].pass;
                        Email.Text = allRecords[0].email;
                        Age.Text = Convert.ToString(allRecords[0].age);
                        Location.Text = allRecords[0].location;
                        Bio.Text = allRecords[0].bio;
                        FavAnimal.Text = allRecords[0].favan;
                    }
                }

                conn.Close();
            }
            catch (SqlException ex)
            {
                Response.Write(ex);
            }
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
                new SqlCommand("UPDATE [User] SET Name=@name, Password=@pass, UserName=@uname, Email=@email, Age=@age, Location=@location, Bio=@bio, FavAnimal=@favan WHERE UserID =" + Session["UserID"], conn))
            {
                cmd.Parameters.AddWithValue("@name", Name.Text);
                cmd.Parameters.AddWithValue("@pass", Password.Text);
                cmd.Parameters.AddWithValue("@uname", UserName.Text);
                cmd.Parameters.AddWithValue("@email", Email.Text);
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(Age.Text));
                cmd.Parameters.AddWithValue("@location", Location.Text);
                cmd.Parameters.AddWithValue("@bio", Bio.Text);
                cmd.Parameters.AddWithValue("@favan", FavAnimal.Text);

                SqlDataReader reader = cmd.ExecuteReader();
            }
            conn.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex);
        }
    }

    protected void logmeout(object sender, EventArgs e)
    {
        Session["loggedIn"] = false;
        Response.Redirect("Login.aspx", false);
    }
}
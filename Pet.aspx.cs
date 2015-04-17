using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Pet : System.Web.UI.Page{

    Petter[] allRecords = null;
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
                using (SqlCommand cmd = new SqlCommand("SELECT TOP 1 * FROM Animal ORDER BY NEWID()", conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {

                        var list = new List<Petter>();
                        while (reader.Read())
                        {
                            list.Add(new Petter
                            {
                                anid = reader.GetInt32(0),
                                name = reader.GetString(1),
                                description = reader.GetString(2),
                                image = reader.GetString(3),
                                soft = reader.GetInt32(4),
                                hard = reader.GetInt32(5)
                            });
                        }
                        allRecords = list.ToArray();

                        Session["PetID"] = allRecords[0].anid;
                        Session["SoftP"] = allRecords[0].soft;
                        Session["HardP"] = allRecords[0].hard;
                        AnimalName.Text = allRecords[0].name;
                        Image1.ImageUrl = allRecords[0].image;
                        DescripLabel.Text = "Description: " + allRecords[0].description;
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

    protected void PetListener (object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Pet"].ConnectionString;

            conn.Open();
            using (SqlCommand cmd =
                new SqlCommand("INSERT INTO ChoiceList VALUES (@uid, @aid, @pet);", conn))
            {
                cmd.Parameters.AddWithValue("@uid", Session["UserID"]);
                cmd.Parameters.AddWithValue("@aid", Session["PetID"]);
                cmd.Parameters.AddWithValue("@pet", 1);

                SqlDataReader reader = cmd.ExecuteReader();
            }
            conn.Close();

            try
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Pet"].ConnectionString;

                conn.Open();
                using (SqlCommand cmd =
                    new SqlCommand("UPDATE [User] SET Points= Points+@score WHERE UserID ="+ Session["UserID"], conn))
                {
                    cmd.Parameters.AddWithValue("@score", (Convert.ToInt32(Session["SoftP"]) - Convert.ToInt32(Session["HardP"]))); 

                    SqlDataReader reader = cmd.ExecuteReader();
                }
                conn.Close();
                Response.Redirect("Pet.aspx", false);
            }
            catch (SqlException ex)
            {
                Response.Write(ex);
            }
        }
        catch (SqlException ex)
        {
            Response.Write(ex);
        }
    }

    protected void PassListener(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Pet"].ConnectionString;

            conn.Open();
            using (SqlCommand cmd =
                new SqlCommand("INSERT INTO ChoiceList VALUES (@uid, @aid, @pet);", conn))
            {
                cmd.Parameters.AddWithValue("@uid", Session["UserID"]);
                cmd.Parameters.AddWithValue("@aid", Session["PetID"]);
                cmd.Parameters.AddWithValue("@pet", 0);

                SqlDataReader reader = cmd.ExecuteReader();
            }
            conn.Close();

            try
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Pet"].ConnectionString;

                conn.Open();
                using (SqlCommand cmd =
                    new SqlCommand("UPDATE [User] SET Points= Points+@score WHERE UserID =" + Session["UserID"], conn))
                {
                    cmd.Parameters.AddWithValue("@score", (Convert.ToInt32(Session["HardP"]) - Convert.ToInt32(Session["SoftP"])));

                    SqlDataReader reader = cmd.ExecuteReader();
                }
                conn.Close();
                Response.Redirect("Pet.aspx", false);
            }
            catch (SqlException ex)
            {
                Response.Write(ex);
            }

        }
        catch (SqlException ex)
        {
            Response.Write(ex);
        }
    }

    protected void logmeout (object sender, EventArgs e)
    {
        Session["loggedIn"] = false;
        Response.Redirect("Login.aspx", false);
    }
}
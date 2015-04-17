using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Edit : System.Web.UI.Page
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
                new SqlCommand("UPDATE Animal SET Name=@name, Description=@descrip, Image=@image, SoftPoints=@softp, HardPoints=@hardp WHERE AnimalID =" + DropDownList1.SelectedItem.Value, conn))
            {
                cmd.Parameters.AddWithValue("@name", Name.Text);
                cmd.Parameters.AddWithValue("@descrip", Description.Text);
                cmd.Parameters.AddWithValue("@image", Image.Text);
                cmd.Parameters.AddWithValue("@softp", Convert.ToInt32(SoftP.Text));
                cmd.Parameters.AddWithValue("@hardp", Convert.ToInt32(HardP.Text));

                SqlDataReader reader = cmd.ExecuteReader();
            }
            conn.Close();
            Label1.Text = "The animal has been updated!";

            DropDownList1.Text = "-- Choose Animal --";
            Name.Text = "";
            Description.Text = "";
            Image.Text = "";
            SoftP.Text = "";
            HardP.Text = "";
        }
        catch (SqlException ex)
        {
            Label1.Text = "The animal has not been updated.";
            Response.Write(ex);
        }
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Pet"].ConnectionString;

            conn.Open();
            using (SqlCommand cmd =
                new SqlCommand("DELETE FROM Animal WHERE AnimalID =" + DropDownList1.SelectedItem.Value, conn))
            {
                SqlDataReader reader = cmd.ExecuteReader();
            }
            conn.Close();
            Label1.Text = "The animal has been deleted... You monster.";

            for (int i = 0; i < DropDownList1.Items.Count; i++)
                if (DropDownList1.Items[i].Value == DropDownList1.SelectedItem.Value)
                {
                    DropDownList1.Items.RemoveAt(i);
                    break;
                }

            DropDownList1.Text = "-- Choose Animal --";
            Name.Text = "";
            Description.Text = "";
            Image.Text = "";
            SoftP.Text = "";
            HardP.Text = "";
        }
        catch (SqlException ex)
        {
            Label1.Text = "The animal has not been deleted.";
            Response.Write(ex);
        }
    }

    protected void DropDownChange(object sender, EventArgs e)
    {
        try
        {
            Petter[] allRecords = null;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Pet"].ConnectionString;

            conn.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Animal WHERE AnimalID=" + DropDownList1.SelectedItem.Value, conn))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    var list = new List<Petter>();
                    while (reader.Read())
                        list.Add(new Petter
                        {
                            name = reader.GetString(1),
                            description = reader.GetString(2),
                            image = reader.GetString(3),
                            soft = reader.GetInt32(4),
                            hard = reader.GetInt32(5)
                        });
                    allRecords = list.ToArray();

                    Name.Text = allRecords[0].name;
                    Description.Text = allRecords[0].description;
                    Image.Text = allRecords[0].image;
                    SoftP.Text = Convert.ToString(allRecords[0].soft);
                    HardP.Text = Convert.ToString(allRecords[0].hard);
                }
            }

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
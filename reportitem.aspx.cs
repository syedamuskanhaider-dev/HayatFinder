using System.Configuration;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace HayatFinder
{
    public partial class reportitem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] == null)
                {
                    // User not logged in
                    Response.Redirect("login.aspx");
                }
            }
        }

        protected void btnSubmitReport_Click(object sender, EventArgs e)
        {
            string userEmail = Session["UserEmail"]?.ToString();

            if (string.IsNullOrEmpty(userEmail))
            {
                lblstatus.Text = "Error: user not logged in.";
                return;
            }

            string status = rdoLost.Checked ? "Lost" : "Found";
            string itemName = txtItemName.Text.Trim();
            string category = ddlCategory.SelectedValue;
            string reportDate = txtDate.Text.Trim();
            string description = txtDescription.Text.Trim();
            string location = ddlLocation.SelectedValue;
            string contact = txtContact.Text.Trim();
            string photoPath = "";

            if (fuPhoto.HasFile)
            {
                string folderPath = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(folderPath))
                    Directory.CreateDirectory(folderPath);

                string fileName = Path.GetFileName(fuPhoto.FileName);
                string fullPath = Path.Combine(folderPath, fileName);
                fuPhoto.SaveAs(fullPath);
                photoPath = "Uploads/" + fileName;
            }


            string constr = ConfigurationManager.ConnectionStrings["db_HayatFinder"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"INSERT INTO ReportedItems 
                                (ItemStatus, ItemName, Category, ReportDate, Description, Location, Contact, PhotoPath, UserEmail)
                                VALUES (@ItemStatus, @ItemName, @Category, @ReportDate, @Description, @Location, @Contact, @PhotoPath, @UserEmail)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ItemStatus", status);
                cmd.Parameters.AddWithValue("@ItemName", itemName);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@ReportDate", reportDate);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Location", location);
                cmd.Parameters.AddWithValue("@Contact", contact);
                cmd.Parameters.AddWithValue("@PhotoPath", photoPath);
                cmd.Parameters.AddWithValue("@UserEmail", userEmail);

                con.Open();
                int rows = cmd.ExecuteNonQuery();
                con.Close();

                if (rows > 0)
                {
                    // Redirect to My Items page to show the new item
                    Response.Redirect("myitem.aspx");
                }
                else
                {
                    lblstatus.Text = "Error submitting your report.";
                }
            }
        }
    }
}


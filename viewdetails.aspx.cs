using System.Configuration;
using System;
using System.Data.SqlClient;

namespace HayatFinder
{
    public partial class viewdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int reportId;
                    if (int.TryParse(Request.QueryString["id"], out reportId))
                    {
                        LoadItemDetails(reportId);
                    }
                }
            }
        }

        private void LoadItemDetails(int reportId)
        {
            string constr = ConfigurationManager.ConnectionStrings["HayatFinderDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"SELECT ItemName, Description, ReportDate, Location, Category, Contact, ItemStatus, PhotoPath 
                                 FROM ReportedItems 
                                 WHERE ReportId=@ReportId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ReportId", reportId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblTitle.Text = reader["ItemName"].ToString();
                    lblDescription.Text = reader["Description"].ToString();
                    lblCategory.Text = reader["Category"].ToString();
                    lblStatus.Text = reader["ItemStatus"].ToString();
                    lblLocation.Text = reader["Location"].ToString();

                    string photoPath = reader["PhotoPath"].ToString();
                    if (!string.IsNullOrEmpty(photoPath))
                        imgItem.ImageUrl = photoPath;
                    else
                        imgItem.ImageUrl = "~/Images/no-image.png"; // fallback image
                }
                con.Close();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("feed1.aspx");
        }
    }
}

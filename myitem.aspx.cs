using System.Configuration;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HayatFinder
{
    public partial class myitem : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["HayatFinderDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                BindMyItems();
            }
        }

        private void BindMyItems()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT * FROM ReportedItems WHERE UserEmail=@UserEmail ORDER BY ReportDate DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserEmail", Session["UserEmail"].ToString());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptMyItems.DataSource = dt;
                    rptMyItems.DataBind();
                }
            }
        }

        protected void rptMyItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM ReportedItems WHERE ReportId=@ReportId", con);
                    cmd.Parameters.AddWithValue("@ReportId", e.CommandArgument);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                BindMyItems();
            }
            else if (e.CommandName == "Complete")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand cmd = new SqlCommand("UPDATE ReportedItems SET ItemStatus='Completed' WHERE ReportId=@ReportId", con);
                    cmd.Parameters.AddWithValue("@ReportId", e.CommandArgument);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                BindMyItems();
            }
        }
    }
}

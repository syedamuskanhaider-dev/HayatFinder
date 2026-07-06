using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace HayatFinder
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            //  connection string
            string constr = ConfigurationManager.ConnectionStrings["HayatFinderDB"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    // Retrieve user record by email
                    string query = "SELECT UserId, Email, PasswordHash FROM tbluser WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        con.Open();
                        using (SqlDataReader rdr = cmd.ExecuteReader())
                        {
                            if (rdr.Read())
                            {
                                string storedPassword = rdr["PasswordHash"] != DBNull.Value ? rdr["PasswordHash"].ToString() : "";

    
                                if (storedPassword == password)
                                {
                                    Session["UserID"] = Convert.ToInt32(rdr["UserId"]);
                                    Session["UserEmail"] = rdr["Email"].ToString();
                                    // optionally also keep older key used elsewhere
                                    Session["Email"] = rdr["Email"].ToString();

                                    // successful login
                                    Response.Redirect("Feed1.aspx", false);
                                    return;
                                }
                            }
                        }
                    }
                }

                // invalid credentials
                lblerror.Text = "Invalid email or password. Please try again.";
            }
            catch (Exception ex)
            {
                lblerror.Text = "Error during login: " + ex.Message;
            }
        }
    }
}

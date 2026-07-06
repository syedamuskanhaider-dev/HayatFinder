using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HayatFinder
{
    public partial class Registration1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
             protected void btnRegister_Click(object sender, EventArgs e)
        {

            string constr = ConfigurationManager.ConnectionStrings["db_HayatFinder"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
         
                string query = "INSERT INTO tbluser (FullName, Email, PasswordHash) VALUES (@FullName, @Email, @PasswordHash)";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
           
            cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@PasswordHash", txtPassword.Text); 


                cmd.ExecuteNonQuery();
                con.Close();
            //Registration successfull!
            string script = "alert('Registration successful!'); window.location='Login.aspx';";
            ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect", script, true);


        }
    }
    }

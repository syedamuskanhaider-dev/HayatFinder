using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HayatFinder
{
    public partial class feed1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadItems();
        }

        private void LoadItems(string search = "")
        {
            string constr = "Server=.\\SQLSEEVER; Database=db_HayatFinder; Integrated Security=True";
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT * FROM ReportedItems";
                if (!string.IsNullOrWhiteSpace(search))
                    query += " WHERE ItemName LIKE @search OR Description LIKE @search OR Location LIKE @search OR Category LIKE @search";
                query += " ORDER BY ReportDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrWhiteSpace(search))
                        cmd.Parameters.AddWithValue("@search", "%" + search + "%");

                    DataTable dt = new DataTable();
                    new SqlDataAdapter(cmd).Fill(dt);
                    rptItems.DataSource = dt;
                    rptItems.DataBind();
                    lblNoResults.Visible = dt.Rows.Count == 0;
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e) => LoadItems(txtSearch.Text.Trim());
        protected void txtSearch_TextChanged(object sender, EventArgs e) => LoadItems(txtSearch.Text.Trim());

       
        protected void ViewDetails_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string reportId = btn.CommandArgument;

            if (!string.IsNullOrEmpty(reportId))
            {
                // Safe redirect that works even inside UpdatePanel
                ScriptManager.RegisterStartupScript(this, GetType(), "redirect",
                    $"window.location='viewdetails.aspx?id={reportId}';", true);
            }
        }


        protected void btnSendHelp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
                SendEmail(hfPosterEmail.Value, "Someone wants to help you with your item",
                    txtHelpMsg.Text.Trim(), txtHelpContact.Text.Trim());
        }

        protected void btnSendClaim_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
                SendEmail(hfClaimPosterEmail.Value, "Someone wants to claim your item",
                    txtClaimMsg.Text.Trim(), txtClaimContact.Text.Trim());
        }



        private void SendEmail(string toEmail, string subject, string message, string contact)
        {
            try
            {
                string fromEmail = "23011598-042@uog.edu.pk";
                string appPassword = "fkci eejq awzy qyqa";

                MailMessage mail = new MailMessage(fromEmail, toEmail)
                {
                    Subject = subject,
                    Body = $"{message}\n\nContact Info:\n{contact}"
                };

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.Credentials = new NetworkCredential(fromEmail, appPassword);
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }

                // show centered green modal for success
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessModal",
                    "openMessageModal('Request Sent Successfully!', 'Your message has been sent to the poster.', false);", true);
            }
            catch (Exception ex)
            {
                //  Show centered red modal for error
                string safeError = ex.Message.Replace("'", "").Replace("\n", " ");
                ScriptManager.RegisterStartupScript(this, GetType(), "showErrorModal",
                    $"openMessageModal('Error Sending Request', 'An error occurred while sending the email: {safeError}', true);", true);
            }
        }



    }
}

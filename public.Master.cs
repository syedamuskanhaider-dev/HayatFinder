using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HayatFinder
{
    public partial class _public : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageName = Path.GetFileName(Request.Url.AbsolutePath).ToLower();

            // Pages that should have minimal header and no footer
            if (pageName == "login.aspx" || pageName == "registration.aspx" || pageName == "forgotpassword.aspx" || pageName == "resetpass.aspx")
            {
                // ✅ Hide footer completely
                contact.Visible = false;

                // ✅ Hide all header links except Home and Logo
                liAbout.Visible = false;
                liImportance.Visible = false;
                liHowItWorks.Visible = false;
                liFaq.Visible = false;
                liContact.Visible = false;

                // ✅ Hide login/signup (since we're already on those pages)
                authlinks.Visible = false;
            }
            //if (!IsPostBack)
            //{
            //    string currentPage = System.IO.Path.GetFileName(Request.Path).ToLower();

            //    // Find the Home link (the <a> tag inside the liHome)
            //    HtmlGenericControl liHome = (HtmlGenericControl)FindControl("liHome");

            //    if (currentPage == "landing.aspx")
            //    {
            //        // Disable Home link on landing page
            //        liHome.InnerHtml = "<a href='#liHome' onclick='return false;'>Home</a>";
            //        liHome.Attributes["class"] = "active"; // Optional: keeps it highlighted
            //    }
            //    else
            //    {
            //        // Normal link on other pages
            //        liHome.InnerHtml = "<a href='landing.aspx'>Home</a>";
            //    }
            //}
        }
    }
}


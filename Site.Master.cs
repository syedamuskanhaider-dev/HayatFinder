using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HayatFinder
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnConfirmLogout_Click(object sender, EventArgs e)
        {
            // End session and redirect user
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Landing.aspx");
        }

    }
}

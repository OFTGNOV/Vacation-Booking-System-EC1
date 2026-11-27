using System;

namespace JTBVacationBooking
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool loggedIn = Session["UserId"] != null;
            LoggedOutNav.Visible = !loggedIn;
            LoggedInNav.Visible = loggedIn;

            if (loggedIn)
            {
                string name = Convert.ToString(Session["FullName"]);
                WelcomeLabel.Text = "Hi, " + Server.HtmlEncode(name);
            }
        }
    }
}

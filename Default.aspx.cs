using System;
using System.Globalization;

namespace JTBVacationBooking
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/Login.aspx?returnUrl=" + Server.UrlEncode("~/Default.aspx"), true);
                return;
            }

            if (!IsPostBack)
            {
                StartDate.Attributes["min"] = DateTime.Today.ToString("yyyy-MM-dd");
                EndDate.Attributes["min"] = DateTime.Today.ToString("yyyy-MM-dd");
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            Page.Validate("VacationSearch");
            if (!Page.IsValid) return;

            DateTime startDate;
            DateTime endDate;
            bool validStart = DateTime.TryParseExact(StartDate.Text, "yyyy-MM-dd",
                CultureInfo.InvariantCulture, DateTimeStyles.None, out startDate);
            bool validEnd = DateTime.TryParseExact(EndDate.Text, "yyyy-MM-dd",
                CultureInfo.InvariantCulture, DateTimeStyles.None, out endDate);

            if (!validStart || !validEnd)
            {
                SearchMessage.Text = "Please enter valid travel dates.";
                return;
            }

            if (startDate.Date < DateTime.Today)
            {
                SearchMessage.Text = "The start date cannot be in the past.";
                return;
            }

            if (endDate.Date <= startDate.Date)
            {
                SearchMessage.Text = "The end date must be after the start date.";
                return;
            }

            string url = "~/SearchResults.aspx" +
                "?departureCountry=" + Server.UrlEncode(DepartureCountry.Text.Trim()) +
                "&departureCity=" + Server.UrlEncode(DepartureCity.Text.Trim()) +
                "&destinationCountry=" + Server.UrlEncode(DestinationCountry.Text.Trim()) +
                "&destinationCity=" + Server.UrlEncode(DestinationCity.Text.Trim()) +
                "&startDate=" + Server.UrlEncode(startDate.ToString("yyyy-MM-dd")) +
                "&endDate=" + Server.UrlEncode(endDate.ToString("yyyy-MM-dd")) +
                "&adults=" + Server.UrlEncode(Adults.SelectedValue);

            Response.Redirect(url, true);
        }
    }
}

using System;
using System.Globalization;
using System.Web;

namespace JTBVacationBooking
{
    public partial class SearchResults : System.Web.UI.Page
    {
        // Public properties make the validated search criteria easy for Member 2 to reuse.
        protected string DepartureCountry { get; private set; }
        protected string DepartureCity { get; private set; }
        protected string DestinationCountry { get; private set; }
        protected string DestinationCity { get; private set; }
        protected DateTime StartDateValue { get; private set; }
        protected DateTime EndDateValue { get; private set; }
        protected int AdultsCount { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/Login.aspx", true);
                return;
            }

            if (!LoadSearchCriteria())
            {
                Response.Redirect("~/Default.aspx", true);
                return;
            }

            SearchSummary.Text = "<p class='search-summary'>" +
                HttpUtility.HtmlEncode(DepartureCity + ", " + DepartureCountry) +
                " <span>→</span> " +
                HttpUtility.HtmlEncode(DestinationCity + ", " + DestinationCountry) +
                " &nbsp;·&nbsp; " +
                StartDateValue.ToString("dd MMM yyyy") + " – " +
                EndDateValue.ToString("dd MMM yyyy") +
                " &nbsp;·&nbsp; " + AdultsCount + (AdultsCount == 1 ? " adult" : " adults") +
                "</p>";

            // MEMBER 2: Call the Airline and Cruise web services here (or in a separate
            // service class), then bind their returned results into the two placeholders.
        }

        private bool LoadSearchCriteria()
        {
            DepartureCountry = (Request.QueryString["departureCountry"] ?? "").Trim();
            DepartureCity = (Request.QueryString["departureCity"] ?? "").Trim();
            DestinationCountry = (Request.QueryString["destinationCountry"] ?? "").Trim();
            DestinationCity = (Request.QueryString["destinationCity"] ?? "").Trim();

            int adults;
            if (String.IsNullOrWhiteSpace(DepartureCountry) ||
                String.IsNullOrWhiteSpace(DepartureCity) ||
                String.IsNullOrWhiteSpace(DestinationCountry) ||
                String.IsNullOrWhiteSpace(DestinationCity) ||
                !DateTime.TryParseExact(Request.QueryString["startDate"], "yyyy-MM-dd",
                    CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime start) ||
                !DateTime.TryParseExact(Request.QueryString["endDate"], "yyyy-MM-dd",
                    CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime end) ||
                !Int32.TryParse(Request.QueryString["adults"], out adults) ||
                adults < 1 || adults > 8 || end.Date <= start.Date)
                return false;

            StartDateValue = start;
            EndDateValue = end;
            AdultsCount = adults;
            return true;
        }
    }
}

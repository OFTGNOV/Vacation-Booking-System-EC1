using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace JTBVacationBooking
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                Response.Redirect("~/Default.aspx", true);
                return;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string email = Email.Text.Trim().ToLowerInvariant();
            const string sql = @"SELECT UserId, FullName, Email, PasswordHash, PasswordSalt
                                 FROM dbo.Users WHERE Email = @Email AND IsActive = 1";

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 254).Value = email;
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow))
                {
                    if (!reader.Read())
                    {
                        LoginMessage.Text = "The email or password you entered is incorrect.";
                        return;
                    }

                    int userId = Convert.ToInt32(reader["UserId"]);
                    string fullName = Convert.ToString(reader["FullName"]);
                    string savedEmail = Convert.ToString(reader["Email"]);
                    byte[] hash = (byte[])reader["PasswordHash"];
                    byte[] salt = (byte[])reader["PasswordSalt"];

                    if (!PasswordHasher.VerifyPassword(Password.Text, salt, hash))
                    {
                        LoginMessage.Text = "The email or password you entered is incorrect.";
                        return;
                    }

                    Session["UserId"] = userId;
                    Session["FullName"] = fullName;
                    Session["Email"] = savedEmail;
                }
            }

            FormsAuthentication.SetAuthCookie(email, false);
            string returnUrl = Request.QueryString["returnUrl"];
            if (!String.IsNullOrWhiteSpace(returnUrl) && returnUrl.StartsWith("~/", StringComparison.Ordinal))
                Response.Redirect(returnUrl, true);
            else
                Response.Redirect("~/Default.aspx", true);
        }
    }
}

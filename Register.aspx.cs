using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

namespace JTBVacationBooking
{
    public partial class Register : System.Web.UI.Page
    {
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string name = FullName.Text.Trim();
            string email = Email.Text.Trim().ToLowerInvariant();
            string password = Password.Text;

            if (!Regex.IsMatch(name, @"^[\p{L}\p{M}][\p{L}\p{M}\s.'-]{1,119}$"))
            {
                RegisterMessage.Text = "Enter a valid full name.";
                return;
            }

            if (!Regex.IsMatch(password, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"))
            {
                RegisterMessage.Text = "Your password must be at least 8 characters and include uppercase, lowercase and a number.";
                return;
            }

            byte[] salt;
            byte[] hash = PasswordHasher.HashPassword(password, out salt);

            const string sql = @"INSERT INTO dbo.Users
                                 (FullName, Email, PasswordHash, PasswordSalt, IsActive, CreatedAt)
                                 VALUES (@FullName, @Email, @PasswordHash, @PasswordSalt, 1, GETDATE())";

            try
            {
                using (SqlConnection con = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@FullName", SqlDbType.NVarChar, 120).Value = name;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 254).Value = email;
                    cmd.Parameters.Add("@PasswordHash", SqlDbType.VarBinary, 32).Value = hash;
                    cmd.Parameters.Add("@PasswordSalt", SqlDbType.VarBinary, 16).Value = salt;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                Response.Redirect("~/Login.aspx?registered=1", true);
            }
            catch (SqlException ex)
            {
                // SQL Server unique-key violation for an email already registered.
                if (ex.Number == 2601 || ex.Number == 2627)
                    RegisterMessage.Text = "An account with this email address already exists.";
                else
                    RegisterMessage.Text = "We could not create your account. Please try again.";
            }
        }
    }
}

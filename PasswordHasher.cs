using System;
using System.Security.Cryptography;

namespace JTBVacationBooking
{
    public static class PasswordHasher
    {
        private const int SaltSize = 16;
        private const int HashSize = 32;
        private const int Iterations = 150000;

        public static byte[] HashPassword(string password, out byte[] salt)
        {
            salt = new byte[SaltSize];
            using (RandomNumberGenerator rng = RandomNumberGenerator.Create())
                rng.GetBytes(salt);

            using (var deriveBytes = new Rfc2898DeriveBytes(password, salt, Iterations))
                return deriveBytes.GetBytes(HashSize);
        }

        public static bool VerifyPassword(string password, byte[] salt, byte[] expectedHash)
        {
            if (salt == null || expectedHash == null) return false;

            byte[] actualHash;
            using (var deriveBytes = new Rfc2898DeriveBytes(password, salt, Iterations))
                actualHash = deriveBytes.GetBytes(expectedHash.Length);

            return FixedTimeEquals(actualHash, expectedHash);
        }

        private static bool FixedTimeEquals(byte[] a, byte[] b)
        {
            if (a == null || b == null || a.Length != b.Length) return false;
            int difference = 0;
            for (int i = 0; i < a.Length; i++)
                difference |= a[i] ^ b[i];
            return difference == 0;
        }
    }
}

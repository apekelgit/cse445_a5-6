namespace TravelBooking
{
    public static class PasswordUtil
    {
        public static string Hash(string input)
        {
            //// Hash will actually return the encrypted password string
            Cryption cryption = new Cryption();
            return cryption.Encrypt(input);
        }

        // Verify decrypts the stored value and compares with what user typed
        public static bool Verify(string input, string storedHash)
        {
            Cryption cryption = new Cryption();
            string decrypted = cryption.Decrypt(storedHash);
            return decrypted == input;
        }
    }
}

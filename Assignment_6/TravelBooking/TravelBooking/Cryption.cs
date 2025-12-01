using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;


namespace TravelBooking
{
    public class Cryption
    {

        // 8-byte seed for DES (same idea as slides)
        private readonly byte[] seed = ASCIIEncoding.ASCII.GetBytes("cse44598");

        public string Encrypt(string plainString)
        {
            if (string.IsNullOrEmpty(plainString))
                throw new ArgumentNullException(nameof(plainString));

            using (SymmetricAlgorithm saProvider = DES.Create())
            using (var mStream = new MemoryStream())
            using (var cStream = new CryptoStream(
                       mStream,
                       saProvider.CreateEncryptor(seed, seed),
                       CryptoStreamMode.Write))
            using (var sWriter = new StreamWriter(cStream))
            {
                sWriter.Write(plainString);
                sWriter.Flush();
                cStream.FlushFinalBlock();
                return Convert.ToBase64String(mStream.GetBuffer(), 0, (int)mStream.Length);
            }
        }

        public string Decrypt(string encryptedString)
        {
            if (string.IsNullOrEmpty(encryptedString))
                throw new ArgumentNullException(nameof(encryptedString));

            using (SymmetricAlgorithm saProvider = DES.Create())
            using (var memStream = new MemoryStream(Convert.FromBase64String(encryptedString)))
            using (var cStream = new CryptoStream(
                       memStream,
                       saProvider.CreateDecryptor(seed, seed),
                       CryptoStreamMode.Read))
            using (var reader = new StreamReader(cStream))
            {
                return reader.ReadToEnd();
            }
        }
    }
}
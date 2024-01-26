namespace HelloClickOnce.App
{
    internal class CustomSecretService
    {
        private static readonly string SECRET_KEY = "## SECRET HERE ##";
        public string GetSecretKey() => SECRET_KEY;
    }
}

namespace HelloClickOnce.App
{
    internal class CustomSecretService
    {
        private static readonly string SECRET_KEY = "~[GOS:9OD>2L!T6l>jo*RU%g";
        public string GetSecretKey() => SECRET_KEY;
    }
}

// ignore_for_file: constant_identifier_names

class Config {
  static const String APP_NAME = "Test APP";
  static const String API_KEY = "21960663-cb5469eaeadafe2e3b658e89e";

  static const String URL_PRODUCTION = "https://pixabay.com/api/?key=$API_KEY";
  static const String URL_DEV = "https://pixabay.com/api/?key=$API_KEY";
  static const String URL_LOCAL = "https://pixabay.com/api/?key=$API_KEY";

  static const String baseUrl = URL_PRODUCTION;
}

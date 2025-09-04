class ApiConfig {
  static const defaultVersion = '2020-08-27';
  static const defaultApiUrl = 'https://api.stripe.com/v1/';
  static const defaultFilesUrl = 'https://files.stripe.com/v1/';

  final String apiKey;
  final String version;
  final String baseApiUrl;
  final String baseFilesUrl;

  const ApiConfig({
    required this.apiKey,
    this.version = defaultVersion,
    this.baseApiUrl = defaultApiUrl,
    this.baseFilesUrl = defaultFilesUrl,
  });
}

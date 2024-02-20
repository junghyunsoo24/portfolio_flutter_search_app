class UriCheck {
  static const String registerWebUri = 'http://localhost:3001/enrollText';
  static const String registerEmulatorUri = 'http://10.0.2.2:3001/enrollText';
  static const String registerAppUri = 'http://172.30.67.135:3001/enrollText';

  static const String searchSBertWebUri = 'http://localhost:3001/query/sbert/v2';
  static const String searchSBertEmulatorUri = 'http://10.0.2.2:3001/query/sbert/v2';
  static const String searchSBertAppUri = 'http://172.30.67.135:3001/query/sbert/v2';

  static const String searchCosWebUri = 'http://localhost:3001/query/cos/v2';
  static const String searchCosEmulatorUri = 'http://10.0.2.2:3001/cos/sbert/v2';
  static const String searchCosAppUri = 'http://172.30.67.135:3001/cos/sbert/v2';
}
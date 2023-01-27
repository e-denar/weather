enum Env {
  debug(
    authKey: 'dev-e8cxuggly8tx3cb2.us.auth0.com',
    authToken: 'Q7ir6MHA4p5mUe8uaskX1sXk6GRaq6dt',
    weatherApiKey: '542ffd081e67f4512b705f89d2a611b2',
  ),
  profile(
    authKey: 'dev-e8cxuggly8tx3cb2.us.auth0.com',
    authToken: 'Q7ir6MHA4p5mUe8uaskX1sXk6GRaq6dt',
    weatherApiKey: '542ffd081e67f4512b705f89d2a611b2',
  ),
  release(
    authKey: 'dev-e8cxuggly8tx3cb2.us.auth0.com',
    authToken: 'Q7ir6MHA4p5mUe8uaskX1sXk6GRaq6dt',
    weatherApiKey: '542ffd081e67f4512b705f89d2a611b2',
  );

  const Env({
    required this.authKey,
    required this.authToken,
    required this.weatherApiKey,
  });

  final String authKey;
  final String authToken;
  final String weatherApiKey;
}

class EnvConfig {
  factory EnvConfig({
    required Env env,
  }) {
    _instance ??= EnvConfig._internal(env);
    return _instance!;
  }
  EnvConfig._internal(this.env);
  final Env env;
  static EnvConfig? _instance;

  static EnvConfig get instance {
    assert(_instance != null, 'You must initialize before using');
    return _instance!;
  }
}

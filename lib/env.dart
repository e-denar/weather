enum Env {
  debug(
    authKey: 'dev-e8cxuggly8tx3cb2.us.auth0.com',
    authToken: 'Q7ir6MHA4p5mUe8uaskX1sXk6GRaq6dt',
  ),
  profile(
    authKey: 'dev-e8cxuggly8tx3cb2.us.auth0.com',
    authToken: 'Q7ir6MHA4p5mUe8uaskX1sXk6GRaq6dt',
  ),
  release(
    authKey: 'dev-e8cxuggly8tx3cb2.us.auth0.com',
    authToken: 'Q7ir6MHA4p5mUe8uaskX1sXk6GRaq6dt',
  );

  const Env({
    required this.authKey,
    required this.authToken,
  });

  final String authKey;
  final String authToken;
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

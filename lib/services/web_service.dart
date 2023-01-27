import 'dart:async';

import 'package:http/http.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch,
}

abstract class HttpContentTypes {
  static const json = 'application/json';
}

class WebService {
  Future<Response> send(
    String url, {
    required HttpMethod method,
    AuthHeader? authHeader,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    Object? body,
    Duration timeout = const Duration(minutes: 1),
    String contentType = HttpContentTypes.json,
  }) async {
    assert(url.isNotEmpty);

    headers ??= {};

    if (authHeader != null) {
      headers.putIfAbsent('Authorization', () => authHeader.value);
    }

    headers.putIfAbsent('Content-Type', () => contentType);

    Uri uri = Uri.parse(url);
    late Response response;

    if (queryParameters != null) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    try {
      switch (method) {
        case HttpMethod.get:
          response = await get(uri, headers: headers).timeout(timeout);
          break;
        case HttpMethod.post:
          response =
              await post(uri, headers: headers, body: body).timeout(timeout);
          break;
        case HttpMethod.put:
          response =
              await put(uri, headers: headers, body: body).timeout(timeout);
          break;
        case HttpMethod.delete:
          response = await delete(uri, headers: headers).timeout(timeout);
          break;
        case HttpMethod.patch:
          response =
              await patch(uri, headers: headers, body: body).timeout(timeout);
          break;
        default:
          throw UnimplementedError('$method not implemented');
      }

      _ensureSuccessfulResponse(response);

      return response;
    } on Exception {
      // TODO:
      rethrow;
    }
  }

  void _ensureSuccessfulResponse(Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return;
    }

    // TODO: throw proper exception
  }
}

class AuthHeader {
  AuthHeader({required this.authToken, required this.authScheme});

  factory AuthHeader.token(String authToken) =>
      AuthHeader(authScheme: 'Token', authToken: authToken);

  factory AuthHeader.bearer(String authToken) =>
      AuthHeader(authScheme: 'Bearer', authToken: authToken);

  final String authToken;
  final String authScheme;

  String get value => toString();

  @override
  String toString() => '$authScheme $authToken';
}

import 'package:flutter_appauth/flutter_appauth.dart';

class AuthenticationService {
  final FlutterAppAuth _appAuth = FlutterAppAuth();

  // Configuration Keycloak
  final String _clientId = 'flutter-client';
  final String _redirectUri = 'com.example.myapp://oauthredirect';
  final String _issuer = 'http://10.0.2.2:8081/realms/master';
  // final String _issuer = 'http://192.168.143.160:8081/realms/master';

  String? _accessToken;

  /// Login user with Keycloak
  Future<bool> login() async {
    try {
      final TokenResponse? result = await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          _clientId,
          _redirectUri,
          issuer: _issuer,
          scopes: ['openid', 'profile', 'email'],
          allowInsecureConnections: true,
        ),
      );
      print("Success: ${result?.accessToken}");

      _accessToken = result?.accessToken;

      if (_accessToken != null) {
        print("Login successful! Access Token: $_accessToken");
        return true; // Login réussi
      } else {
        print("Login failed. No access token received.");
        return false; // Login échoué
      }
    } catch (e) {
      print("Login error: $e");
      return false; // En cas d'erreur
    }
  }
}

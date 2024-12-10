import 'package:flutter/material.dart';
import 'package:aayu_app/shared/services/login_service.dart';

class LoginProvider with ChangeNotifier {
  final LoginService _loginService = LoginService();
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    final success = await _loginService.login(username, password);

    if (success) {
      _isLoggedIn = true;
      _errorMessage = null;
    } else {
      _errorMessage = 'Wrong username or password';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await _loginService.logout();
    _isLoggedIn = false;
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    _isLoggedIn = await _loginService.isLoggedIn();
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:aayu_app/shared/services/signup_service.dart';

class SignUpProvider with ChangeNotifier {
  final RegisterService _registerService = RegisterService();
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> register(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final success = await _registerService.register(email, password);

    if (success) {
      _errorMessage = null;
    } else {
      _errorMessage = 'Registration failed. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }
}

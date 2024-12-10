import 'dart:math';
import 'dart:developer' as developer;

String buildCaptcha() {
  const letters =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
  const length = 6;
  final random = Random();
  String captchaString = String.fromCharCodes(
    List.generate(
      length,
      (index) => letters.codeUnitAt(
        random.nextInt(letters.length),
      ),
    ),
  );
  developer.log("the random string is $captchaString");
  return captchaString;
}

// Validator for email
String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email cannot be empty.';
  }
  // Basic email validation pattern
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!emailRegex.hasMatch(email)) {
    return 'Please enter a valid email.';
  }
  return null;
}

// Validator for password
String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password cannot be empty';
  }
  if (password.length < 8) {
    return 'Password must be at least 8 characters long.';
  }
  // Ensure password has at least one number and one letter
  final hasUppercase = password.contains(RegExp(r'[A-Z]'));
  final hasLowercase = password.contains(RegExp(r'[a-z]'));
  final hasDigits = password.contains(RegExp(r'\d'));

  if (!hasUppercase || !hasLowercase || !hasDigits) {
    return 'Password must contain upper, lower, and a number.';
  }
  return null;
}

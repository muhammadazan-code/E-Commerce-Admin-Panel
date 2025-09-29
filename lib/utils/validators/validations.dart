class TValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // Regular Expression for email validation
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    // Check for uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contains at least one uppercase letter.";
    }
    // Check for Numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contains at least one number.";
    }
    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must contains at least one special characters.";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    // Regular Expression for phone number validation
    final phoneRegExp = RegExp(r'^\d{10}$');
    
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }
    return null;
  }
}

class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')){
      return 'Not valid email';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length<4) {
          return 'password minimun 5';
    }
    return null;
  }
}
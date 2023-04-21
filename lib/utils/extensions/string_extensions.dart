extension StringExtensions on String {
  bool isValidEmail() {
    final regex = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    );
    return regex.hasMatch(this);
  }

  bool isValidPassword() {
    // final regex = RegExp(
    //   r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
    // );
    // return regex.hasMatch(this);
    return length >= 6;
  }

  bool isValidConfirmPassword(String password) {
    return compareTo(password) == 0;
  }

  int toInt() {
    return int.parse(this);
  }

  double toDouble() {
    return double.parse(this);
  }
}

extension StringExtensions on String {

  bool isValidPassword() {
    return RegExp(
      r'^[a-zA-Z0-9@/\\\-+.!,#\$%&()\~|_]{8,30}$',
    ).hasMatch(this);
  }
}

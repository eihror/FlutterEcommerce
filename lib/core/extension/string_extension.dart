extension StringEmailExtension on String {
  bool get isValidEmail {
    final value = trim();

    if (value.isEmpty) return false;

    final regex = RegExp(r'^[\w\.\-+]+@([\w\-]+\.)+[A-Za-z]{2,}$');

    return regex.hasMatch(value);
  }
}

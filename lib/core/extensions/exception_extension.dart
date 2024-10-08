extension ExceptionExtension on Exception {
  String get getMessage {
    if (toString().startsWith("Exception: ")) {
      return toString().substring(11);
    } else {
      return toString();
    }
  }
}

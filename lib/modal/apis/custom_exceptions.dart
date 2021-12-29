abstract class CustomException implements Exception {
  String? prefix;
  String? message;
  CustomException(this.prefix, this.message);

  @override
  String toString() {
    return "$prefix : $message";
  }
}

class PhoneAuthException extends CustomException {
  PhoneAuthException(String? message)
      : super("Error during phone verification", message);
}

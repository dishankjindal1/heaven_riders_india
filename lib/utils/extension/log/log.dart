import 'dart:developer' as dev show log;

extension PrintLog on String {
  void log() {
    dev.log(this);
  }
}

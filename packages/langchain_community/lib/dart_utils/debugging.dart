///
/// Prints a debug message if the application is not in profile or product mode.
///
/// The message is printed only if the optional condition `cond` is either null
/// or evaluates to true for the given message.
///
/// \param message The message to print.
/// \param cond An optional condition that must be true for the message to be printed.
void kDebugPrint(dynamic message, {bool Function(String str)? cond}) {
  if (!const bool.fromEnvironment('dart.vm.profile') &&
      !const bool.fromEnvironment('dart.vm.product') &&
      (cond == null || cond(message))) {
    // ignore: avoid_print
    print(message);
  }
}

/// Returns true if the application is in debug mode.
///
/// The application is considered to be in debug mode if it is not in profile
/// or product mode.
bool get kDebugDartMode =>
    !const bool.fromEnvironment('dart.vm.profile') &&
    !const bool.fromEnvironment('dart.vm.product');

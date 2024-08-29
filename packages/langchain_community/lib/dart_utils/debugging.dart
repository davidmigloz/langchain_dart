void kDebugPrint(dynamic message, {bool Function(String str)? cond}) {
  if (!bool.fromEnvironment('dart.vm.profile') &&
      !bool.fromEnvironment('dart.vm.product') &&
      (cond == null || cond(message))) {
    print(message);
  }
}

bool get kDebugDartMode =>
    !bool.fromEnvironment('dart.vm.profile') &&
    !bool.fromEnvironment('dart.vm.product');

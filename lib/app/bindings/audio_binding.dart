import 'package:get/get.dart';

/// AudioView uses a StatefulWidget internally, so the binding is minimal.
/// It exists to keep the routing pattern consistent with the rest of the app.
class AudioBinding extends Bindings {
  @override
  void dependencies() {
    // No GetX controller needed — AudioView manages its own state
  }
}

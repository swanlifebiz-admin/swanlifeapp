import 'package:get/get.dart';
import '../data/services/auth_service.dart';
import '../data/repositories/user_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Inject global services here (e.g. AuthService, FirestoreService)
    Get.put(AuthService(), permanent: true);
    Get.lazyPut(() => UserRepository(), fenix: true);
  }
}

import 'package:get/get.dart';
import '../ui/views/home_view.dart';
import '../bindings/home_binding.dart';
import '../ui/views/splash_view.dart';
import '../bindings/splash_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}

abstract class _Paths {
  static const HOME = '/home';
  static const SPLASH = '/splash';
}

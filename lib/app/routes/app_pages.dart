import 'package:get/get.dart';
import 'package:swanlife/app/bindings/audio_binding.dart';
import 'package:swanlife/app/routes/app_routes.dart';
import 'package:swanlife/app/ui/views/audio/audio_view.dart';
import 'package:swanlife/app/ui/views/journal/journal_view.dart';
import '../ui/views/main_shell_view.dart';
import '../bindings/main_shell_binding.dart';
import '../ui/views/auth/login/login_view.dart';
import '../bindings/login_binding.dart';
import '../ui/views/auth/signup/signup_view.dart';
import '../bindings/signup_binding.dart';
import '../ui/views/auth/splash/splash_view.dart';
import '../bindings/splash_binding.dart';
import '../ui/views/settings/general/settings_view.dart';
import '../ui/views/settings/notification/notification_settings_view.dart';
import '../ui/views/notifications/notifications_view.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const MainShellView(),
      binding: MainShellBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.NOTIFICATION_SETTINGS,
      page: () => const NotificationSettingsView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => const NotificationsView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.AUDIO_JOURNAL,
      page: () => const AudioView(),
      binding: AudioBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.JOURNAL,
      page: () => const JournalView(),
      transition: Transition.cupertino,
    ),
  ];
}

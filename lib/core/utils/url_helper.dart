import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  /// Launches the given [urlString] in an external application (like default browser).
  /// Shows a standard snackbar if launching fails.
  static Future<void> launchURL(String urlString, {LaunchMode mode = LaunchMode.externalApplication}) async {
    try {
      final Uri url = Uri.parse(urlString);
      final bool launched = await launchUrl(url, mode: mode);
      if (!launched) {
        Get.snackbar(
          'Error',
          'Could not launch address: $urlString',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Invalid address or launcher error',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

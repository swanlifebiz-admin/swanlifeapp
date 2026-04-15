import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swanlife/app/controllers/main_shell_controller.dart';
import 'package:swanlife/app/ui/views/audio/audio_view.dart';
import 'package:swanlife/app/ui/views/home/home_view.dart';
import 'package:swanlife/app/ui/views/journal/journal_view.dart';
import 'package:swanlife/app/ui/views/profile/profile_view.dart';
import 'package:swanlife/app/ui/widgets/app_nav_bar.dart';

class MainShellView extends GetView<MainShellController> {
  const MainShellView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            IndexedStack(
              index: controller.currentIndex.value,
              children: const [
                HomeView(),
                JournalView(),
                AudioView(),
                ProfileView(),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: AppNavBar(
                currentIndex: controller.currentIndex.value,
                onTap: controller.changePage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

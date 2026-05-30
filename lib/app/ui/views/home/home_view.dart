import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swanlife/app/controllers/home_controller.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/app/ui/views/home/components/home_featured_guide_card.dart';
import 'package:swanlife/app/ui/views/home/components/home_greeting_section.dart';
import 'package:swanlife/app/models/home_guide_item.dart';
import 'package:swanlife/app/ui/views/home/components/home_guides_carousel.dart';
import 'package:swanlife/app/ui/views/home/components/home_healing_journaling_section.dart';
import 'package:swanlife/app/ui/views/home/components/home_hero_card.dart';
import 'package:swanlife/app/ui/views/home/components/home_lifestyle_living_section.dart';
import 'package:swanlife/app/ui/views/home/components/home_logo_row.dart';
import 'package:swanlife/app/ui/views/home/components/home_section_header.dart';
import 'package:swanlife/app/ui/views/home/components/home_shop_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              HomeLogoRow(avatarImageUrl: controller.avatarImageUrl),
              const HomeGreetingSection(),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const HomeHeroCard(),
              ),
              SizedBox(height: 24.h),
              HomeHealingJournalingSection(
                onOpenJournal: controller.onOpenJournal,
              ),
              SizedBox(height: 20.h),
              const HomeFeaturedGuideCard(),
              SizedBox(height: 24.h),
              HomeShopSection(onLetsGo: controller.onShopLetsGo),
              SizedBox(height: 24.h),
              HomeLifestyleLivingSection(onStart: controller.onLifestyleStart),
              SizedBox(height: 24.h),
              const HomeSectionHeader(title: 'SwanLife Guides'),
              SizedBox(height: 10.h),
              HomeGuidesCarousel(items: HomeGuideItems),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}

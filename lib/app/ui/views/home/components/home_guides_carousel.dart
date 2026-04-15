import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/models/home_guide_item.dart';

class HomeGuidesCarousel extends StatefulWidget {
  const HomeGuidesCarousel({super.key, required this.items});

  final List<HomeGuideItem> items;

  @override
  State<HomeGuidesCarousel> createState() => _HomeGuidesCarouselState();
}

class _HomeGuidesCarouselState extends State<HomeGuidesCarousel> {
  late final PageController _pageController;
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.60);
    _pageController.addListener(() {
      if (!_pageController.hasClients) return;
      setState(() {
        _page = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: PageView.builder(
        controller: _pageController,
        padEnds: false,
        itemCount: widget.items.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final activeIndex = _page.round().clamp(0, widget.items.length - 1);
          final isActive = index == activeIndex;

          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 20.w : 6.w,
                right:  6.w,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOut,
                width:  300.w,
                height: isActive ? 260.h : 235.h,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                margin: EdgeInsets.symmetric(
                  vertical: isActive ? 0 : 15.h,
                  horizontal: isActive ? 0 : 5.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: isActive ? 0.09 : 0.07,
                      ),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7.r),
                      child: Image.network(
                        item.imageUrl,
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: 170,
                            color: const Color(0xFFE9E2E0),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      item.category.toUpperCase(),
                      style: GoogleFonts.manrope(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        color: const Color(0xFF735C00),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.notoSerif(
                        fontSize: isActive ? 15.sp : 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF2B2B2B),
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

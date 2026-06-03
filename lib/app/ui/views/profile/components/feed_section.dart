import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/models/feed_item_model.dart';
import 'package:swanlife/app/ui/theme/app_colors.dart';
import 'package:swanlife/core/utils/url_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedSection extends StatelessWidget {
  final RxList<FeedItemModel> feedItems;
  final double horizontalPadding;

  const FeedSection({
    super.key,
    required this.feedItems,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            'Swan Life Feed',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 19.sp,
              fontWeight: FontWeight.w600,
              color: scheme.onSurface,
            ),
          ),
        ),
        SizedBox(height: 14.h),
        SizedBox(
          height: 390.h,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: feedItems.length,
              itemBuilder: (context, index) {
                final item = feedItems[index];
                return GestureDetector(
                  onTap: () {
                    if (item.videoUrl != null) {
                      UrlHelper.launchURL(
                        item.videoUrl!,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                  child: Container(
                    width: 220.w,
                    margin: EdgeInsets.only(
                      right: 10.w,
                      left: 10.w,
                      bottom: 0.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18.r),
                          child: Image.network(
                            item.imageUrl,
                            width: 220.w,
                            height: 300.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 220.w,
                                height: 300.h,
                                color: scheme.surfaceContainerHighest,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.image_outlined,
                                  color: scheme.onSurfaceVariant,
                                  size: 26.sp,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          item.category,
                          style: GoogleFonts.manrope(
                            fontSize: 10.sp,
                            letterSpacing: 1.2,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.notoSerif(
                            fontSize: 19.sp,
                            color: scheme.onSurface,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

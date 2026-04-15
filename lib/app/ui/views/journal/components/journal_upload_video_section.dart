import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_attachment_tile.dart';
import 'package:swanlife/app/ui/views/journal/components/journal_upload_card.dart';

class JournalUploadVideoSection extends StatelessWidget {
  const JournalUploadVideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 25.h),
      decoration: BoxDecoration(
        color: const Color(0xFFfcedf2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'UPLOAD VIDEO',
            style: GoogleFonts.manrope(
              fontSize: 12.sp,
              letterSpacing: 1.8,
              color: const Color(0xFF856B22),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          JournalUploadCard(onTap: () {}),
          SizedBox(height: 10.h),
          const JournalAttachmentTile(
            icon: Icons.mic_none_rounded,
            title: 'Audio Note',
            subtitle: 'Record A Quick Thought',
          ),
          SizedBox(height: 8.h),
          const JournalAttachmentTile(
            icon: Icons.image_outlined,
            title: 'Journal Entries',
            subtitle: 'Add Your Thoughts',
          ),
        ],
      ),
    );
  }
}

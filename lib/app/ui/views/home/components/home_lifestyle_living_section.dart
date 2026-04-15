import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLifestyleLivingSection extends StatelessWidget {
  const HomeLifestyleLivingSection({super.key, required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child:  GestureDetector(
        onTap: (){},
        child: Image.asset("assets/images/card3.png")),

    );
  }
}

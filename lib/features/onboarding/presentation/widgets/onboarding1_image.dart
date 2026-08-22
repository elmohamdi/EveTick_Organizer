import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding1Image extends StatelessWidget {
  const Onboarding1Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 131.h),
      child: Stack(
        children: [
          
          SizedBox(
            width: double.infinity,
            height: 550.h,
            child: Image.asset(
              'assets/images/onboarding_image1.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

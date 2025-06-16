import 'package:creaftmyplate/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareWithFriendsCard extends StatelessWidget {
  const ShareWithFriendsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkOlive,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.only(left: 16.w, top: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get the gang’s opinion! ",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Share the menu link with your fam or friends & decide ",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 110.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 4,
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.w, vertical: 10.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Icon.png',
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Share',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: AppColors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),

          // Right Image
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Image.asset(
              'assets/images/shear.png',
              width: 150.w,
              height: 150.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:creaftmyplate/utils/app_color.dart';

class DeliveryBoxCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String imagePath;
  final double imageHeight;
  final double imageWidth;

  const DeliveryBoxCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.imagePath,
    this.imageHeight = 180,
    this.imageWidth = double.infinity, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.lightGreyBackground,
        ),
        child: Padding(
          padding:  EdgeInsets.all(12.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),

              if (subtitle != null)
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.gery,
                    fontWeight: FontWeight.w400,
                  ),
                ),

              const Gap(16),

              Image.asset(
                imagePath,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

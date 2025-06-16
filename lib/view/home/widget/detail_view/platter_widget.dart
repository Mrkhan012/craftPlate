import 'package:creaftmyplate/utils/app_color.dart';
import 'package:creaftmyplate/view/home/widget/detail_view/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirthdayPlatterCard extends StatelessWidget {
  const BirthdayPlatterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top section with image, title and view menu
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/dish.png",
                    width: 50.w,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abhi’s Birthday Platter",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: AppColors.white,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16.r),
                                ),
                              ),
                              isScrollControlled: true,
                              builder: (_) => const MenuBottomSheet(),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "View Menu",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.deepPurple,
                                ),
                              ),
                              Icon(
                                CupertinoIcons.right_chevron,
                                size: 16.sp,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),

            // Event & Guest Count
            Padding(
              padding:
                  EdgeInsets.only(right: 80.w, top: 12.h, left: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoColumn(title: "Event", value: "Birthday"),
                  _InfoColumn(title: "Guest count", value: "120 (30 Veg)"),
                ],
              ),
            ),

            // Date & Date (you can change second title if needed)
            Padding(
              padding:
                  EdgeInsets.only(right: 80.w, top: 12.h, left: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoColumn(title: "Date", value: "05/06/2025"),
                  _InfoColumn(title: "Date", value: "05/06/2025"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String title;
  final String value;

  const _InfoColumn({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.gery,
          ),
        ),
      ],
    );
  }
}

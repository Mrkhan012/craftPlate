import 'package:creaftmyplate/utils/appcolor.dart';
import 'package:creaftmyplate/view/home/widget/custom_card.dart';
import 'package:creaftmyplate/view/home/widget/top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Get.height;
    final screenWidth = Get.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopSection(),
                  const Gap(8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DeliveryBoxCard(
                        title: "Delivery Box",
                        subtitle: "10 - 150 guests",
                        imagePath: "assets/images/product.png",
                        imageHeight: screenHeight * 0.24,
                        imageWidth: screenWidth * 0.4,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 140.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.lightGreyBackground,
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Meal Boxr",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Gap(8.h),
                                      Text(
                                        "10 to 1500+ guests",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.gery,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Image.asset(
                                    "assets/images/meal.png",
                                    width: 60.w,
                                    height: 60.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(8),
                          Container(
                            height: 140.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.lightGreyBackground,
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Meal Boxr",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Gap(8.h),
                                      Text(
                                        "10 to 1500+ guests",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.gery,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Image at bottom-right
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Image.asset(
                                    "assets/images/shif.png",
                                    width: 60.w,
                                    height: 80.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                // Black label at top-left
                                Positioned(
                                  bottom: 20,
                                  left: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0.r),
                                        bottomRight: Radius.circular(8.r),
                                      ),
                                    ),
                                    child: Text(
                                      "Exclusive",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      DeliveryBoxCard(
                        title: "Find My platter",
                        imagePath: "assets/images/shif.png",
                        imageHeight: screenHeight * 0.1,
                        imageWidth: screenWidth * 0.2,
                      ),
                      DeliveryBoxCard(
                        title: "Platter",
                        imagePath: "assets/images/shif.png",
                        imageHeight: screenHeight * 0.1,
                        imageWidth: screenWidth * 0.2,
                      ),
                      DeliveryBoxCard(
                        title: "Platter",
                        imagePath: "assets/images/shif.png",
                        imageHeight: screenHeight * 0.1,
                        imageWidth: screenWidth * 0.2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// Fixed footer
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Image.asset("assets/images/dish.png"),
                title: const Text(
                  "Birthday platter",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: const Text(
                  "#102026 · 40 guests",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.gery,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.overlayLightPink,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "20 Min",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

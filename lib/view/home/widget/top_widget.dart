// lib/views/top_section.dart
import 'package:creaftmyplate/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:creaftmyplate/controller/home_controller.dart';
import 'package:creaftmyplate/utils/appcolor.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final labels = controller.boxNames;
    final screenHeight = Get.height;

    return Container(
      height: screenHeight * 0.54,
      color: AppColors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
        child: Column(
          children: [
            // Top Row
            Row(
              children: [
                const Icon(Icons.location_on, color: AppColors.white),
                const Text(
                  "Hyderabad",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.richPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.headphones, color: AppColors.white),
                  ),
                )
              ],
            ),

            const Gap(8),

            // Box Tabs
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: labels.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return Obx(() {
                    final isSelected = controller.selectedIndex.value == index;
                    return GestureDetector(
                      onTap: () => controller.selectBox(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.semiTransparentPurple
                              : AppColors.deepPurpleAlternate,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.deepPurple),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          labels[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),

            const Gap(40),

            // Delivery Box UI
            Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(
                  top: 20,
                  right: 30,
                  child: Icon(Icons.star, color: Colors.white, size: 16),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  child: Icon(Icons.star, color: Colors.white, size: 18),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Exclusive Text with Divider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.white38,
                            thickness: 1,
                            indent: 20,
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          'Exclusive',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.8),
                            letterSpacing: 1,
                            shadows: [
                              Shadow(
                                color: Colors.white.withOpacity(0.5),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.white38,
                            thickness: 1,
                            indent: 10,
                            endIndent: 20,
                          ),
                        ),
                      ],
                    ),

                    const Gap(16),

                    Text(
                      'Delivery Box',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 36,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.white.withOpacity(0.3),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),

                    const Gap(20),

                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.second);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'ORDER NOW',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: AppColors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

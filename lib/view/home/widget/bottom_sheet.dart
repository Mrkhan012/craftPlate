import 'package:creaftmyplate/controller/home_controller.dart';
import 'package:creaftmyplate/utils/appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

int selectedTabIndex = 0;

class MenuBottomSheet extends StatefulWidget {
  const MenuBottomSheet({super.key});

  @override
  State<MenuBottomSheet> createState() => _MenuBottomSheetState();
}

class _MenuBottomSheetState extends State<MenuBottomSheet> {
  int selectedTabIndex = 0;
  int selectedSlotIndex = -1;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Handle bar
            Padding(
              padding: EdgeInsets.all(12.h),
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),

            // Tabs
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomTabSelector(
                onTabSelected: (index) {
                  setState(() => selectedTabIndex = index);
                },
              ),
            ),

            const Gap(12),

            if (selectedTabIndex == 0) ...[
              SizedBox(
                height: 100.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: 7,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    final date = DateTime.now().add(Duration(days: index));
                    final dayLabel = [
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat',
                      'Sun'
                    ][date.weekday - 1];
                    final dateNumber = date.day.toString().padLeft(2, '0');

                    return Obx(() {
                      final isSelected =
                          controller.selectedIndex.value == index;
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () => controller.selectBox(index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.overlayLightPink
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: AppColors.gery),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dateNumber,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    dayLabel,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(12),
                        ],
                      );
                    });
                  },
                ),
              ),

              const Gap(12),

              // Afternoon slot
              _buildSlotTile(
                index: 0,
                title: "Afternoon",
                subtitle: "12–02PM",
                trailing: "4 slots left",
                icon: Icons.sunny,
              ),

              const Gap(12),

              // Evening slot
              _buildSlotTile(
                index: 1,
                title: "Evening",
                subtitle: "06–08PM",
                trailing: "4 slots left",
                icon: Icons.nightlight,
              ),

              if (selectedSlotIndex != -1) ...[
                const Gap(12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SubTotalTile(),
                ),
                const Gap(20),
              ],
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selectedSlotIndex != -1
                        ? () {
                          }
                        : null, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedSlotIndex != -1
                          ? Colors.deepPurple
                          : Colors.grey.shade300,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: selectedSlotIndex != -1 ? 4 : 0,
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSlotTile({
    required int index,
    required String title,
    required String subtitle,
    required String trailing,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedSlotIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: selectedSlotIndex == index
                ? AppColors.overlayLightPink
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selectedSlotIndex == index
                  ? AppColors.deepPurple
                  : AppColors.gery,
              width: 1.5,
            ),
          ),
          child: ListTile(
            leading: Icon(
              icon,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
            trailing: Text(
              trailing,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubTotalTile extends StatefulWidget {
  const SubTotalTile({super.key});

  @override
  State<SubTotalTile> createState() => _SubTotalTileState();
}

class _SubTotalTileState extends State<SubTotalTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: const Text(
              "Sub total ₹30,000",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            subtitle: const Text(
              "Inclusive charges and taxes",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                isExpanded
                    ? CupertinoIcons.chevron_up
                    : CupertinoIcons.chevron_down,
              ),
              onPressed: () {
                setState(() => isExpanded = !isExpanded);
              },
            ),
          ),
          if (isExpanded) ...[
            const Divider(height: 0, thickness: 1, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  _rowItem("Plate price", "₹300"),
                  const SizedBox(height: 8),
                  _rowItem("No. of guests", "100"),
                  Divider(
                      height: 32, thickness: 1, color: Colors.grey.shade300),
                  _rowItem(
                    "Sub total",
                    "₹30,000",
                    isBold: true,
                    subText: "Excludes delivery charges and taxes",
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _rowItem(String label, String value,
      {bool isBold = false, String? subText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
        if (subText != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              subText,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
      ],
    );
  }
}

class CustomTabSelector extends StatefulWidget {
  final Function(int) onTabSelected;
  const CustomTabSelector({super.key, required this.onTabSelected});

  @override
  State<CustomTabSelector> createState() => _CustomTabSelectorState();
}

class _CustomTabSelectorState extends State<CustomTabSelector> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          _buildTab(
            index: 0,
            label: "Veg items",
            icon: Icons.crop_square,
            isSelected: selectedIndex == 0,
            selectedColor: Colors.green,
          ),
          _buildTab(
            index: 1,
            label: "Non Veg items",
            icon: Icons.change_history,
            isSelected: selectedIndex == 1,
            selectedColor: Colors.redAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required int index,
    required String label,
    required IconData icon,
    required bool isSelected,
    required Color selectedColor,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedIndex = index);
          widget.onTabSelected(index);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? selectedColor : Colors.grey,
                size: 18.sp,
              ),
              SizedBox(width: 6.w),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

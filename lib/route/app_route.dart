import 'package:creaftmyplate/view/home/detail_view.dart';
import 'package:creaftmyplate/view/home/home_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = '/';
  static const second = '/detail_view';

  static final routes = [
    GetPage(
      name: home,
      page: () => const HomeView(),
      transition: Transition.fadeIn, // Optional: Add animation on Home too
    ),
    GetPage(
      name: second,
      page: () => const DetailView(),
      transition: Transition.rightToLeft, // 👈 animation
      transitionDuration: const Duration(milliseconds: 400), // Optional
    ),
  ];
}

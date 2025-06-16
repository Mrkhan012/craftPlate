import 'package:creaftmyplate/view/home/detail_view.dart';
import 'package:creaftmyplate/view/home/home_view.dart';
import 'package:creaftmyplate/view/splash/splash_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const splash = '/';
    static const home = '/home_view';

  static const second = '/detail_view';

  static final routes = [
     GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn, 
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      transition: Transition.fadeIn, 
    ),
    GetPage(
      name: second,
      page: () => const DetailView(),
      transition: Transition.fadeIn, 
      transitionDuration: const Duration(milliseconds: 400), 
    ),
  ];
}

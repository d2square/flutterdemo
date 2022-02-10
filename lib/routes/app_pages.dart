import 'package:get/get.dart';
import 'package:helloworld/home_page/presentation/home_ui.dart';
import 'package:helloworld/home_page/presentation/stack_widget.dart';
import 'package:helloworld/splashScreen/presentation/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.defaultRoute;

  static final routes = [
    GetPage(name: Routes.defaultRoute, page: () => const SplashScreen()),
    GetPage(name: Routes.home, page: () => HomePage()),
    GetPage(name: Routes.stackDemo, page: () => const StackWidget())
  ];
}

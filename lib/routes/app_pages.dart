import 'package:get/get.dart';
import 'package:helloworld/home_page/applications/bindings/home_binding.dart';
import 'package:helloworld/home_page/presentation/home_ui.dart';
import 'package:helloworld/home_page/presentation/stack_widget.dart';
import 'package:helloworld/sign_up/application/bindings/sign_up_bindings.dart';
import 'package:helloworld/sign_up/presentation/sign_up_page.dart';
import 'package:helloworld/splashScreen/presentation/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.defaultRoute;

  static final routes = [
    GetPage(name: Routes.defaultRoute, page: () => const SplashScreen()),
    GetPage(name: Routes.home, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.stackDemo, page: () => const StackWidget()),
    GetPage(
        name: Routes.signup,
        page: () => const SignUpPage(),
        binding: SignUpBindings())
  ];
}

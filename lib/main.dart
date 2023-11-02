import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/app_route.dart';
import 'core/di_service/dependency_injection.dart' as di;

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 200),
      initialRoute: AppRoute.homeScreen,
      navigatorKey: Get.key,
      getPages: AppRoute.routes,
    );
  }
}
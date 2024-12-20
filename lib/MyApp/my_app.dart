import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:superhero_application/Routes/routes.dart';
import 'package:superhero_application/Views/HomePage/home_page.dart';
import 'package:superhero_application/Views/SplashScreen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(
        size.width,
        size.height,
      ),
      builder: (context, _) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          getPages: Routes.myRoutes,
        );
      },
    );
  }
}

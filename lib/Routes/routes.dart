import 'package:get/get.dart';
import 'package:superhero_application/Views/DetailsPage/details_page.dart';
import 'package:superhero_application/Views/FavouritesPage/favourites_page.dart';
import 'package:superhero_application/Views/HomePage/home_page.dart';
import 'package:superhero_application/Views/SplashScreen/splash_screen.dart';

class Routes {
  static String splashScreen = '/';
  static String homePage = '/home';
  static String detailsPage = '/details';
  static String favouritesPage = '/favourites';

  static List<GetPage> myRoutes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/details',
      page: () => const DetailsPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/favourites',
      page: () => const FavouritesPage(),
      transition: Transition.cupertino,
    ),
  ];
}

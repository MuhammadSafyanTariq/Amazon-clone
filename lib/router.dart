import 'package:amazon_clone/Commons/Widgets/bottom_bar.dart';
import 'package:amazon_clone/features/Admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/Auth/Screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screens.dart';
import 'package:amazon_clone/features/home/screens/home_screens.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case CategoryScreensDeal.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryScreensDeal(
          category: category,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('This page does not exist...'),
          ),
        ),
      );
  }
}

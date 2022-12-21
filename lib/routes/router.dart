import 'package:amazon_clone_flutter/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_flutter/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone_flutter/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_flutter/features/home/screens/home_screen.dart';
import 'package:amazon_clone_flutter/widgets/custom_text.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductScreen(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(child: CustomText(text: "Screen Does not exist")),
              ));
  }
}

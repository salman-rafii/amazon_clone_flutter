import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

import 'routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      onGenerateRoute: (settings) => generateRoute(settings),
      theme: ThemeData(
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          scaffoldBackgroundColor: GlobalVariables.greyBackgroundCOlor,
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
      home: const AuthScreen(),
    );
  }
}

import 'package:amazon_clone_flutter/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "App Bar"),
      ),
      body: Center(
          child: Column(
        children: [
          const CustomText(text: "Home Page Screen"),
          ElevatedButton(
              onPressed: () {}, child: const CustomText(text: "Test button"))
        ],
      )),
    );
  }
}

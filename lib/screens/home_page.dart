import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APp Bar"),
      ),
      body: Center(
          child: Column(
        children: [
          const Text("Home Page Screen"),
          ElevatedButton(onPressed: () {}, child: const Text("Test button"))
        ],
      )),
    );
  }
}

import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const Center(
        child: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 29, 201, 192),
        onPressed: () {},
        tooltip: "Add Products",
        child: const Icon(Icons.add),
      ),
    );
  }
}

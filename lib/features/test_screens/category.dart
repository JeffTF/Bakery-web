import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hsu_bakery/constants/color.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.c3PrimaryColor,
      appBar: AppBar(
        title: const Text('Category Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to the Home screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/details'),
              child: const Text('Go to the detail screen'),
            ),
          ],
        ),
      ),
    );
  }
}

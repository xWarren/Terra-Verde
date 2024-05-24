import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Expanded(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return const Column(
                children: [
                  Text("Hello")
                ],
              );
            },
          ),
         )
        ],
      ),
    );
  }
}
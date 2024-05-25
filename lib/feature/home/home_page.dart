import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
         Expanded(
          child: ListView.builder(
            itemCount: 50,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text("Hello $index")
                ],
              );
            },
          ),
         ),
         const Text("Hello")
        ],
      ),
    );
  }
}
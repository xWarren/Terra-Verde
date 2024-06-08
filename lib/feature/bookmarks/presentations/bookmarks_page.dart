import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bookmarks_controller.dart';

class BookmarksPage extends GetView<BookmarksController> {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Bookmark Page"
            ),
          )
        ],
      ),
    );
  }
}
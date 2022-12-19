// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/controllers/view_controller.dart';

class ControlScreen extends StatelessWidget {
  ControlScreen({super.key});

  final ViewController controller = Get.put(ViewController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      (() => Scaffold(
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: controller.items,
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.currentIndex.value = index;
            },
            backgroundColor: Colors.grey.shade200,
          ))),
    ));
  }
}

import 'package:food_rating/food_add_page/food_add_view.dart';
import 'package:food_rating/food_home_page/food_home_view.dart';
import 'package:food_rating/food_setting_page/food_set_view.dart';
import 'package:food_rating/food_tab_page/food_tab_logic.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class FoodTabView extends GetView<FoodTabLogic> {
  const FoodTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.activeIndex.value,
            children: [
              FoodHomeView(),
              const FoodSettingView(),
            ],
          )),
      bottomNavigationBar: _bottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/rateAdd');
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 36,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _bottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: <Widget>[
        Obx(() => IconButton(
            onPressed: () {
              controller.changeActive(0);
            },
            icon: Icon(
              Icons.home,
              color: controller.activeIndex.value == 0
                  ? Colors.blue
                  : Colors.black,
              size: 32,
            ))),
        const SizedBox(
          width: 40,
        ),
        Obx(() => IconButton(
            onPressed: () {
              controller.changeActive(1);
            },
            icon: Icon(
              Icons.settings,
              color: controller.activeIndex.value == 1
                  ? Colors.blue
                  : Colors.black,
              size: 32,
            ))),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_rating/food_setting_page/food_set_logic.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class FoodSettingView extends GetView<FoodSettingLogic> {
  const FoodSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Setting",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: <Widget>[
                SizedBox(
                  height: 46,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: (){
                        controller.foodService.cleanData();
                      },
                      child: const Text("Clean all record"),
                    ),
                  )
                ),
                const Divider(),
                <Widget>[
                  const Text("About us"),
                  const Text("1.0.0")
                ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            ).decorated(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
            ),
          ),
        ));
  }
}

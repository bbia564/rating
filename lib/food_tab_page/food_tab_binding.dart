import 'package:food_rating/food_add_page/food_add_logic.dart';
import 'package:food_rating/food_home_page/food_home_logic.dart';
import 'package:food_rating/food_setting_page/food_set_logic.dart';
import 'package:food_rating/food_tab_page/food_tab_logic.dart';
import 'package:get/get.dart';

class FoodTabBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FoodTabLogic());
    Get.lazyPut(() => FoodHomeLogic());
    Get.lazyPut(() => FoodAddLogic());
    Get.lazyPut(() => FoodSettingLogic());
  }
}
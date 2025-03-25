import 'package:food_rating/food_setting_page/food_set_logic.dart';
import 'package:get/get.dart';

class FoodSettingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FoodSettingLogic());
  }

}
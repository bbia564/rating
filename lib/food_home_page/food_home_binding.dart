import 'package:food_rating/food_home_page/food_home_logic.dart';
import 'package:get/get.dart';

class FoodHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FoodHomeLogic());
  }
}
import 'package:food_rating/food_add_page/food_add_logic.dart';
import 'package:get/get.dart';

class FoodAddBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FoodAddLogic());
  }
}
import 'package:get/get.dart';

import 'food_eval_logic.dart';

class FoodEvalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}

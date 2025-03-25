import 'package:food_rating/db_base/db_methods.dart';
import 'package:get/get.dart';

class FoodHomeLogic extends GetxController{
  final FoodDatabaseService foodService = Get.find();
  var topActive = 0.obs;

  @override void onInit() {
    // TODO: implement onInit
    super.onInit();
    foodService.reloadList(999);
  }
  void updateTop(int index){
    topActive.value = index;
    switch(index){
      case 0:
        foodService.reloadList(999);
      case 1:
        foodService.reloadList(0);
      case 2:
        foodService.reloadList(1);
    }
  }
}
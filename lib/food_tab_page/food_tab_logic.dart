import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FoodTabLogic extends GetxController{
  final PageController pageController = PageController();
  var activeIndex = 0.obs;

  void changeActive(int index){
    activeIndex.value = index;
  }
}
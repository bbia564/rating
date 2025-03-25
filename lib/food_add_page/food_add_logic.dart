import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_rating/db_base/db_engin.dart';
import 'package:food_rating/db_base/db_methods.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class FoodAddLogic extends GetxController {
  final FoodDatabaseService foodService = Get.find();
  final TextEditingController wordController = TextEditingController();
  final TextEditingController selectDateread = TextEditingController();
  Rx<DateTime?> selectedDate = Rx<DateTime>(DateTime.now());
  final FocusNode focusNode = FocusNode();
  var rateType = 0.obs;
  double rateNumber = 0.0;
  Uint8List? imageBytes;

  @override
  void onInit() {
    super.onInit();
    listenDateFocus();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageBytes = await image.readAsBytes();
      update();
    }
  }

  void cleanImage() {
    imageBytes = null;
    update();
  }

  void updateType(int index) {
    rateType.value = index;
    update();
  }

  void updateRatenumber(double rate) {
    rateNumber = rate;
  }

  void listenDateFocus() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        selectDate();
      }
    });
  }

  Future<void> selectDate() async {
    final DateTime? piked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (piked != null && piked != selectedDate.value) {
      selectedDate.value = piked;
      selectDateread.text = "${piked.month}/${piked.day}/${piked.year}";
      update();
    }
    FocusScope.of(Get.context!).unfocus();
  }

  void clean(){
    imageBytes = null;
    selectedDate.value = DateTime.now();
    wordController.clear();
    selectDateread.clear();
    rateType = 0.obs;
    rateNumber = 0.0;
  }

  void addRecord() async {
    if (imageBytes != null &&
        wordController.text != '' &&
        rateNumber != 0.0 &&
        selectDateread.text != '') {
      final newData = Food(
          id: 0,
          imageBytes: imageBytes!,
          source: wordController.text,
          rate: rateNumber,
          type: rateType.value,
          date: selectedDate.value!);
      await foodService.addRecord(newData);
      clean();
      Get.back();
      Fluttertoast.showToast(
          msg: "Add record successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  void dispose() {
    selectDateread.dispose();
    focusNode.dispose();
    super.dispose();
  }
}

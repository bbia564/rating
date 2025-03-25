import 'package:food_rating/food_add_page/food_add_logic.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:styled_widget/styled_widget.dart';

class FoodAddView extends GetView<FoodAddLogic> {
  const FoodAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: GetBuilder<FoodAddLogic>(
          init: FoodAddLogic(),
          builder: (_) {
            return SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: <Widget>[
                    const Text(
                      "Food Pictures",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    controller.imageBytes == null
                        ? InkWell(
                            onTap: () {
                              controller.pickImage();
                            },
                            child: const SizedBox(
                              width: 150,
                              height: 150,
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              ),
                            ).decorated(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey[200]),
                          )
                        : <Widget>[
                            Image.memory(
                              width: 150,
                              height: 150,
                              controller.imageBytes!,
                              fit: BoxFit.cover,
                            ).clipRRect(all: 16),
                            const SizedBox(
                              width: 16,
                            ),
                            IconButton(
                                onPressed: () {
                                  controller.cleanImage();
                                }, icon: const Icon(Icons.delete)),
                          ].toRow(),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Evaluate",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Center(
                          child: TextField(
                            controller: controller.wordController,
                            style: const TextStyle(fontSize: 14, height: 1),
                            decoration: const InputDecoration(
                                hintText: "Please enter a review",
                                hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                        )).decorated(
                      border: Border(
                        top: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        left: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        right: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Type",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: <Widget>[
                        InkWell(
                          onTap: () {
                            controller.updateType(0);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 12, bottom: 12),
                            child: Image.asset(
                              'assets/icon0.webp',
                              width: 24,
                              height: 24,
                            ),
                          ).decorated(
                              borderRadius: BorderRadius.circular(4),
                              border: Border(
                                top: BorderSide(
                                    color: controller.rateType.value == 0
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 2),
                                left: BorderSide(
                                    color: controller.rateType.value == 0
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 2),
                                bottom: BorderSide(
                                    color: controller.rateType.value == 0
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 2),
                                right: BorderSide(
                                    color: controller.rateType.value == 0
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 2),
                              )),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () {
                            controller.updateType(1);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 12, bottom: 12),
                            child: Image.asset(
                              'assets/icon3.webp',
                              width: 24,
                              height: 24,
                            ),
                          ).decorated(
                              borderRadius: BorderRadius.circular(4),
                              border: Border(
                                top: BorderSide(
                                    color: controller.rateType.value == 1
                                        ? Colors.red
                                        : Colors.grey,
                                    width: 2),
                                left: BorderSide(
                                    color: controller.rateType.value == 1
                                        ? Colors.red
                                        : Colors.grey,
                                    width: 2),
                                bottom: BorderSide(
                                    color: controller.rateType.value == 1
                                        ? Colors.red
                                        : Colors.grey,
                                    width: 2),
                                right: BorderSide(
                                    color: controller.rateType.value == 1
                                        ? Colors.red
                                        : Colors.grey,
                                    width: 2),
                              )),
                        ),
                      ].toRow(),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Score",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SimpleStarRating(
                      allowHalfRating: true,
                      starCount: 5,
                      rating: controller.rateNumber,
                      size: 22,
                      isReadOnly: false,
                      onRated: (rate) {
                        controller.updateRatenumber(rate!);
                      },
                      spacing: 10,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Date",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Center(
                          child: TextField(
                            controller: controller.selectDateread,
                            focusNode: controller.focusNode,
                            style: const TextStyle(fontSize: 14, height: 1),
                            readOnly: true,
                            decoration: const InputDecoration(
                                hintText: "Please select a date",
                                hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                        )).decorated(
                      border: Border(
                        top: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        left: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        right: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.addRecord();
                          },
                          child: const Text("Submit")),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
              ),
            ));
          }),
    );
  }
}

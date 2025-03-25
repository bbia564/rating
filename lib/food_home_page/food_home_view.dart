import 'package:food_rating/food_home_page/food_home_logic.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class FoodHomeView extends GetView<FoodHomeLogic> {
  FoodHomeView({super.key});

  static final List<String> topMenu = ['All', 'High', 'Bad'];
  static final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child: <Widget>[
              const Text(
                "Evaluation",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Text(
                "${now.month > 9 ? now.month : '0${now.month}'}/${now.day > 9 ? now.day : '0${now.day}'}/${now.year}",
                style: TextStyle(color: Colors.grey[500], fontSize: 14),
              )
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          ),
        ),
        body: SafeArea(
          child: <Widget>[
            _topTab(),
            const SizedBox(
              height: 8,
            ),
            _dataList(),
          ].toColumn(),
        ));
  }

  Widget _topTab() {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.all(12),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Obx(() => SizedBox(
                        width: 60,
                        height: 35,
                        child: InkWell(
                          onTap: () {
                            controller.updateTop(index);
                          },
                          child: Center(
                            child: Text(
                              topMenu[index],
                              style: TextStyle(
                                  color: controller.topActive.value == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ))
                    .decorated(
                        color: controller.topActive.value == index
                            ? Colors.blue
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                      const BoxShadow(
                          color: Color(0xFFBDBDBD),
                          offset: Offset(0.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 0)
                    ]));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 20);
          },
          itemCount: topMenu.length),
    );
  }

  Widget _dataList() {
    return Obx((){
      if (controller.foodService.food.isEmpty) {
        return const Expanded(
            child: Center(
              child: Text("No more"),
            ));
      }
      return Expanded(
        child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemBuilder: (BuildContext context, int index) {
              final item = controller.foodService.food[index];
              return Container(
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  Image.memory(
                    item.imageBytes,
                    height: double.infinity,
                    width: 130,
                    fit: BoxFit.cover,
                  ).clipRRect(all: 8),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Container(
                        child: <Widget>[
                          Text(item.source,maxLines: 5,overflow: TextOverflow.ellipsis,),
                          const SizedBox(
                            height: 12,
                          ),
                          <Widget>[
                            Text(
                              "${item.date.month}/${item.date.day}/${item.date.year}",
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(width: 16),
                            Image.asset(
                              'assets/icon${item.type == 0 ? '0' : '3'}.webp',
                              width: 20,
                              height: 20,
                            ),
                          ].toRow(),
                          const SizedBox(
                            height: 12,
                          ),
                          SimpleStarRating(
                            allowHalfRating: true,
                            starCount: 5,
                            rating: item.rate,
                            size: 20,
                            spacing: 10,
                          )
                        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                      ))
                ].toRow(),
              ).decorated(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFFBDBDBD).withOpacity(1),
                        offset: const Offset(0.0, 0.6),
                        blurRadius: 6.0,
                        spreadRadius: 0)
                  ]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 18);
            },
            itemCount: controller.foodService.food.length),
      );
    });
  }
}

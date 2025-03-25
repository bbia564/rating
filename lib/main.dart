import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_rating/db_base/db_methods.dart';
import 'package:food_rating/food_add_page/food_add_binding.dart';
import 'package:food_rating/food_add_page/food_add_view.dart';
import 'package:food_rating/food_home_page/food_home_binding.dart';
import 'package:food_rating/food_home_page/food_home_view.dart';
import 'package:food_rating/food_setting_page/food_set_binding.dart';
import 'package:food_rating/food_setting_page/food_set_view.dart';
import 'package:food_rating/food_tab_page/food_tab_binding.dart';
import 'package:food_rating/food_tab_page/food_tab_view.dart';
import 'package:get/get.dart';

import 'db_base/db_init.dart';
import 'food_eval_cord/food_eval_binding.dart';
import 'food_eval_cord/food_eval_view.dart';
import 'not_found/not_found_binding.dart';
import 'not_found/not_found_view.dart';

void main() async {
  Get.put(FoodDatabaseService());
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: Foods,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
    );
  }
}

List<GetPage<dynamic>> Foods = [
  GetPage(name: '/', page: () => const FoodEvalView(),binding: FoodEvalBinding()),
  GetPage(name: '/rateTab', page: () => const FoodTabView(),binding: FoodTabBinding()),
  GetPage(name: '/rateHome', page: () => FoodHomeView(),binding: FoodHomeBinding()),
  GetPage(name: '/rateAdd', page: () => const FoodAddView(),binding: FoodAddBinding()),
  GetPage(name: '/rateEval', page: () => const DbInit()),
  GetPage(name: '/rateSet', page: () => const FoodSettingView(),binding: FoodSettingBinding()),
  GetPage(name: '/notFound', page: () => const NotFoundView(),binding: NotFoundBinding()),
];

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import './db_engin.dart';

class FoodDatabaseService extends GetxService {
  static const _databaseName = 'food.db';
  static const _databaseVersion = 1;
  static const table = 'food';
  static const columnId = 'id';
  static const columnImageBytes = 'imageBytes';
  static const columSource = 'source';
  static const columnRate = 'rate';
  static const columnType = 'type';
  static const columnDate = 'date';

  static final FoodDatabaseService _instance = FoodDatabaseService._internal();

  factory FoodDatabaseService() => _instance;

  FoodDatabaseService._internal();

  late Database _database;
  final RxList<Food> food = <Food>[].obs;

  Future<Database> get database async {
    _database = await _initDataBase();
    return _database;
  }

  Future<Database> _initDataBase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table(
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnImageBytes BLOB NOT NULL,
        $columnRate REAL NOT NULL,
        $columSource TEXT NOT NULL,
        $columnType INTEGER NOT NULL,
        $columnDate TEXT NOT NULL,
        UNIQUE($columnDate) ON CONFLICT REPLACE
      )
    ''');
  }

  Future<int> addRecord(Food food) async {
    Database db = await database;
    var result =
        await db.rawQuery('SELECT MAX($columnId) as maxId FROM $table');
    int? maxId = result.first['maxId'] as int?;
    int newId = (maxId ?? 0) + 1;
    Food newFood = Food(
        id: newId,
        imageBytes: food.imageBytes,
        source: food.source,
        rate: food.rate,
        type: food.type,
        date: food.date);
    int insertedId = await db.insert(table, newFood.toMap());
    await reloadList(999);
    return insertedId;
  }

  Future<List<Food>> getAllRecord(int type) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = type == 999
        ? await db.query(table)
        : await db.query(table, where: 'type = ?', whereArgs: [type]);
    return List.generate(maps.length, (int index) {
      return Food.formMap(maps[index]);
    });
  }

  void cleanData() async {
    Database db = await database;
    await db.delete(table);
    await reloadList(999);
    Fluttertoast.showToast(
        msg: "Clear record successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  Future<int> deleteLease(int id) async {
    Database db = await database;
    int deleteRows =
    await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
    await reloadList(999);
    return deleteRows;
  }

  Future<void> reloadList(int type) async {
    food.value = await getAllRecord(type);
  }
}

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:project/models/base64_img.dart';
import 'package:sqflite/sqflite.dart';
import 'package:project/utilities/constants.dart' as Constants;

class DataBaseHelper {
  static DataBaseHelper _dataBaseHelper; // singleton object

  DataBaseHelper._createInstance();

  factory DataBaseHelper() {
    if (_dataBaseHelper == null) {
      _dataBaseHelper = DataBaseHelper._createInstance();
    }
    return _dataBaseHelper;
  }

  Database _database; // singleton

  get database async {
    if (_database == null) {
      _database = await initalizeDatabase();
    }
    return _database;
  }

  Future<Database> initalizeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + Constants.DATABASE_PATH;
    return await openDatabase(path, version: 1, onCreate: _create);
  }

  _create(Database database, int version) async {
    return await database.execute(Constants.CREATE_TABLE);
  }

  Future<int> insert(Base64Image base64image) async {
    Database database = await this.database;
    var results = database.insert(Constants.TABLE_NAME, base64image.toMap());
    return results;
  }

  Future<List<Map<String, dynamic>>> getDatainMaps() async {
    Database database = await this.database;
    return database.query(Constants.TABLE_NAME);
  }

  Future<List<Base64Image>> getModelsFromMapList() async {
    List<Map<String, dynamic>> mapList = await getDatainMaps();

    List<Base64Image> lessonListModel = List();

    for (int i = 0; i < mapList.length; i++) {
      lessonListModel.add(Base64Image.fromMap(mapList[i]));
    }

    return lessonListModel;
  }

  Future<int> truncate() async {
    Database database = await this.database;
    return database.delete(Constants.TABLE_NAME);
  }
}

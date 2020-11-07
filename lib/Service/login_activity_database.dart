

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LoginActivityDatabase {

  final String _databaseName = 'LoginActivity.db';
  final int _databaseVersion = 1;
  static final String tableName = 'Activiy';
  static final columnID = '_id';
  static final columnName = 'status';
  static final columnName1 = 'user_uid';
  static final columnName2 = 'role';

  LoginActivityDatabase._instance();

  static final LoginActivityDatabase instance = LoginActivityDatabase._instance();
  static Database _database;

  Future<Database> get database async{

    if(_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async{
    await db.execute(
      '''
        CREATE TABLE $tableName (
        $columnName1 STRING NOT NULL,
        $columnName2 STRING NOT NULL
        )
      '''
    );
  }


  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }


  Future<int> delete(String uid) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: '$columnName1 = ?', whereArgs: [uid]);
  }


  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(tableName);
  }


  Future<Map<String, dynamic>> checkUserStatus() async{
    List<Map<String, dynamic>> _activityData = await queryAllRows();
    print('---------------------$_activityData');
    if(_activityData.length == 0) {
      return {
        'status': false,
        'uid': null,
      };
    }
    return {
      'status': true,
      'uid': _activityData[0][columnName1],
      'role': _activityData[0][columnName2],
    };
  }

}
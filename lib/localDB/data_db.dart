import 'dart:io';
import 'package:employee_data_collector/localDB/fields/employee_fields.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/employee_model.dart';
part 'employee_db.dart';

class DataDb {
  static final DataDb instance = DataDb._init();
  static Database? _database;

  DataDb._init();

  static const String _dbName = 'dbEmp1';

  Future<Database> get database async {
    _database ??= await _initDB(_dbName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final Path = join(dbPath, filePath);

    return await openDatabase(Path, version: 7, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    // const integerType = 'INTEGER NOT NULL';
    // const doubleType = 'REAL';

    await db.execute('''
      CREATE TABLE ${EmployeeFields.TABLE_NAME}(
        ${EmployeeFields.empId} $idType,
        ${EmployeeFields.empName} $textType,
        ${EmployeeFields.empGender} $textType,
        ${EmployeeFields.empDob} $textType
      )
''');
  }

  static Future<void> deleteDatabaseFile() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    // return await openDatabase(Path, version: 7, onCreate: _createDB);
    // Get the directory where the database file is stored

    // Check if the database file exists
    if (await File(path).exists()) {
      // Delete the database file
      await deleteDatabase(path);
      _database = null;
      print('--__-- Database file deleted successfully');
    } else {
      print('--__-- Database file does not exist');
    }
  }
}

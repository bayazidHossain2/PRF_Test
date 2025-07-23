part of 'data_db.dart';


class EmployeeDb {
  static final EmployeeDb instance = EmployeeDb();

//----------------------Samity-----------------------------
  Future<bool> createAllEmployee(List<EmployeeModel> empList) async {
    final db = await DataDb.instance.database;
    await db.delete(EmployeeFields.TABLE_NAME);
    try {
      for (int i = 0; i < empList.length; i++) {
        await db.insert(
            EmployeeFields.TABLE_NAME, empList[i].toJson());
      }
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> createEmployee(EmployeeModel emp) async {
    final db = await DataDb.instance.database;
    await db.delete(EmployeeFields.TABLE_NAME);
    try {
      await db.insert(
          EmployeeFields.TABLE_NAME, emp.toJson());
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<List<EmployeeModel>> readAllEmployee() async {
    final db = await DataDb.instance.database;

    // final orderBy = '${DirectoryFields.name} DESC';
    // print('(((((((((((((Order asc)))))))))))))');
    final maps = await db.query(
      EmployeeFields.TABLE_NAME,
      columns: EmployeeFields.values,
      // where: '${EmployeeFields.samityStatus} = ?',
      // whereArgs: ['A'],
    );
    if (maps.isNotEmpty) {
      List<EmployeeModel> empList = [];
      // print('-------------len of samity local db ${maps.length}');
      for (int i = 0; i < maps.length; i++) {
        // print(maps[i]);
        empList.add(EmployeeModel.fromJson(maps[i]));
      }
      // print('---------decoded samity list ${samityList.length}');
      return empList;
    } else {
      return [];
    }
  }
}

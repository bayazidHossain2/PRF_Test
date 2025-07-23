import 'package:employee_data_collector/localDB/fields/employee_fields.dart';

class EmployeeModel {
  int? empId;
  String? empName;
  String? empGender;
  String? empDob;

  EmployeeModel({this.empId, this.empName, this.empGender, this.empDob});

  // Factory constructor to create an instance from JSON
  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      empId: json[EmployeeFields.empId.toLowerCase()],
      empName: json[EmployeeFields.empName.toLowerCase()],
      empGender: json[EmployeeFields.empGender.toLowerCase()],
      empDob: json[EmployeeFields.empDob.toLowerCase()],
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      EmployeeFields.empId: empId,
      EmployeeFields.empName: empName,
      EmployeeFields.empGender: empGender,
      EmployeeFields.empDob: empDob,
    };
  }
}

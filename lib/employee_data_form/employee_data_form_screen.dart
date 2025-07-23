import 'package:employee_data_collector/employee_data_form/widgets/custom_dropdown_widget.dart';
import 'package:employee_data_collector/employee_data_form/widgets/custom_text_form_field_with_label_widget.dart';
import 'package:employee_data_collector/employee_data_form/widgets/single_date_picker.dart';
import 'package:employee_data_collector/employee_data_form/widgets/wided_button_widget.dart';
import 'package:employee_data_collector/localDB/data_db.dart';
import 'package:employee_data_collector/model/employee_model.dart';
import 'package:employee_data_collector/utils/data_types/snackbar.dart';
import 'package:flutter/material.dart';

class EmployeeDataFormScreen extends StatefulWidget {
  const EmployeeDataFormScreen({super.key});

  @override
  State<EmployeeDataFormScreen> createState() => _EmployeeDataFormScreenState();
}

class _EmployeeDataFormScreenState extends State<EmployeeDataFormScreen> {
  final employeeIdController = TextEditingController();
  final employeeNameController = TextEditingController();
  final employeeGenderController = TextEditingController();
  final employeeDobController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  List<EmployeeModel> empList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EmployeeDb.instance.readAllEmployee().then((value) {
      setState(() {
        empList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employee Data Form')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 36),
              Form(
                key: formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    CustomTextFormFieldWithLabelWidget(
                      hintText: 'Write employee Id',
                      labelText: 'Employee Id',
                      controller: employeeIdController,
                      textInputType: TextInputType.number,
                    ),

                    CustomTextFormFieldWithLabelWidget(
                      hintText: 'Write employee Name',
                      labelText: 'Employee Name',
                      controller: employeeNameController,
                      textInputType: TextInputType.text,
                    ),

                    CustomDropdownWidget(
                      options: ['Male', 'Female', 'Other'],
                      controller: employeeGenderController,
                      label: 'Employee Gender',
                      hintText: 'Write employee gender',
                    ),

                    SingleDateTimePicker(
                      controller: employeeDobController,
                      text: 'Date of Birth',
                      purpose: 'Employee date of birth',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              isLoading
                  ? CircularProgressIndicator()
                  : WidedButtonWidget(
                      onPress: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if (formKey.currentState!.validate()) {
                          EmployeeModel emp = EmployeeModel(
                            empId: int.parse(employeeIdController.text.trim()),
                            empName: employeeNameController.text,
                            empGender: employeeGenderController.text,
                            empDob: employeeDobController.text,
                          );
                          final res = await EmployeeDb.instance.createEmployee(
                            emp,
                          );
                          if (res) {
                            showSnackBar(
                              context: context,
                              message: 'Data Added Successfully',
                              backgroundColor: Colors.green,
                            );
                            EmployeeDb.instance.readAllEmployee().then((value) {
                              setState(() {
                                empList = value;
                              });
                            });
                          } else {
                            showSnackBar(
                              context: context,
                              message: 'Data Added Failed',
                              backgroundColor: Colors.red,
                            );
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      text: 'Save',
                    ),
              SizedBox(height: 36),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: empList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(empList[index].empName.toString()),
                    ),
                  );
                },
              ),
              WidedButtonWidget(onPress: () {
                EmployeeDb.instance.readAllEmployee().then((value) {
                  setState(() {
                    empList = value;
                  });
                });
              }, text: 'Read'),
            ],
          ),
        ),
      ),
    );
  }
}

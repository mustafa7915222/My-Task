import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import 'home_screen.dart';
import '../utils/constants.dart';
import '../utils/function.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final List<String> _state = ['complete', 'in progress']; // Option 2
  String _selectedState ="complete";
  bool taskState = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBarDefault(
        AppConstants.addTaskAppbarTitle,
        AppConstants.appbarTitleFontSize,
        AppConstants.myWhite,
        AppConstants.fontFamily,
        AppConstants.primaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).copyWith().size.height * 0.75,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  AppConstants.addTaskTitle,
                  style: TextStyle(
                    fontSize: AppConstants.addTaskTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.secondaryColor,
                    fontFamily: AppConstants.fontFamily,
                  ),
                ),
              ),
              SizedBox(height: AppConstants.inputFieldSpacing),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: AppConstants.textFormFieldNameLabel,
                  hintText: AppConstants.textFormFieldNameHint,
                  labelStyle: const TextStyle(
                    fontSize: AppConstants.textFormFieldLabelFontSize,
                    color: AppConstants.secondaryColor,
                    fontFamily: AppConstants.fontFamily,
                  ),
                  hintStyle: const TextStyle(
                    fontSize: AppConstants.textFormFieldHintFontSize,
                    color: AppConstants.myGrey,
                    fontFamily: AppConstants.fontFamily,
                  ),
                  prefixIcon: const Icon(Icons.description,
                      color: AppConstants.secondaryColor),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        AppConstants.textFormFieldBorderRadius),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        AppConstants.textFormFieldBorderRadius),
                    borderSide: const BorderSide(
                        color: AppConstants.secondaryColor, width: 2),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        AppConstants.textFormFieldBorderRadius),
                    borderSide: const BorderSide(
                        color: AppConstants.secondaryColor, width: 2),
                  ),
                ),
              ),
              SizedBox(height: AppConstants.inputFieldSpacing),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: userIdController,
                decoration: InputDecoration(
                  labelText: AppConstants.textFormFieldJobLabel,
                  hintText: AppConstants.textFormFieldJobHint,
                  labelStyle: const TextStyle(
                    fontSize: AppConstants.textFormFieldLabelFontSize,
                    color: AppConstants.secondaryColor,
                    fontFamily: AppConstants.fontFamily,
                  ),
                  hintStyle: const TextStyle(
                    fontSize: AppConstants.textFormFieldHintFontSize,
                    color: AppConstants.myGrey,
                    fontFamily: AppConstants.fontFamily,
                  ),
                  prefixIcon: const Icon(Icons.work,
                      color: AppConstants.secondaryColor),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        AppConstants.textFormFieldBorderRadius),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        AppConstants.textFormFieldBorderRadius),
                    borderSide: const BorderSide(
                        color: AppConstants.secondaryColor, width: 2),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        AppConstants.textFormFieldBorderRadius),
                    borderSide: const BorderSide(
                        color: AppConstants.secondaryColor, width: 2),
                  ),
                ),
              ),
              SizedBox(height: AppConstants.inputFieldSpacing),
              Row(
                children: [
                  Text("Task State"),
                  SizedBox(width: AppConstants.inputFieldSpacing),
          
                  DropdownButton(
                    value: _selectedState,
                    onChanged: (newValue) {
          
                      if(newValue == "complete")
                      {
                        setState(() {
                          _selectedState = newValue!;
                          taskState =true;
                          print(taskState);
          
                        });
                      }
                      else{
                        setState(() {
                          _selectedState = newValue!;
                          taskState =false;
                          print(taskState);
          
          
                        });
                      }
                    },
                    items: _state.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: AppConstants.inputFieldSpacing),
              ElevatedButton(
                onPressed: () {
                  addTask(context,descriptionController.text, int.parse(userIdController.text) ,taskState);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => AppConstants.secondaryColor),
                  shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AppConstants.addTaskButtonRadius),
                          )),
                ),
                child: const Text(
                  AppConstants.addTaskButtonText,
                  style: TextStyle(
                    fontSize: AppConstants.addTaskButtonFontSize,
                    color: AppConstants.myWhite,
                    fontFamily: AppConstants.fontFamily,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

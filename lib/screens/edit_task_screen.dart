import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/edit_task.dart';
import '../widgets/app_bar.dart';
import 'home_screen.dart';
import '../utils/constants.dart';
import '../utils/function.dart';

class EditTaskScreen extends StatefulWidget {
  final int id;
  const EditTaskScreen({super.key, required this.id});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final List<String> _state = ['complete', 'in progress']; // Option 2
  String _selectedState ="complete";
  bool taskState = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBarDefault(
        AppConstants.editTaskAppbarTitle,
        AppConstants.appbarTitleFontSize,
        AppConstants.myWhite,
        AppConstants.fontFamily,
        AppConstants.primaryColor,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.75,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    AppConstants.editTaskTitle,
                    style: TextStyle(
                      fontSize: AppConstants.editTaskTitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.secondaryColor,
                      fontFamily: AppConstants.fontFamily,
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
                    editTask(context,widget.id,taskState);
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
                    AppConstants.editTaskButtonText,
                    style: TextStyle(
                      fontSize: AppConstants.editTaskButtonFontSize,
                      color: AppConstants.myWhite,
                      fontFamily: AppConstants.fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppConstants {
  /* utils start */

  static const Color primaryColor = Color(0xFFEC4104);
  static const Color secondaryColor = Color(0xFF193b4a);
  static const Color backgroundColor = Color(0xFFED7BA1);
  static const Color backgroundColorLight = Color(0xFFF6C8D7);
  static const Color myWhite = Color(0xFFFFFFFF);
  static const Color myGrey = Color(0xFFC2BDBD);
  static const String fontFamily = 'Akshar';

  /* utils end */

  /* logo start */

  static const double right = 100.0;
  static const double left = 100.0;
  static const double top = 20.0;
  static const double width = 175.0;
  static const double height = 175.0;
  static const String logoPath = 'assets/images/logo.png';

  /* logo end */

  /* ProgressIndicator start */

  static const double indicatorRight = 175.0;
  static const double indicatorLeft = 175.0;
  static const double indicatorBottom = 40.0;

  /* ProgressIndicator end */

  /* login page start */
  // login Form
  static const double containerHeight = 0.45;
  static const double containerWidth = 0.70;
  static const double containerBorderRadius = 15.0;
  static const double textFormFieldBorderRadius = 5.0;
  static const double inputFieldPadding = 16.0;
  static const double inputFieldSpacing = 20.0;
  static const double titleLoginSpacing = 40.0;
  static const double textFormFieldLabelFontSize = 14.0;
  static const double textFormFieldHintFontSize = 12.0;
  static const double pageTitleFontSize = 22.0;
  static const String loginTitle = 'Sign In';
  static const String textFormFieldEmailLabel = 'Username';
  static const String textFormFieldPasswordLabel = 'Password';
  static const String textFormFieldEmailHint = 'Enter your username';
  static const String textFormFieldPasswordHint = 'Enter your password';

  //login message
  static const String loginFailedMessage = 'Login Failed:';
  static const String loginSuccessMessage = 'Logged in Successfully as:';

  // error dialog
  static const String dialogButtonText = 'Ok';
  static const double dialogButtonRadius = 5.0;
  static const double dialogButtonFontSize = 16.0;
  static const double dialogTitleFontSize = 18.0;
  static const double dialogContentFontSize = 14.0;

  // login button

  static const double loginButtonRadius = 5.0;
  static const String loginButtonText = 'Login';
  static const double loginButtonFontSize = 16.0;

  /* login page end */

/* user list page start */

//appbar
  static const String taskListAppbarTitle = 'Tasks List';
  static const String addTaskAppbarTitle = 'Add Task';
  static const String editTaskAppbarTitle = 'Edit Task';
  static const double appbarTitleFontSize = 22.0;

  //snakbar
  static const String snackBarLoadUserText = 'Failed to load users:';


/* user list page end */

/* user task page start */

  // percentage
  static const double cardMarginLeft = 0.01;
  static const double cardMarginRight = 0.01;
  static const double cardMarginTop = 0.01;
  static const double cardMarginBottom= 0.7;
  static const double cardTitleSpacing= 8;
  static const double cardTitleFontSize= 18;
  static const double cardContentFontSize= 14;

  //add task

  static const double addTaskTitleFontSize= 18;

  static const String addTaskTitle = 'Add Task';
  static const String textFormFieldNameLabel = 'Task Description';
  static const String textFormFieldJobLabel = 'User Id';
  static const String textFormFieldNameHint = 'Enter task Description';
  static const String textFormFieldJobHint = 'Enter User Id';
  static const double addTaskButtonRadius = 5.0;
  static const String addTaskButtonText = 'Add';
  static const double addTaskButtonFontSize = 16.0;

  //edit task

  static const double editTaskTitleFontSize= 18;
  static const String editTaskTitle = 'Edit Task';
  static const String textFormFieldEditNameLabel = 'Name';
  static const String textFormFieldEditJobLabel = 'Job';
  static const String textFormFieldEditNameHint = 'Enter new name';
  static const String textFormFieldEditJobHint = 'Enter new job';
  static const double editTaskButtonRadius = 5.0;
  static const String editTaskButtonText = 'Edit';
  static const double editTaskButtonFontSize = 16.0;

  //delete task

  static const double deleteTaskTitleFontSize= 18;
  static const double deleteTaskContentFontSize= 16;
  static const double deleteTaskOkButtonFontSize= 16;
  static const double deleteTaskCancelButtonFontSize= 16;
  static const String deleteTaskTitle = 'Delete Task';
  static const String deleteTaskContent = 'Are you sure?';
  static const String deleteTaskOkButtonTitle = 'Yes';
  static const String deleteTaskCancelButtonTitle = 'No';



/* user task page end */

}

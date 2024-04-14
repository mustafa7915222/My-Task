# My Task App

task manager app that allows users to manage their tasks efficiently.
- [whath video from this url](https://drive.google.com/file/d/1q3dAZX_DUfE6E1yvzniDFmUTMCMvi8aw/view?usp=sharing)
- <p align="center">
  <img src="https://github.com/mustafa7915222/My-Task/blob/main/readme/images/login.png" width="150" alt="accessibility text">
  <img src="https://github.com/mustafa7915222/My-Task/blob/main/readme/images/homepage.png" width="150" alt="accessibility text">
  <img src="https://github.com/mustafa7915222/My-Task/blob/main/readme/images/add task.png" width="150" alt="accessibility text">
  <img src="https://github.com/mustafa7915222/My-Task/blob/main/readme/images/edit task.png" width="150" alt="accessibility text">
  <img src="https://github.com/mustafa7915222/My-Task/blob/main/readme/images/drawer.png" width="150" alt="accessibility text">
  
</p>

## Application Architecture:
<code>
  lib/
|-- blocs/
    |-- login/
        |-- login_cubit.dart
        |-- login_state.dart
    |-- splash/
        |-- splash_cubit.dart
        |-- splash_state.dart
      |-- task_list/
        |-- task_list_cubit.dart
        |-- task_list_state.dart
|  
|
|-- classes/
|   |-- page_navigation.dart
|   |-- task_list.dart
|
|-- models/
|   |-- add_task.dart
|   |-- delete_task.dart
|   |-- edit_task.dart
|   |-- task_list.dart
|   |-- user.dart
|
|-- repository/
|   |-- login_repository.dart
|   |-- splash_repository.dart
|   |-- task_list_repository.dart
|
|-- screens/
|   |-- add_new_task_screen.dart
|   |-- drawer.dart
|   |-- edit_task_screen.dart
|   |-- home_screen.dart
|   |-- login_page.dart
|   |-- splash_screen.dart
|
|-- services/
|   |-- login_api_service.dart
|   |-- splash_api_service.dart
|   |-- task_list_api_service.dart
|
|-- utils/
|   |-- constants.dart
|   |-- custom_painters.dart
|   |-- function.dart
|   |-- var.dart
|
|-- widgets/
|   |-- alert.dart
|   |-- app_bar.dart
|   |-- buttons.dart
|   |-- progress_indicator.dart
|   |-- snack_bar.dart
|   |-- text.dart
|   |-- text_form_field.dart
|
|-- main.dart
</code>

Here's a brief description of each folder:
<p>
<strong>blocs/:</strong> This folder contains the Business Logic Components (BLoCs) for different features or screens in your application. Each BLoC typically consists of a cubit file (*_cubit.dart) responsible for managing the business logic and a state file (*_state.dart) defining the state management.

<strong>classes/:</strong> This folder contains custom class definitions used throughout your application. These classes might represent entities, data structures, or utilities needed for various functionalities.

<strong>models/:</strong> This folder holds the data models used in your application. These models represent the structure of data objects exchanged within the app and often mirror the structure of data retrieved from APIs or databases.

<strong>repository/:</strong> This folder contains repository classes responsible for managing data operations like fetching, updating, or deleting data. Repositories abstract away the data layer implementation details from the rest of the application.

<strong>screens/:</strong> This folder contains the UI screens or pages of your application. Each screen typically corresponds to a specific user interface, such as a login page, home screen, or settings screen.

<strong>services/:</strong> This folder contains service classes responsible for interacting with external services or APIs. These services encapsulate the communication logic and provide an interface for fetching or sending data.

<strong>utils/:</strong> This folder contains utility files that hold commonly used functions, constants, or variables across your application. These utilities help in maintaining clean and organized code by centralizing shared functionality.

<strong>widgets/:</strong> This folder contains reusable UI components or widgets used across multiple screens or parts of your application. Widgets help in modularizing the UI code and promoting reusability.

<strong>main.dart:</strong> This is the entry point of my Flutter application, where you initialize and configure the app, define routes, and start the app's execution.
</p>

# Running the Flutter App on VSCode
1. <strong>Clone the repository:</strong>
<br>
<code>
git clone &lt;repository url&gt;
</code>
<br>
<br>
2. <strong>Open the cloned folder in VSCode:</strong>
<br>
<code>
cd &lt;repository folder&gt;
code .
</code>
<br>
<br>
3. <strong>Install dependencies:</strong>
<br>
<code>
flutter pub get
</code>
<br>
<br>
4. <strong>Start the app:</strong>
<br>
<code>
flutter run
</code>
<br>
<br>
<strong>This will launch the app on the default emulator or connected device</strong>
<br>
<br>
<strong>Congratulations! You've successfully run the Flutter app locally using VSCode.</strong>

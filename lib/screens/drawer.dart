import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/blocs/login/login_cubit.dart';
import 'package:test1/screens/login_page.dart';
import 'package:test1/utils/constants.dart';

import '../widgets/progress_indicator.dart';


class NavigationDrawerNew extends StatefulWidget {
  const NavigationDrawerNew({super.key});

  @override
  State<NavigationDrawerNew> createState() => _NavigationDrawerNewState();
}

class _NavigationDrawerNewState extends State<NavigationDrawerNew> {
  bool _isPressed =false;
  Future<void> _onLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("userList");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(

        child: buildMenuItems(context)
    );
  }
  Widget buildHeader(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ) ,
      child:  Image.asset(
        'assets/images/logo.png',

        width: 100,
        fit: BoxFit.fitWidth,
      ),
    );

  }
  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: buildHeader(context)),
        SizedBox(
          width: double.infinity,
          child: Divider(
              thickness: 2,

              color: Colors.black
          ),
        ),
        Expanded(
          flex:5,
          child: ListView(

            padding: EdgeInsets.zero,
            children: [

              ListTile(
                leading:_isPressed? showProgressIndicator(AppConstants.secondaryColor): const Icon(Icons.logout, color: AppConstants.secondaryColor,),
                title:const Text("Log out",style: TextStyle(fontSize: 16,fontFamily: "DroidKufi-Regular",color:  AppConstants.secondaryColor)) ,
                onTap: _isPressed?null:(){
                  setState(() {
                    _isPressed=true;
                  });

                  _onLogOut();

                },
              ),
            ],
          ),
        ),
      ],
    );

  }
}
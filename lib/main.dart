
import 'package:flutter/material.dart';
import 'package:mazare3naa/view2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mazare3naa/main_mazrati.dart';

import 'adding.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var data;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
            return FutureBuilder(future: getdataw() , builder: (context ,snapshot ){
              if(snapshot.hasError){
                return MaterialApp(title: "error",debugShowCheckedModeBanner: false,
                  home: Scaffold(body: Center(child: Text("Pls check internet connection"),),),);
              }
              if(snapshot.connectionState ==ConnectionState.done){
                return MaterialApp(title: "Mazre3na",debugShowCheckedModeBanner: false,
                  home: Main_Maz()
                );
              }
              return MaterialApp(title:"Loading",
                home: Scaffold(body: CircularProgressIndicator(),),);
            },);

          }
  Future getdataw() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     data = sharedPreferences.get("username");
     return data;
  }
}





import 'package:connexion_and_regiter_screen/screens/login_screen/loginPage.dart';
import 'package:connexion_and_regiter_screen/screens/utils/ourTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//outTheme is where we will put all global information about the aspect of our app
//such as colors, fields design, icons details etc....
//it will be under lib/screens/utils/..

Future<void> main() {
  //make the status bar transparent
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));


  runApp(
      MaterialApp(
        title: 'Touch',
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: OurLoginPage(),
      )
  );
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'Touch',
      debugShowCheckedModeBanner: false,
      theme: OurTheme().buildTheme(),
      home: OurLoginPage(),
    );
  }
  // This widget is the root of your application.

}

import 'package:connexion_and_regiter_screen/screens/register_screen/registerForm.dart';
import 'package:connexion_and_regiter_screen/screens/utils/background_painter.dart';
import 'package:flutter/material.dart';

class OurRegisterPage extends StatefulWidget {
  @override
  _OurRegisterPageState createState() => _OurRegisterPageState();
}

class _OurRegisterPageState extends State<OurRegisterPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(animation: _animationController.view),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(10.0),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: Icon(Icons.arrow_back))
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  //Appel au formulaire d'inscription
                  OurRegisterForm(),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}
/*
*
*
*
*
* WE DON'T USE IT
*
*
*
*
*
* */
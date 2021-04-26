import 'package:connexion_and_regiter_screen/screens/register_screen/registerPage.dart';
import 'package:flutter/material.dart';

class OurLoginForm extends StatefulWidget {
  @override
  _OurLoginFormState createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Form
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: Colors.grey,
                    ),
                    hintText: "email or username"),
                validator: (val) {
                  return val.length>=3
                      ? null
                      : "Invalid username or email";
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _passwordController,
                decoration: InputDecoration(
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon( Icons.visibility, color: Colors.grey,),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    hintText: "password"),
                obscureText: _isHidden,
                validator: (val) {
                  return val.isEmpty ? "Invalid password" : null;
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              //boutton de connexion
              RaisedButton(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Go",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                onPressed: () {

                },
              ),
              SizedBox(
                height: 10.0,
              ),
              //_googleButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(fontSize: 10.0, color: Colors.white),
                  ),
                  TextButton(
                    child: Text(
                      "Register now !",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.teal,
                      ),
                    ),
                    onPressed: () async {
                      bool res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OurRegisterPage()));
                      if (res != null && res == true) {
                        setState(() {

                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  //Switch to make password visible or not
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
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

import 'package:connexion_and_regiter_screen/screens/utils/background_painter.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OurLoginPage extends StatefulWidget {
  @override
  _OurLoginPageState createState() => _OurLoginPageState();
}

class _OurLoginPageState extends State<OurLoginPage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  TextEditingController _society_nameController = TextEditingController();
  TextEditingController _provider_lastnameController = TextEditingController();

  TextEditingController _countryCodeController = TextEditingController();

  TextEditingController _numController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  var _formKey_2 = GlobalKey<FormState>();
  bool _isHidden = true;
  bool signIn = true;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));
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
              painter: BackgroundPainter(
                animation: _animationController.view
              ),
            ),
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: signIn ? SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text('Get', style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w900),)
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 25),
                                  child: Text('Connected', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w900),)
                              ),
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
                                      setState(() {
                                        signIn = false;
                                      });
                                      _animationController.forward();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                  ) : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            FlatButton(
                              color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    signIn = true;
                                    _animationController.reverse();
                                  });
                                },
                                child: Text('Sign in '))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 8.0,
                              ),
                              child: Text("Get",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.w900)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 8.0,
                              ),
                              child: Text("Registered !",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.w900)),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Form(
                                key: _formKey_2,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                child: Column(
                                  children: [
                                    //form
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.alternate_email,
                                            color: Colors.white,
                                          ),
                                          hintText: "email"),
                                      validator: (val) {
                                        return EmailValidator.validate(_emailController.text)
                                            ? null
                                            : "Wrong email address";
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormField(
                                      textCapitalization: TextCapitalization.sentences,
                                      controller: _society_nameController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person_outline, color: Colors.white,),
                                          hintText: "Society name"),
                                      validator: (val) {
                                        return val.isNotEmpty
                                            ? null
                                            : "The field is empty";
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormField(
                                      textCapitalization: TextCapitalization.sentences,
                                      controller: _provider_lastnameController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person_outline, color : Colors.white),
                                          hintText: "name"),
                                      validator: (val) {
                                        return val.isNotEmpty
                                            ? null
                                            : "your name";
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 5.0,left: 5.0),
                                          child:
                                          CountryCodePicker(
                                            initialSelection: 'TG',
                                            showFlagDialog: true,
                                            //Get the country information relevant to the initial selection
                                            onInit: (code) => _countryCodeController.text = code.dialCode,

                                            onChanged: (code) => _countryCodeController.text = code.dialCode,
                                          ),),
                                        Expanded(child:

                                        TextFormField(
                                          controller: _numController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.phone, color: Colors.white,),
                                              hintText: "phone number"),
                                          validator: (val) {
                                            return val.isNotEmpty
                                                ? null
                                                : "your phone number";
                                          },
                                        ),)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_outline, color : Colors.white),
                                        hintText: "password",
                                        errorMaxLines: 3,
                                      ),
                                      obscureText: true,
                                      validator: (value) {
                                        return value.length < 8
                                            ? "the password must have at least 8 character"
                                            : null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    TextFormField(
                                      controller: _confirmPasswordController,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_open, color: Colors.white,),
                                        hintText: "confirm password",
                                        errorMaxLines: 3,),
                                      obscureText: true,
                                      validator: (value) {
                                        return value != _passwordController.text
                                            ? "passwords doesn't match"
                                            : null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 50.0,
                                    ),
                                    //boutton de connexion
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        RaisedButton(

                                          child: Padding(
                                            padding:
                                            EdgeInsets.symmetric(horizontal: 100),
                                            child: Text(
                                              "Sign up",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ),
                                          color: Colors.teal,
                                          onPressed: () {
                                            // signIn(true);

                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ]
                  ) ,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
//Switch to make password visible or not
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
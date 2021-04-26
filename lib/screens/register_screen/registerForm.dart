import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OurRegisterForm extends StatefulWidget {
  @override
  _OurRegisterFormState createState() => _OurRegisterFormState();
}

class _OurRegisterFormState extends State<OurRegisterForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  TextEditingController _society_nameController = TextEditingController();
  TextEditingController _provider_lastnameController = TextEditingController();

  TextEditingController _countryCodeController = TextEditingController();

  TextEditingController _numController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                key: _formKey,
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

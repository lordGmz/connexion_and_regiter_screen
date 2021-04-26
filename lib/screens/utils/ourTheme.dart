import 'package:flutter/material.dart';

class OurTheme {
   ThemeData buildTheme(){
     return ThemeData(
      //our main theme information first
       canvasColor: Colors.black38,
       primaryColor: Colors.black,
       accentColor: Colors.white,
       secondaryHeaderColor: Colors.grey[600],
       hintColor: Colors.white,

      //textFields Theme
         inputDecorationTheme: InputDecorationTheme(
           hintStyle: TextStyle(fontFamily: 'AvenirStd', color : Colors.white),
           helperStyle: TextStyle(fontFamily: 'AvenirStd',color : Colors.white),

           focusColor: Colors.white,
           border: UnderlineInputBorder(
             borderRadius: BorderRadius.circular(0.0),
             borderSide: BorderSide(
               color: Colors.white,
             ),
           ),
           enabledBorder: UnderlineInputBorder(
             borderRadius: BorderRadius.circular(0.0),
             borderSide: BorderSide(
               color: Colors.white,
             ),
           ),
           filled: false,
           focusedBorder: UnderlineInputBorder(
             borderRadius: BorderRadius.circular(0.0),
             borderSide: BorderSide(
               color:Colors.grey,
             ),
           ),

         ),

       //buttons theme
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.green,
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            minWidth:40.0 ,
            height: 50.0,
            //Arrondissement des bords des bouttons
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            )
        )

     );
   }
}
import 'package:flutter/material.dart';

class textformfield extends StatelessWidget {
  textformfield({Key?key,
  required this.labelText,
  required this.prefixicon,
  required this.prefixcolor,
  required this.mycontroler
    }): super(key: key);

  var labelText, prefixicon, prefixcolor, mycontroler;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if(value == null || value.isEmpty){
            return "Please enter some text";
          }
          else{
            return null;
          }
        },
        controller: mycontroler,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixicon,
          border: OutlineInputBorder(),
          prefixIconColor: prefixcolor
        ),
    );
  }
}
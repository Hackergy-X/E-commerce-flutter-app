import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {


  TextInputType textInputTypee;
  late bool isPassword;
  late String hint;


  MyTextField({
    Key? key,
    required this.textInputTypee,
    required this.hint,
    required this.isPassword,
}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return   TextField(
        keyboardType: textInputTypee,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          // To delete borders
          enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context),),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),),
          // fillColor: Colors.red,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
        ));
  }
}

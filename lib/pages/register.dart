import 'package:flutter/material.dart';
import '../shared/custom_textfield.dart';
import '../shared/ColorsConst.dart';


class Register extends StatefulWidget {
  const Register({ super.key });

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                    hint: "Enter Your Username",
                    isPassword: false,
                    textInputTypee: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    hint: "Enter Your Email",
                    isPassword: false,
                    textInputTypee: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    hint: "Enter Your Password",
                    isPassword: true,
                    textInputTypee: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: (){
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(BTNgreen),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ),
                    child: Text("Register", style: TextStyle(fontSize: 19),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do you have an account ? "),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed("login");
                        },
                        child: Text('Login now', style: TextStyle(color: Colors.black)),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


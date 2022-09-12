import 'package:flutter/material.dart';
import '../shared/custom_textfield.dart';
import '../shared/ColorsConst.dart';


class Login extends StatefulWidget {
  const Login({ super.key });

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
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
                      Navigator.of(context).pushNamed("home");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(BTNgreen),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ),
                    child: Text("Login", style: TextStyle(fontSize: 19),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do not have an account? "),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed("register");
                        },
                        child: Text('Register now', style: TextStyle(color: Colors.black)),)
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


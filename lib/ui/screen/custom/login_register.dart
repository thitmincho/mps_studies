import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterstudy_app/ui/screen/custom/account_settings.dart';
import 'package:masterstudy_app/ui/screen/custom/login.dart';
import 'package:masterstudy_app/ui/screen/custom/utils/button_three.dart';
import 'package:masterstudy_app/ui/screen/custom/utils/button_two.dart';
import 'package:masterstudy_app/ui/screen/main/main_screen.dart';
import 'package:masterstudy_app/theme/theme.dart';
import 'package:masterstudy_app/ui/screen/custom/utils/button_one.dart';

// import 'forget_password.dart';

import 'package:masterstudy_app/ui/screen/custom/register.dart';

// import '../utils/progressdialog.dart';

class Login_Register_Custom extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login_Register_Custom> {
  String email;
  String password;

  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              SvgPicture.asset("assets/icons/login_logo.svg"),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "MPS",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "မှ ကြိုဆိုပါသည်။",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1),
                  )
                ],
              ),
              SizedBox(height: 40),
              Column(
                children: <Widget>[
                  Container(
                    width: 190,
                    child: Text(
                      "အတန်းအပ်ရန်အတွက် ",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 210,
                    child: Text(
                      "အကောင့်တစ်ခု လိုအပ်ပါသည်။",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Button_Two(
                text: 'Register Now'.toUpperCase(),
                press: () {
                  Navigator.push(
                      this.context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen_Custom()));
                },
              ),
              SizedBox(height: 20),
              Text(
                "အကောင့်ဖွင့်ပြီးသားဖြစ်ပါက ",
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Button_Three(
                text: 'Login'.toUpperCase(),
                press: () {
                  Navigator.push(
                      this.context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen_Custom()));
                },
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Powered by Mps".toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

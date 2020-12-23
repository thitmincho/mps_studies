import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:masterstudy_app/ui/screen/custom/account_settings.dart';
import 'package:masterstudy_app/ui/screen/custom/profile.dart';
import 'package:masterstudy_app/ui/screen/custom/utils/button_three.dart';
import 'package:masterstudy_app/ui/screen/custom/utils/button_two.dart';
import 'package:masterstudy_app/ui/screen/main/main_screen.dart';
import 'package:masterstudy_app/theme/theme.dart';
import 'package:masterstudy_app/ui/screen/custom/utils/button_one.dart';

// import 'forget_password.dart';

import 'package:masterstudy_app/ui/screen/custom/register.dart';

// import '../utils/progressdialog.dart';

class LoginScreen_Custom extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen_Custom> {
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
      body: Container(
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
            _buildTextField('ဖုန်းနံပါတ်'),
            _buildTextField('လျို့ဝှက်နံပါတ်'),
            SizedBox(height: 10),
            Button_One(
              text: 'ဝင်ရောက်ရန်'.toUpperCase(),
              press: () {
                // Navigator.push(
                //     this.context,
                //     MaterialPageRoute(
                //         builder: (context) => ProfileScreen_Custom()));
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            Text(
              "သင်၏လျို့ဝှက်နံပါတ် ကိုမေ့နေပါသလား?",
              style: TextStyle(fontSize: 15, color: Yellow, letterSpacing: 1),
            ),
            SizedBox(height: 30),
            _facebookButton(),
            Column(
              children: <Widget>[
                Container(
                  width: 190,
                  child: Text(
                    "Cooperation with",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 190,
                  child: Text(
                    "Konard Adenauer Stiftung",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                isCollapsed: true,
                hintText: title,
                hintStyle: TextStyle(fontSize: 15, height: 1.2),
                // hintMaxLines: 1,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(30)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                filled: true,
                fillColor: Primary3,
              ),
              controller: new TextEditingController(),
            ),
          )
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      padding: EdgeInsets.all(0),
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            child: Container(
              // padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset("assets/icons/login_with_facebook.svg"),
                  SizedBox(width: 10),
                  Text(
                    'Login with Facebook'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Blue2,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

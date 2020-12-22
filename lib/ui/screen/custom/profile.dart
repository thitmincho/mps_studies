import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:masterstudy_app/ui/screen/custom/account_settings.dart';
// import 'package:masterstudy_app/ui/screen/main/main_screen.dart';
import 'package:masterstudy_app/theme/theme.dart';
import 'package:masterstudy_app/ui/screen/custom/utils/button_one.dart';
// import 'package:masterstudy_app/ui/screen/custom/utils/constant.dart';
// import 'package:masterstudy_app/ui/screen/custom/utils/storeicon_icons.dart';

class ProfileScreen_Custom extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen_Custom> {
  @override
  Widget build(BuildContext context) {
    // final Color background = Colors.white;
    // final Color fill = Color(0xfff3f4f5);
    // final List<Color> gradient = [
    //   background,
    //   background,
    //   fill,
    //   fill,
    // ];
    // final double fillPercent = 12;
    // final double fillStop = (100 - fillPercent) / 100;
    // final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/arrow_back_appbar.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // leading: Image.asset(
        //   "assets/icons/arrow_back_appbar.png",
        // ),
        title: Text(
          "ကိုယ်ရေးအချက်အလက်",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        titleSpacing: -5,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Primary,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: gradient,
            //     stops: stops,
            //     end: Alignment.bottomCenter,
            //     begin: Alignment.topCenter,
            //   ),
            // ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildHeader(),
                SizedBox(height: 40),
                _buildTextField('Maxart Olivia'),
                _buildTextField('+959 123 456 789'),
                _buildTextField('အီးမေး'),
                _buildDropDown('ကျား / မ'),
                SizedBox(
                  height: 20,
                ),
                Button_One(
                  text: 'ပြင်ဆင်မည်',
                  press: () {
                    // Navigator.push(this.context,
                    //     MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Connect with Facebook Login".toUpperCase(),
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: title,
              hintStyle: TextStyle(fontSize: 15, height: 1.2),
              // hintMaxLines: 1,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                  borderRadius: BorderRadius.circular(30)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              filled: true,
              fillColor: Primary3,
            ),
            controller: new TextEditingController(),
          ),
        ],
      ),
    );
  }

  Widget _buildDropDown(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: title,
              hintStyle: TextStyle(fontSize: 15, height: 1.8),
              // hintMaxLines: 1,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                  borderRadius: BorderRadius.circular(30)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              filled: true,
              fillColor: Primary3,
            ),
            controller: new TextEditingController(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 90.0,
          height: 90.0,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(70),
              ),
            ),
            image: DecorationImage(
                image: AssetImage("assets/images/user_profile.png")),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () {
              // Navigator.push(this.context,
              //     MaterialPageRoute(builder: (context) => AccountSettings()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset("assets/icons/camera.svg"),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Change Photo",
                  style: GoogleFonts.poppins(
                      fontSize: 17, color: Orange, fontWeight: FontWeight.w500),
                ),
              ],
            )),
        // ),
      ],
      //   )
      // ],
    );
  }
}

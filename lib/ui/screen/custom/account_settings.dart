import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:werlopp_app/screens/account/change_password.dart';
// import 'package:werlopp_app/screens/account/login.dart';
// import 'package:werlopp_app/screens/wishlist.dart';
// import 'package:werlopp_app/screens/order.dart';
import 'package:masterstudy_app/ui/screen/custom/utils/colors.dart';
import 'package:masterstudy_app/ui/screen/custom/utils/button_one.dart';
import 'package:masterstudy_app/ui/screen/custom/utils/constant.dart';
import 'package:masterstudy_app/ui/screen/custom/utils/storeicon_icons.dart';

// import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';
import 'profile.dart';

class AccountSettings extends StatefulWidget {
  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Account",
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        _buildHeader(),
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                margin: EdgeInsets.fromLTRB(16, 10, 10, 10),
                                shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.white, width: 0),
                                ),
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image.asset("assets/img/orders.png",
                                              height: 35, width: 35),
                                          SizedBox(height: 4),
                                          Text("Orders",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(top: 40),
                                        child: GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //   context,
                                            //   PageTransition(
                                            //     type: PageTransitionType.fade,
                                            //     child: Order(),
                                            //   ),
                                            // );
                                          },
                                          child: Icon(
                                            StoreIcon.arrow_right,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // ),
                            Expanded(
                              child: Card(
                                margin: EdgeInsets.fromLTRB(10, 10, 16, 10),
                                shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.white, width: 0),
                                ),
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image.asset("assets/img/wishlist.png",
                                              height: 35, width: 35),
                                          SizedBox(height: 4),
                                          Text("Wishlist",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(top: 40),
                                        child: GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //   context,
                                            //   PageTransition(
                                            //     type: PageTransitionType.fade,
                                            //     child: WishList(),
                                            //   ),
                                            // );
                                          },
                                          child: Icon(
                                            StoreIcon.arrow_right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              _buildDivider(),
                              ListTile(
                                  title: Text(
                                    "Currency",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: Text(
                                    "USD",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    //open change language
                                  },
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  dense: true),
                              _buildDivider(),
                              ListTile(
                                  title: Text(
                                    "Language",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: Image.asset(
                                    "assets/img/eng.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                  onTap: () {
                                    //open change location
                                  },
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  dense: true),
                              _buildDivider(),
                              ListTile(
                                  title: Text(
                                    "Password",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: Icon(
                                    StoreIcon.leftarrow,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             ChangePasswordScreen()));
                                  },
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  dense: true),
                              _buildDivider(),
                              ListTile(
                                  title: Text(
                                    "Contact Us",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: Icon(
                                    StoreIcon.leftarrow,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                  onTap: () {
                                    //open change location
                                  },
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  dense: true),
                              _buildDivider(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Button_One(
                              text: 'Log Out',
                              press: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => LoginScreen()));
                              }),
                        ),
                        Image.asset(
                          "assets/img/topbar-logo.png",
                          width: 127,
                          height: 31,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "version 1.0.3",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 11.0, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 16.0),
        Container(
          width: 70.0,
          height: 80.0,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            image: DecorationImage(image: NetworkImage(avatars[3])),
          ),
        ),
        SizedBox(width: 15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Good evening..",
              style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffA8A8A8)),
            ),
            // SizedBox(height: 2.0),
            Text(
              "John Doe",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              "Sales Person Member",
              style: GoogleFonts.poppins(fontSize: 12),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                // color: Color(0xffAC915D),
                padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
                decoration: BoxDecoration(
                    color: Color(0xffAC915D),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "0 points",
                  style: GoogleFonts.poppins(color: White, fontSize: 12),
                )),
          ],
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   PageTransition(
                //     type: PageTransitionType.fade,
                //     child: ProfileScreen(),
                //   ),
                // );
              },
              child: Icon(
                StoreIcon.edit_2,
                size: 20,
              ),
            )
          ],
        ),
        SizedBox(
          width: 16,
        )
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1.0,
      color: BorderColor,
    );
  }
}

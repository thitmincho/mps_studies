import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:myanmar_political_studies/ui/screen/custom/utils/button_one.dart';
import 'package:myanmar_political_studies/ui/screen/review_write/review_write_screen.dart';

class NewsDetailScreen extends StatefulWidget {
  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
          "အသေးစိတ်အချက်အလက်",
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Gray5, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 0,
                                    left: 16.0,
                                    right: 16.0,
                                    bottom: 12),
                                child: Text(
                                  "Sep 15 2020 at 1:00 PM",
                                  textScaleFactor: 1.0,
                                  // maxLines: ,
                                  style: GoogleFonts.roboto(
                                      fontSize: 13, color: Blue1),
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                  textScaleFactor: 1.0,
                                  maxLines: 2,
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      color: Gray2,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),

                            // Text("Continue Reading"),
                            Image.network(
                              "https://stylemixthemes.com/masterstudy/academy/wp-content/uploads/sites/9/2018/08/photo-1475452779376-caebfb988090-1949x1299.jpeg",
                              width: MediaQuery.of(context).size.width,
                              height: 175,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              // height: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 10.0,
                                    right: 10.0,
                                    bottom: 5),
                                child: Text(
                                  "Lorsem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel varius neque. Praesent ornare at mi ut iaculis. Praesent id turpis fringilla, scelerisque dui vel, venenatis neque. Mauris ultrices consectetur tristique. Nullam consequat pharetra lectus vitae ullamcorper. Quisque diam lacus, maximus sit amet fringilla sed,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel varius neque. Praesent ornare at mi ut iaculis. Praesent id turpis fringilla, scelerisque dui vel, venenatis neque. Mauris ultrices consectetur tristique. Nullam consequat pharetra lectus vitae ullamcorper. Quisque diam lacus, maximus sit amet fringilla sed,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel varius neque. Praesent ornare at mi ut iaculis. Praesent id turpis fringilla, scelerisque dui vel, venenatis neque. Mauris ultrices consectetur tristique. Nullam consequat pharetra lectus vitae ullamcorper. Quisque diam lacus, maximus sit amet fringilla sed,",
                                  textScaleFactor: 1.0,
                                  // maxLines: 3,
                                  style: GoogleFonts.roboto(
                                      fontSize: 13, color: Gray2),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(color: Gray5),
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 13,
                                    left: 16.0,
                                    right: 16.0,
                                    bottom: 13),
                                child: Text(
                                  "250 Likes, 50 Comments, 10 Share",
                                  textScaleFactor: 1.0,
                                  // maxLines: ,
                                  style: GoogleFonts.roboto(
                                      fontSize: 11, color: Gray2),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 16.0, right: 16.0),
                              child: Divider(
                                color: HexColor.fromHex("#fff"),
                                thickness: 1.3,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SvgPicture.asset(
                                    "assets/icons/heart.svg",
                                    color: Red,
                                  ),
                                ),
                                Expanded(
                                  child: SvgPicture.asset(
                                    "assets/icons/message.svg",
                                    color: Orange,
                                  ),
                                ),
                                Expanded(
                                  child: SvgPicture.asset(
                                    "assets/icons/share.svg",
                                    color: Green,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15)
                          ],
                        ),
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "မှတ်ချက်မရှိပါ",
                      style: TextStyle(color: Gray3),
                    ))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottom(),
    );
  }

  _buildBottom() {
    return Container(
      decoration: BoxDecoration(
        color: HexColor.fromHex("#F6F6F6"),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[_buildPrice()],
        ),
      ),
    );
  }

  _buildPrice() {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).pushNamed(
          ReviewWriteScreen.routeName,
          arguments: ReviewWriteScreenArgs(null, null),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 300,
            // height: 5,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(border: Border.all(color: Orange)),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "မှတ်ချက်ရေးရန်...",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Orange,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  color: Orange,
                  child: Icon(Icons.send, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

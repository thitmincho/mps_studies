import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myanmar_political_studies/main.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:myanmar_political_studies/ui/bloc/course/bloc.dart';
import 'package:myanmar_political_studies/ui/bloc/user_course_locked/bloc.dart';
import 'package:myanmar_political_studies/ui/screen/detail_profile/detail_profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogAuthorWidget extends StatelessWidget {
  final dynamic courseState;

  DialogAuthorWidget(this.courseState);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 15.0, left: 20.0, right: 20.0),
                  child: _buildBody(context, this.courseState),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildBody(BuildContext context, dynamic state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ဆရာ",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: HexColor.fromHex("#AAAAAA")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        "ဆရာ ဦးအောင်အောင်",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: HexColor.fromHex("#273044")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: <Widget>[
                          RatingBar(
                            initialRating: 4.5,
                            minRating: 0,
                            direction: Axis.horizontal,
                            tapOnlyMode: true,
                            glow: false,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            unratedColor: HexColor.fromHex("#CCCCCC"),
                            itemCount: 5,
                            itemSize: 19,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 2,
              child: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                      "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg")),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: MaterialButton(
                    height: 36,
                    color: Primary,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        DetailProfileScreen.routeName,
                        arguments: DetailProfileScreenArgs.fromId(1),
                      );
                    },
                    child: Text(
                      "View Profile".toUpperCase(),
                      textScaleFactor: 1.0,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 5.0),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                      width: 36,
                      height: 36,
                      child: SvgPicture.asset('assets/icons/facebook.svg')),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                      width: 36,
                      height: 36,
                      child: Image(
                          image: AssetImage('assets/icons/soc_twit.png'))),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

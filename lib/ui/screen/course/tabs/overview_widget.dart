import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myanmar_political_studies/data/models/ReviewResponse.dart';
import 'package:myanmar_political_studies/data/models/course/CourseDetailResponse.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:myanmar_political_studies/ui/screen/course/meta_icon.dart';
import 'package:myanmar_political_studies/ui/screen/review_write/review_write_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../main.dart';

class OverviewWidget extends StatefulWidget {
  final CourseDetailResponse response;
  final ReviewResponse reviewResponse;

  const OverviewWidget(this.response, this.reviewResponse) : super();

  @override
  State<StatefulWidget> createState() {
    return _OverviewWidgetState();
  }
}

class _OverviewWidgetState extends State<OverviewWidget>
    with AutomaticKeepAliveClientMixin {
  bool descTextShowFlag = false;
  bool reviewTextShowFlag = false;
  bool annoncementTextShowFlag = false;
  int reviewsListShowItems = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            //Description
            _buildDescription(),
            // //Meta
            Column(
              children: [
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                MetaIcon(
                                  "current_students",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                      // value.label,
                                      "စာရင်းသွင်း",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontFamily: "Pyidaungsu",
                                          fontSize: 15)),
                                )
                              ],
                            ),
                            Text(
                              "၁၀၀၀ ယောက်",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: "Pyidaungsu",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                MetaIcon(
                                  "duration",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                      // value.label,
                                      "အတန်းကြာချိန်",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontFamily: "Pyidaungsu",
                                          fontSize: 15)),
                                )
                              ],
                            ),
                            Text(
                              "၇ နာရီ",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: "Pyidaungsu",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                MetaIcon(
                                  "curriculum",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                      // value.label,
                                      "ပို့ချချက်",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontFamily: "Pyidaungsu",
                                          fontSize: 15)),
                                )
                              ],
                            ),
                            Text(
                              "၃ ပိုင်း",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: "Pyidaungsu",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                MetaIcon(
                                  "video_duration",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                      // value.label,
                                      "ဗွီဒိယို",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontFamily: "Pyidaungsu",
                                          fontSize: 15)),
                                )
                              ],
                            ),
                            Text(
                              "၃ နာရီ",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: "Pyidaungsu",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                MetaIcon(
                                  "level",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                      // value.label,
                                      "သင်ခန်းစာအဆင့်",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontFamily: "Pyidaungsu",
                                          fontSize: 15)),
                                )
                              ],
                            ),
                            Text(
                              "အလယ်အလတ်",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontFamily: "Pyidaungsu",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                )
              ],
            ),
            // // _buildAnnoncement(widget.response.announcement),
            _buildReviewsStat(null),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: new MaterialButton(
                minWidth: double.infinity,
                color: Primary,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    ReviewWriteScreen.routeName,
                    arguments: ReviewWriteScreenArgs(null, null),
                  );
                },
                child: Text("သုံးသပ်ချက်ပေးရန်",
                    // localizations.getLocalization("write_review_button"),
                    textScaleFactor: 1.0,
                    style: TextStyle(fontFamily: "Pyidaungsu", fontSize: 17)),
                textColor: Colors.white,
              ),
            ),
            // _buildReviewList(widget.reviewResponse.posts),
          ],
        ),
      ),
    );
  }

  WebViewController _descriptionWebViewController;
  double descriptionHeight;

  _buildDescription() {
    double webContainerHeight;
    String decription =
        "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel varius neque. Praesent ornare at mi ut iaculis. Praesent id turpis fringilla, scelerisque dui vel, venenatis neque. Mauris ultrices consectetur tristique. Nullam consequat pharetra lectus vitae ullamcorper. Quisque diam lacus, maximus sit amet fringilla sed, malesuada a lorem. Aliquam pulvinar sem vitae maximus imperdiet. Ut mattis mi tortor, sed mollis augue tristique sed. In suscipit sodales tellus, eu dapibus dolor. Pellentesque vel erat sapien. Donec et massa in erat sodales accumsan. Donec at tortor ligula. Cras euismod volutpat auctor. Vivamus vitae placerat nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed consequat viverra dapibus. Maecenas ac ipsum quis sem blandit aliquet. Cras eget placerat nisi. Duis ut quam in nisl pellentesque ultrices ut eget leo. Sed in semper risus. Aenean ultrices vel nisi id molestie. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras sagittis non nulla vel molestie. Duis mollis ornare velit, eget rutrum odio rutrum non. Etiam convallis justo justo, a lacinia tortor euismod non. Nunc tempus hendrerit nibh at vulputate. Curabitur eu placerat mauris, id placerat velit. Praesent rutrum vulputate leo scelerisque gravida. Duis nulla massa, aliquet eget aliquet sit amet, vehicula quis nunc. Nulla nulla odio, malesuada non lorem at, placerat varius nunc.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis vitae vulputate purus. Sed sit amet magna lacinia, semper enim sed, rutrum leo. Nam a quam velit. Nam velit metus, luctus ac volutpat eget, interdum id felis. Etiam semper justo vitae viverra dignissim. Donec rutrum enim vitae libero facilisis, vel venenatis magna scelerisque. Aenean eget metus feugiat, lacinia odio ut, rutrum quam. Aliquam eget fringilla lacus.</p>";
    if (descriptionHeight != null && descTextShowFlag) {
      // webContainerHeight = descriptionHeight;
      webContainerHeight = 900;
    } else {
      webContainerHeight = 100;
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: webContainerHeight),
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl:
                'data:text/html;base64,${base64Encode(const Utf8Encoder().convert(decription))}',
            onPageFinished: (some) async {
              double height = double.parse(
                  await _descriptionWebViewController.evaluateJavascript(
                      "document.documentElement.scrollHeight;"));
              setState(() {
                descriptionHeight = height;
              });
            },
            onWebViewCreated: (controller) async {
              controller.clearCache();
              this._descriptionWebViewController = controller;
            },
          ),
        ),
      ]),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              descTextShowFlag = !descTextShowFlag;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              descTextShowFlag
                  ? Text(
                      localizations.getLocalization("show_less_button"),
                      textScaleFactor: 1.0,
                      style: TextStyle(color: mainColor),
                    )
                  : Text(localizations.getLocalization("show_more_button"),
                      textScaleFactor: 1.0, style: TextStyle(color: mainColor))
            ],
          ),
        ),
      ),
    ]);
  }

  WebViewController _annoncementWebViewController;
  double annoncementHeight;

  _buildAnnoncement(String announcement) {
    if (announcement == null || announcement.isEmpty) return Center();

    double webContainerHeight;
    if (annoncementHeight != null && annoncementTextShowFlag) {
      webContainerHeight = annoncementHeight;
    } else {
      webContainerHeight = 160;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(localizations.getLocalization("annoncement_title"),
                  textScaleFactor: 1.0,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .title
                      .copyWith(color: dark, fontStyle: FontStyle.normal)),
            )
          ],
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: webContainerHeight),
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:
                  'data:text/html;base64,${base64Encode(const Utf8Encoder().convert(announcement))}',
              onPageFinished: (some) async {
                double height = double.parse(
                    await _annoncementWebViewController.evaluateJavascript(
                        "document.documentElement.scrollHeight;"));
                setState(() {
                  annoncementHeight = height;
                });
              },
              onWebViewCreated: (controller) async {
                controller.clearCache();
                this._annoncementWebViewController = controller;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  annoncementTextShowFlag = !annoncementTextShowFlag;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  annoncementTextShowFlag
                      ? Text(
                          localizations.getLocalization("show_less_button"),
                          textScaleFactor: 1.0,
                          style: TextStyle(color: mainColor),
                        )
                      : Text(localizations.getLocalization("show_more_button"),
                          textScaleFactor: 1.0,
                          style: TextStyle(color: mainColor))
                ],
              ),
            ),
          ),
        ]),
      ],
    );
  }

  _buildReviewsStat(RatingBean rating) {
    var total = 568;
    var onePercent = total / 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text("သုံးသပ်ချက်များ",
                  // localizations.getLocalization("reviews_title"),
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontFamily: "Pyidaungsu",
                      color: Gray2,
                      fontWeight: FontWeight.w700,
                      fontSize: 19)),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                _buildStatRow("5", 80, 8),
                _buildStatRow("4", 50, 5),
                _buildStatRow("3", 40, 4),
                _buildStatRow("2", 20, 2),
                _buildStatRow("1", 0 / onePercent, 0),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    height: 140,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: HexColor.fromHex("#EEF1F7")),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "၄.၀",
                          textScaleFactor: 1.0,
                          style: TextStyle(fontSize: 30),
                        ),
                        RatingBar(
                          initialRating: 4.0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 19,
                          unratedColor: HexColor.fromHex("#CCCCCC"),
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star,
                              color: Colors.amber,
                            );
                          },
                          onRatingUpdate: (rating) {},
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            // "(${rating.total} ${localizations.getLocalization("reviews_count")})",
                            "(၁၉ ဦး)",
                            textScaleFactor: 1.0,
                            style:
                                TextStyle(color: HexColor.fromHex("#AAAAAA")),
                          ),
                        ),
                      ],
                    ))
              ],
            )
          ],
        )
      ],
    );
  }

  _buildStatRow(stars, double progress, count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "$stars ${localizations.getLocalization("stars_count")}",
            // "ကြယ် $stars ပွင့်",
            textScaleFactor: 1.0,
            style: TextStyle(
                color: HexColor.fromHex("#777777"),
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: SizedBox(
                width: 105,
                height: 15,
                child: LinearProgressIndicator(
                  value: (!progress.isNaN) ? progress / 100 : 0,
                  backgroundColor: HexColor.fromHex("#F3F5F9"),
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      HexColor.fromHex("#ECA824")),
                ),
              ),
            ),
          ),
          Text(
            "$count",
            textScaleFactor: 1.0,
            style: TextStyle(
                color: HexColor.fromHex("#777777"),
                fontWeight: FontWeight.bold,
                fontSize: 14),
          )
        ],
      ),
    );
  }

  _buildReviewList(List<ReviewBean> reviews) {
    if (reviews == null || reviews.isEmpty) return Center();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: reviewsListShowItems,
            itemBuilder: (context, index) {
              var item = reviews[index];
              return _buildReviewItem(item);
            }),
        (reviews.length != 1)
            ? InkWell(
                onTap: () {
                  setState(() {
                    reviewsListShowItems == 1
                        ? reviewsListShowItems = reviews.length
                        : reviewsListShowItems = 1;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      reviewsListShowItems != 1
                          ? Text(
                              localizations.getLocalization("show_less_button"),
                              textScaleFactor: 1.0,
                              style: TextStyle(color: mainColor),
                            )
                          : Text(
                              localizations.getLocalization("show_more_button"),
                              textScaleFactor: 1.0,
                              style: TextStyle(color: mainColor))
                    ],
                  ),
                ),
              )
            : Center()
      ],
    );
  }

  _buildReviewItem(ReviewBean review) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: HexColor.fromHex("#EEF1F7")),
          child: Padding(
              padding: EdgeInsets.only(
                  top: 15.0, right: 20.0, bottom: 15.0, left: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                review.user,
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: HexColor.fromHex("#273044")),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                review.time,
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: HexColor.fromHex("#AAAAAA")),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            RatingBar(
                              initialRating: review.mark.toDouble(),
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 19,
                              unratedColor: HexColor.fromHex("#CCCCCC"),
                              itemBuilder: (context, index) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Html(data: review.content),
                ],
              ))),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

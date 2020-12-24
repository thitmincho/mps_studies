import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:myanmar_political_studies/data/models/category.dart';
import 'package:myanmar_political_studies/data/models/course/CourcesResponse.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:myanmar_political_studies/ui/screen/category_detail/category_detail_screen.dart';
import 'package:myanmar_political_studies/ui/screen/course/course_screen.dart';

class NewCoursesWidget extends StatelessWidget {
  final String title;
  // final List<CoursesBean> courses;

  NewCoursesWidget(
    this.title,
    // this.courses,
    {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // (courses.length != 0)        ?
        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(color: HexColor.fromHex("#eef1f7")),
          child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 15.0, bottom: 20),
              child: Text("Current Affairs",
                  textScaleFactor: 1.0,
                  style: GoogleFonts.roboto(
                      color: Gray1,
                      fontSize: 19,
                      fontWeight: FontWeight.w700))),
        ),
        _buildList(context)
      ],
    );
    // : Center();
  }

  _buildList(context) {
    return Container(
      decoration: BoxDecoration(color: Gray6),
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0, bottom: 20),
        child: ConstrainedBox(
            constraints: new BoxConstraints(minHeight: 420, maxHeight: 450),
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CourseScreen.routeName,
                      arguments: CourseScreenArgs(null),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 0, right: 10),
                    child: _buildCard(
                        context,
                        "https://stylemixthemes.com/masterstudy/academy/wp-content/uploads/sites/9/2018/08/photo-1475452779376-caebfb988090-1949x1299.jpeg",
                        // item.categories_object.first,
                        "Lorem Ipsum dolor sit amet, consectetur adipicsing elit.",
                        4.5,
                        "",
                        "item.price.price",
                        "item.price.old_price",
                        "item.price.free"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CourseScreen.routeName,
                      // arguments: CourseScreenArgs(item),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: _buildCard(
                        context,
                        "https://stylemixthemes.com/masterstudy/academy/wp-content/uploads/sites/9/2018/08/photo-1475452779376-caebfb988090-1949x1299.jpeg",
                        // item.categories_object.first,
                        "Lorem Ipsum dolor sit amet, consectetur adipicsing elit.",
                        4.5,
                        "",
                        "item.price.price",
                        "item.price.old_price",
                        "item.price.free"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CourseScreen.routeName,
                      // arguments: CourseScreenArgs(item),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: _buildCard(
                        context,
                        "https://stylemixthemes.com/masterstudy/academy/wp-content/uploads/sites/9/2018/08/photo-1475452779376-caebfb988090-1949x1299.jpeg",
                        // item.categories_object.first,
                        "Lorem Ipsum dolor sit amet, consectetur adipicsing elit.",
                        4.5,
                        "",
                        "item.price.price",
                        "item.price.old_price",
                        "item.price.free"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CourseScreen.routeName,
                      // arguments: CourseScreenArgs(item),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: _buildCard(
                        context,
                        "https://stylemixthemes.com/masterstudy/academy/wp-content/uploads/sites/9/2018/08/photo-1475452779376-caebfb988090-1949x1299.jpeg",
                        // item.categories_object.first,
                        "Lorem Ipsum dolor sit amet, consectetur adipicsing elit.",
                        4.5,
                        "",
                        "item.price.price",
                        "item.price.old_price",
                        "item.price.free"),
                  ),
                )
              ],
            )
            // new ListView.builder(
            //   itemCount: courses.length,
            //   itemBuilder: (context, index) {
            //     var item = courses[index];
            //     var padding = (index == 0) ? 0.0 : 0.0;

            //     var rating = 0.0;
            //     var reviews = 0;
            //     if (item.rating.total != null) {
            //       rating = item.rating.average.toDouble();
            //     }
            //     if (item.rating.total != null) {
            //       reviews = item.rating.total;
            //     }
            //     return GestureDetector(
            //       onTap: () {
            //         Navigator.pushNamed(
            //           context,
            //           CourseScreen.routeName,
            //           arguments: CourseScreenArgs(item),
            //         );
            //       },
            //       child: Padding(
            //         padding: EdgeInsets.only(left: padding),
            //         child: _buildCard(
            //             context,
            //             item.images.small,
            //             item.categories_object.first,
            //             "Lorem Ipsum dolor sit amet, consectetur adipicsing elit.",
            //             rating,
            //             "",
            //             item.price.price,
            //             item.price.old_price,
            //             item.price.free),
            //       ),
            //     );
            //   },
            //   padding: const EdgeInsets.all(8.0),
            //   scrollDirection: Axis.horizontal,
            // ),
            ),
      ),
    );
  }

  _buildCard(context, image, title, stars, reviews, price, oldPrice, free) {
    // Category category,
    var unescape = new HtmlUnescape();

    return SizedBox(
      width: 310,
      height: 427,
      child: Card(
        borderOnForeground: true,
        elevation: 2,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Gray5, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 60,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 17.0, left: 16.0, right: 16.0),
                  child: Text(
                    unescape.convert(title),
                    textScaleFactor: 1.0,
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                        fontSize: 15,
                        color: Gray2,
                        height: 1.2,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                // height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel varius neque. Praesent ornare at mi ut iaculis. Praesent id turpis fringilla, scelerisque dui vel, venenatis neque. Mauris ultrices consectetur tristique. Nullam consequat pharetra lectus vitae ullamcorper. Quisque diam lacus, maximus sit amet fringilla sed,",
                    textScaleFactor: 1.0,
                    maxLines: 3,
                    style: GoogleFonts.roboto(
                        fontSize: 13, color: Gray2, height: 1.3),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 16.0, right: 16.0, bottom: 10),
                  child: Text(
                    "Continue Reading",
                    textScaleFactor: 1.0,
                    // maxLines: ,
                    style: GoogleFonts.roboto(
                        fontSize: 13, color: Blue1, height: 1.3),
                  ),
                ),
              ),
              // Text("Continue Reading"),
              Image.network(
                image,
                width: MediaQuery.of(context).size.width,
                height: 170,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(color: Gray5),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 16.0, right: 16.0, bottom: 10),
                  child: Text(
                    "250 Likes, 50 Comments, 10 Share",
                    textScaleFactor: 1.0,
                    // maxLines: ,
                    style: GoogleFonts.roboto(
                        fontSize: 11,
                        color: Gray2,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
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
              )
              //
              // Padding(
              //   padding:
              //       const EdgeInsets.only(top: 16.0, left: 15.0, right: 16.0),
              //   child: Row(
              //     children: <Widget>[
              //       RatingBar(
              //         initialRating: stars,
              //         minRating: 0,
              //         direction: Axis.horizontal,
              //         tapOnlyMode: true,
              //         glow: false,
              //         allowHalfRating: true,
              //         ignoreGestures: true,
              //         itemCount: 5,
              //         itemSize: 19,
              //         itemBuilder: (context, _) => Icon(
              //           Icons.star,
              //           color: Colors.amber,
              //         ),
              //         onRatingUpdate: (rating) {
              //           print(rating);
              //         },
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 8.0),
              //         child: Text(
              //           "${stars} (${reviews})",
              //           textScaleFactor: 1.0,
              //           style: TextStyle(fontSize: 16),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // _buildPrice(context, price, oldPrice, free)
            ],
          ),
        ),
      ),
    );
  }

  _buildPrice(context, price, oldPrice, free) {
    if (free) return Center();
    print(oldPrice.toString());
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
      child: Row(
        children: <Widget>[
          Text(
            price,
            textScaleFactor: 1.0,
            style: Theme.of(context).primaryTextTheme.headline.copyWith(
                color: dark,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          Visibility(
            visible: oldPrice != null,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                oldPrice.toString(),
                textScaleFactor: 1.0,
                style: Theme.of(context).primaryTextTheme.headline.copyWith(
                    color: HexColor.fromHex("#999999"),
                    fontStyle: FontStyle.normal,
                    decoration: TextDecoration.lineThrough),
              ),
            ),
          )
        ],
      ),
    );
  }
}

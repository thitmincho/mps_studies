import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:myanmar_political_studies/data/models/course/CourcesResponse.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:myanmar_political_studies/ui/screen/category_detail/category_detail_screen.dart';
import 'package:myanmar_political_studies/ui/screen/course/course_screen.dart';

class CourseGridItem extends StatelessWidget {
  final CoursesBean coursesBean;

  CourseGridItem(this.coursesBean);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          CourseScreen.routeName,
          arguments: CourseScreenArgs(coursesBean),
        );
      },
      child: _buildCard(context),
    );
  }

  _buildCard(context) {
    var rating = 4.0;
    var reviews = 0;
    // if (coursesBean.rating.total != null) {
    //   rating = coursesBean.rating.average.toDouble();
    // }
    // if (coursesBean.rating.total != null) {
    //   reviews = coursesBean.rating.total;
    // }

    var unescape = new HtmlUnescape();
    double imgHeight = (MediaQuery.of(context).size.width > 450) ? 220.0 : 85.0;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Gray5, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 17.0, left: 16.0, right: 16.0),
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
                Container(
                  // height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 5),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel varius neque. Praesent ornare at mi ut iaculis. Praesent id turpis fringilla, scelerisque dui vel, venenatis neque. Mauris ultrices consectetur tristique. Nullam consequat pharetra lectus vitae ullamcorper. Quisque diam lacus, maximus sit amet fringilla sed,",
                      textScaleFactor: 1.0,
                      maxLines: 3,
                      style: GoogleFonts.roboto(fontSize: 13, color: Gray2),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 16.0, right: 16.0, bottom: 12),
                    child: Text(
                      "Continue Reading",
                      textScaleFactor: 1.0,
                      // maxLines: ,
                      style: GoogleFonts.roboto(fontSize: 13, color: Blue1),
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
                  decoration: BoxDecoration(color: Gray5),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 13, left: 16.0, right: 16.0, bottom: 13),
                    child: Text(
                      "250 Likes, 50 Comments, 10 Share",
                      textScaleFactor: 1.0,
                      // maxLines: ,
                      style: GoogleFonts.roboto(fontSize: 11, color: Gray2),
                    ),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 0, left: 16.0, right: 16.0),
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
                )

                // Hero(
                //   tag: coursesBean.id,
                //   child: Image.network(
                //     coursesBean.images.small,
                //     width: double.infinity,
                //     height: imgHeight,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 4.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.pushNamed(
                //         context,
                //         CategoryDetailScreen.routeName,
                //         arguments: CategoryDetailScreenArgs(coursesBean.categories_object.first),
                //       );
                //     },
                //     child: Text(
                //       unescape.convert(coursesBean.categories_object.first.name),
                //       textScaleFactor: 1.0,
                //       maxLines: 1,
                //       overflow: TextOverflow.ellipsis,
                //       style: Theme.of(context)
                //           .primaryTextTheme
                //           .subtitle
                //           .copyWith(color: Colors.black.withOpacity(0.5)),
                //     )
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                //   child: Text(unescape.convert(coursesBean.title)+ '\n',
                //       maxLines: 2,
                //       textScaleFactor: 1,
                //       style: Theme.of(context)
                //           .primaryTextTheme
                //           .subtitle
                //           .copyWith(color: Colors.black,)),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 0.0),
                //   child: Row(
                //     children: <Widget>[
                //       RatingBar(
                //         initialRating: rating,
                //         minRating: 0,
                //         direction: Axis.horizontal,
                //         tapOnlyMode: true,
                //         glow: false,
                //         allowHalfRating: true,
                //         ignoreGestures: true,
                //         itemCount: 5,
                //         itemSize: 14,
                //         itemBuilder: (context, _) => Icon(
                //           Icons.star,
                //           color: Colors.amber,
                //         ),
                //         onRatingUpdate: (rating) {
                //           print(rating);
                //         },
                //       ),
                //       Text(
                //         "$rating ($reviews)",
                //         textScaleFactor: 1.0,
                //         style: Theme.of(context)
                //             .primaryTextTheme
                //             .caption
                //             .copyWith(color: Colors.black),
                //       )
                //     ],
                //   ),
                // ),
                // _buildPrice(context)
              ],
            ),
          )),
    );
  }

  _buildPrice(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 0.0, right: 16.0),
      child: Row(
        children: <Widget>[
          Text(
            coursesBean.price.free ? " " : coursesBean.price.price,
            textScaleFactor: 1.0,
            style: Theme.of(context).primaryTextTheme.subtitle.copyWith(
                color: dark,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              (coursesBean.price.old_price != null)
                  ? coursesBean.price.old_price.toString()
                  : " ",
              textScaleFactor: 1.0,
              style: Theme.of(context).primaryTextTheme.subtitle.copyWith(
                  color: HexColor.fromHex("#999999"),
                  fontStyle: FontStyle.normal,
                  decoration: (coursesBean.price.old_price != null)
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          )
        ],
      ),
    );
  }
}

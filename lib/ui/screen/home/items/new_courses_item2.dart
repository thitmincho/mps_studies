import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:myanmar_political_studies/data/models/category.dart';
import 'package:myanmar_political_studies/data/models/course/CourcesResponse.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:myanmar_political_studies/ui/screen/category_detail/category_detail_screen.dart';
import 'package:myanmar_political_studies/ui/screen/course/course_screen.dart';

class NewCoursesWidget2 extends StatelessWidget {
  final String title;
  final List<CoursesBean> courses;

  NewCoursesWidget2(
    this.title,
    this.courses, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (courses.length != 0)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(color: HexColor.fromHex("#eef1f7")),
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 15.0, bottom: 20),
                    child: Text("Categories",
                        textScaleFactor: 1.0,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .title
                            .copyWith(
                                color: dark,
                                fontSize: 22,
                                fontWeight: FontWeight.bold))),
              ),
              _buildList(context)
            ],
          )
        : Center();
  }

  _buildList(context) {
    return Container(
      // decoration: BoxDecoration(color: HexColor.fromHex("#eef1f7")),
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0, bottom: 20),
        child: ConstrainedBox(
          constraints: new BoxConstraints(minHeight: 300, maxHeight: 350),
          // child: ListView(
          //   padding: const EdgeInsets.all(8.0),
          //   scrollDirection: Axis.horizontal,
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.pushNamed(
          //           context,
          //           CourseScreen.routeName,
          //           // arguments: CourseScreenArgs(item),
          //         );
          //       },
          //       child: Padding(
          //         padding: EdgeInsets.only(left: 20),
          //         child: _buildCard(
          //             context,
          //             "assets/images/postimage.jpg",
          //             null,
          //             "title",
          //             4.5,
          //             "reviews",
          //             "item.price.price",
          //             "item.price.old_price",
          //             "item.price.free"),
          //       ),
          //     ),
          //   ],
          // ),
          child: new ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              var item = courses[index];
              var padding = (index == 0) ? 0.0 : 0.0;

              var rating = 0.0;
              var reviews = 0;
              if (item.rating.total != null) {
                rating = item.rating.average.toDouble();
              }
              if (item.rating.total != null) {
                reviews = item.rating.total;
              }
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CourseScreen.routeName,
                    arguments: CourseScreenArgs(item),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: padding),
                  child: _buildCard(
                      context,
                      item.images.small,
                      item.categories_object.first,
                      "Lorem Ipsum dolor sit amet, consectetur adipicsing elit.",
                      rating,
                      "",
                      item.price.price,
                      item.price.old_price,
                      item.price.free),
                ),
              );
            },
            padding: const EdgeInsets.all(8.0),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  _buildCard(context, image, Category category, title, stars, reviews, price,
      oldPrice, free) {
    var unescape = new HtmlUnescape();

    return SizedBox(
      width: 300,
      child: Card(
        borderOnForeground: true,
        elevation: 3,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Padding(
              //   padding:
              //       const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.pushNamed(
              //         context,
              //         CategoryDetailScreen.routeName,
              //         arguments: CategoryDetailScreenArgs(category),
              //       );
              //     },
              //     child: Text(
              //       "${unescape.convert(category.name)} >",
              //       textScaleFactor: 1.0,
              //       style: TextStyle(
              //           fontSize: 18,
              //           color: HexColor.fromHex("#2a3045").withOpacity(0.5)),
              //     ),
              //   ),
              // ),
              Image.network(
                image,
                width: 320,
                height: 160,
                fit: BoxFit.cover,
              ),
              Container(
                height: 60,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
                  child: Text(
                    unescape.convert(title),
                    textScaleFactor: 1.0,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 18, color: dark, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              // Container(
              //   decoration: BoxDecoration(color: HexColor.fromHex("#eef1f7")),
              //   width: MediaQuery.of(context).size.width,
              //   child: Padding(
              //     padding: const EdgeInsets.only(
              //         top: 10, left: 16.0, right: 16.0, bottom: 10),
              //     child: Text(
              //       "250 Likes, 50 Comments, 10 Share",
              //       textScaleFactor: 1.0,
              //       // maxLines: ,
              //       style: TextStyle(fontSize: 16, color: Gray1),
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(top: 5, left: 16.0, right: 16.0),
                child: Divider(
                  color: Colors.grey[300],
                  thickness: 1.3,
                ),
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: SvgPicture.asset(
              //         "assets/icons/heart.svg",
              //         color: Colors.red,
              //       ),
              //     ),
              //     Expanded(
              //       child: SvgPicture.asset(
              //         "assets/icons/message.svg",
              //         color: Colors.orange,
              //       ),
              //     ),
              //     Expanded(
              //       child: SvgPicture.asset(
              //         "assets/icons/share.svg",
              //         color: Colors.green,
              //       ),
              //     ),
              //   ],
              // )
              //
              Padding(
                padding:
                    const EdgeInsets.only(top: 0.0, left: 15.0, right: 16.0),
                child: Row(
                  children: <Widget>[
                    RatingBar(
                      initialRating: stars,
                      minRating: 0,
                      direction: Axis.horizontal,
                      tapOnlyMode: true,
                      glow: false,
                      allowHalfRating: true,
                      ignoreGestures: true,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        // "${stars} (${reviews})",
                        "၄.၀ (၅ ဦး)",
                        textScaleFactor: 1.0,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Orange),
                // width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 15),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0, left: 10.0, right: 10.0, bottom: 0),
                  child: Text(
                    "သင်ယူရန်",
                    textScaleFactor: 1.0,
                    // maxLines: ,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              // Container(
              //   child: Text("သင်ယူရန်"),
              // )
              // Padding(
              //   padding: null,
              //   child: Text("သင်ယူရန်"),
              // )
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:myanmar_political_studies/data/models/category.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myanmar_political_studies/ui/screen/category_detail/category_detail_screen.dart';
import 'package:myanmar_political_studies/ui/screen/final/final_screen.dart';
import 'package:myanmar_political_studies/ui/screen/user_course_locked/user_course_locked_screen.dart';

class CategoriesWidget extends StatelessWidget {
  // final List<Category> categories;
  final String title;

  CategoriesWidget(
    this.title,
    // this.categories,
    {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // (categories.length != 0) ?
        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15.0),
            child: Text("သင်ခန်းစာများ",
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: "Pyidaungsu",
                  color: Gray1,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ))),
        _buildList(context)
      ],
    );
    // : Center();
  }

  _buildList(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 85,
          maxHeight: 94,
        ),
        child: ListView(
          padding: const EdgeInsets.all(5),
          scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   CategoryDetailScreen.routeName,
                //   // arguments: CategoryDetailScreenArgs(item),
                // );
              },
              child: _buildRow("", Colors.green, "Political Studies"),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   CategoryDetailScreen.routeName,
                //   // arguments: CategoryDetailScreenArgs(item),
                // );
              },
              child: _buildRow("", Colors.blue, "Social Studies"),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   CategoryDetailScreen.routeName,
                //   // arguments: CategoryDetailScreenArgs(item),
                // );
              },
              child: _buildRow("", Colors.orange, "Professional Development"),
            )
          ],
        ),
        // child: new ListView.builder(
        //   itemCount: categories.length,
        //   itemBuilder: (context, index) {
        //     var item = categories[index];
        //     var padding = (index == 0) ? 20.0 : 0.0;
        //     var color =
        //         (item.color != null) ? HexColor.fromHex(item.color) : dark;

        //     return GestureDetector(
        //       onTap: (){
        //         Navigator.pushNamed(
        //           context,
        //           CategoryDetailScreen.routeName,
        //           arguments: CategoryDetailScreenArgs(item),
        //         );
        //       },
        //       child: Padding(
        //         padding: EdgeInsets.only(left: padding),
        //         child: _buildRow(item.image, color, item.name),
        //       ),
        //     );
        //   },
        //   padding: const EdgeInsets.all(8.0),
        //   scrollDirection: Axis.horizontal,
        // ),
      ),
    );
  }

  _buildRow(String imgUrl, color, title) {
    var unescape = new HtmlUnescape();
    var imgFormat = (imgUrl != null && imgUrl != "") ? imgUrl.split(".") : null;

    return Card(
        color: color,
        child: new Container(
          width: 127,
          height: 94,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                (imgFormat != null)
                    ? SizedBox(
                        width: 50,
                        height: 50,
                        child: (imgFormat.last == 'svg')
                            ? SvgPicture.asset(imgUrl,
                                color: HexColor.fromHex("#FFFFFF"))
                            : Image.network(
                                imgUrl,
                                width: double.infinity,
                                height: 50,
                                fit: BoxFit.cover,
                              ))
                    : Center(),
                Padding(
                  // padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    unescape.convert(title),
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.roboto(fontSize: 13, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

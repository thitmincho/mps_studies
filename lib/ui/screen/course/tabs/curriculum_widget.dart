import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myanmar_political_studies/data/models/course/CourseDetailResponse.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:myanmar_political_studies/ui/screen/lesson_video/lesson_video_screen.dart';
import 'package:myanmar_political_studies/ui/screen/text_lesson/text_lesson_screen.dart';

import '../../../../main.dart';

class CurriculumWidget extends StatefulWidget {
  final CourseDetailResponse response;

  CurriculumWidget(this.response) : super();

  @override
  _CurriculumWidgetState createState() => _CurriculumWidgetState();
}

class _CurriculumWidgetState extends State<CurriculumWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildSection("အခန်း ၁", "နိဒါန်း"),
        _buildLesson(context, "သင်ခန်းစာ ဗီဒီယိုဖိုင်", "video"),
        _buildLesson(context, "သင်ခန်းစာ အကြောင်းအရာ", "text"),
        _buildSection("အခန်း ၂", "နိဒါန်း"),
        _buildLesson(context, "သင်ခန်းစာ ဗီဒီယိုဖိုင်", "video"),
        _buildLesson(context, "သင်ခန်းစာ အကြောင်းအရာ", "text"),
        _buildLesson(context, "သင်ခန်းစာ အသံဖိုင်", "stream"),
        _buildLesson(context, "သင်ခန်းစာ မေးခွန်းများ", "quiz"),
        _buildSection("အခန်း ၃", "ပဟေဋိမေးခွန်းများဖြေဆိုရန်"),
        _buildLesson(context, "သင်ခန်းစာ အကြောင်းအရာ", "text"),
        _buildLesson(context, "ဖြေဆိုရန် သင်ခန်းစာများ", "quiz"),
        _buildLesson(context, "နိဂုံးချုပ် ပဟေဋိ မေးခွန်းများ", "quiz"),
      ],
    );
    // return ListView.builder(
    //     itemCount: widget.response.curriculum.length,
    //     itemBuilder: (context, index) {
    //       var curriculumBean = widget.response.curriculum[index];
    //       if (curriculumBean.type == "section") {
    //         return _buildSection(curriculumBean);
    //       } else if (curriculumBean.type == "lesson") {
    //         return _buildLesson(context, curriculumBean);
    //       } else if (curriculumBean.type == "quiz") {
    //         return _buildQuiz(curriculumBean);
    //       }
    //       return Center();
    //     });
  }

  _buildSection(String title, String label) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            textScaleFactor: 1.0,
            style: TextStyle(color: HexColor.fromHex("#AAAAAA")),
          ),
          Text(
            label,
            textScaleFactor: 1.0,
            style: TextStyle(
                color: HexColor.fromHex("#273044"),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  _buildLesson(BuildContext context, String title, String type) {
    // print(type);
    Widget icon = Center();
    if (type == "video")
      icon = SizedBox(
          width: 24,
          height: 24,
          child:
              SvgPicture.asset("assets/icons/ico_play.svg", color: mainColor));
    if (type == "assignment")
      icon = SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset("assets/icons/assignment_icon.svg",
              color: mainColor));
    if (type == "slide")
      icon = SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset("assets/icons/slides_icon.svg",
              color: mainColor));
    if (type == "stream")
      icon = SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset("assets/icons/video-camera.svg",
              color: mainColor));
    if (type == "quiz")
      icon = SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset("assets/icons/ico_question.svg",
              color: mainColor));
    if (type == "text" || type == "")
      icon = SizedBox(
          width: 24,
          height: 24,
          child:
              SvgPicture.asset("assets/icons/ico_text.svg", color: mainColor));

    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Container(
        decoration: BoxDecoration(color: HexColor.fromHex("#F3F5F9")),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16.0, bottom: 16, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              icon,
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    title,
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
              ),
              // (false)
              //     ? Container(
              //         constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
              //         height: 36,
              //         child: MaterialButton(
              //           height: 36,
              //           minWidth: 110,
              //           padding: EdgeInsets.only(left: 0, right: 0),
              //           color: secondColor,
              //           onPressed: () {
              //             switch (curriculumBean.view) {
              //               case "video":
              //                 Navigator.of(context).pushNamed(
              //                   LessonVideoScreen.routeName,
              //                   arguments: LessonVideoScreenArgs(
              //                       widget.response.id,
              //                       int.tryParse(curriculumBean.lesson_id),
              //                       widget.response.author.avatar_url,
              //                       widget.response.author.login,
              //                       false,
              //                       false),
              //                 );
              //                 break;
              //               default:
              //                 Navigator.of(context).pushNamed(
              //                   TextLessonScreen.routeName,
              //                   arguments: TextLessonScreenArgs(
              //                       widget.response.id,
              //                       int.tryParse(curriculumBean.lesson_id),
              //                       widget.response.author.avatar_url,
              //                       widget.response.author.login,
              //                       false,
              //                       false),
              //                 );
              //             }
              //           },
              //           child: Text(
              //               localizations.getLocalization("preview_button"),
              //               textScaleFactor: 1.0,
              //               textAlign: TextAlign.center,
              //               maxLines: 1,
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 letterSpacing: 0.4,
              //               )),
              //         ),
              //       )
              //     : Center(),
            ],
          ),
        ),
      ),
    );
  }

  _buildQuiz(CurriculumBean curriculumBean) {
    Widget icon = SizedBox(
        width: 24,
        height: 24,
        child: SvgPicture.asset("assets/icons/ico_question.svg",
            color: (curriculumBean.has_preview)
                ? mainColor
                : HexColor.fromHex("#2A3045").withOpacity(0.3)));

    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Container(
        decoration: BoxDecoration(color: HexColor.fromHex("#F3F5F9")),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16.0, bottom: 16, left: 20, right: 20),
          child: Row(
            children: <Widget>[
              icon,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    curriculumBean.label,
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

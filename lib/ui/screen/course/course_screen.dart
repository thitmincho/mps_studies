import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:myanmar_political_studies/data/models/course/CourcesResponse.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:myanmar_political_studies/ui/bloc/course/bloc.dart';
import 'package:myanmar_political_studies/ui/screen/category_detail/category_detail_screen.dart';
import 'package:myanmar_political_studies/ui/screen/course/tabs/curriculum_widget.dart';
import 'package:myanmar_political_studies/ui/screen/course/tabs/overview_widget.dart';
import 'package:myanmar_political_studies/ui/screen/detail_profile/detail_profile_screen.dart';
import 'package:myanmar_political_studies/ui/screen/porchase_dialog/purchase_dialog.dart';
import 'package:myanmar_political_studies/ui/screen/search_detail/search_detail_screen.dart';
import 'package:myanmar_political_studies/ui/screen/user_course/user_course.dart';
import 'package:myanmar_political_studies/ui/screen/web_checkout/web_checkout_screen.dart';
import 'package:myanmar_political_studies/ui/widgets/dialog_author.dart';
import 'package:myanmar_political_studies/ui/widgets/loading_error_widget.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../main.dart';
import 'tabs/faq_widget.dart';

class CourseScreenArgs {
  final CoursesBean coursesBean;

  CourseScreenArgs(this.coursesBean);
}

class CourseScreen extends StatelessWidget {
  static const routeName = "courseScreen";
  final CourseBloc _bloc;

  const CourseScreen(this._bloc) : super();

  @override
  Widget build(BuildContext context) {
    return _CourseScreenWidget(null);
    // final CourseScreenArgs args = ModalRoute.of(context).settings.arguments;
    // return BlocProvider<CourseBloc>(
    //     create: (c) => _bloc, child: _CourseScreenWidget(args.coursesBean));
  }
}

class _CourseScreenWidget extends StatefulWidget {
  final CoursesBean coursesBean;

  const _CourseScreenWidget(this.coursesBean);

  @override
  State<StatefulWidget> createState() {
    return _CourseScreenWidgetState();
  }
}

class _CourseScreenWidgetState extends State<_CourseScreenWidget>
    with TickerProviderStateMixin {
  ScrollController _scrollController;
  String title = "";
  Color _favIcoColor = Colors.white;
  AnimationController animation;
  Animation<double> _fadeInFadeOut;
  CourseBloc _bloc;
  bool hasTrial = true;
  bool _isFav = false;
  num kef = 2;

  var screenHeight;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animation, curve: Interval(0.25, 1, curve: Curves.easeIn)));
    animation.forward();

    _scrollController = ScrollController()
      ..addListener(() {
        if (!_isAppBarExpanded) {
          setState(() {
            title = "";
          });
        } else {
          //if (_bloc.account != null) {
          setState(() {
            // title = "${widget.coursesBean.title}";
          });
          //}
        }
      });

    // _bloc = BlocProvider.of<CourseBloc>(context)
    //   ..add(FetchEvent(widget.coursesBean.id));
  }

  @override
  Widget build(BuildContext context) {
    // animation.forward();

    var unescape = new HtmlUnescape();
    kef = (MediaQuery.of(context).size.height > 690) ? kef : 1.8;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: SvgPicture.asset('assets/icons/arrow_back_appbar.svg'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Primary,
                title: Text(
                  title,
                  textScaleFactor: 1.0,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                expandedHeight: MediaQuery.of(context).size.height / kef,
                floating: false,
                pinned: true,
                snap: false,
                actions: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset("assets/icons/search.svg"),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          SearchDetailScreen.routeName,
                          arguments: SearchDetailScreenArgs(""));
                    },
                  ),
                ],
                bottom: ColoredTabBar(
                    Colors.white,
                    TabBar(
                      indicatorColor: mainColorA,
                      tabs: [
                        Tab(
                          child: Text("ခြုံငုံသုံးသပ်ချက်",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Pyidaungsu",
                                  fontSize: 11)),
                          // localizations.getLocalization("course_overview_tab"),
                        ),
                        Tab(
                          child: Text("သင်ရိုးညွှန်းတမ်း",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Pyidaungsu",
                                  fontSize: 11)),
                          // text: localizations.getLocalization(
                          // "course_curriculum_tab")
                        ),
                        Tab(
                          child: Text("အမေးများသောမေးခွန်းများ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Pyidaungsu",
                                  fontSize: 11)),
                          // text: localizations
                          //     .getLocalization("course_faq_tab")
                        ),
                      ],
                    )),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                      child: Stack(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Hero(
                            tag:
                                "https://stylemixthemes.com/masterstudy/academy/wp-content/uploads/sites/9/2018/08/photo-1475452779376-caebfb988090-1949x1299.jpeg",
                            child: FadeInImage.memoryNetwork(
                              image:
                                  "https://stylemixthemes.com/masterstudy/academy/wp-content/uploads/sites/9/2018/08/photo-1475452779376-caebfb988090-1949x1299.jpeg",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / kef,
                              placeholder: kTransparentImage,
                            ),
                          ),
                        ],
                      ),
                      FadeTransition(
                        opacity: _fadeInFadeOut,
                        child: Container(
                          decoration:
                              BoxDecoration(color: mainColor.withOpacity(0.5)),
                        ),
                      ),
                      FadeTransition(
                        opacity: _fadeInFadeOut,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                CategoryDetailScreen.routeName,
                                                arguments:
                                                    CategoryDetailScreenArgs(widget
                                                        .coursesBean
                                                        .categories_object[0]),
                                              );
                                            },
                                            child: Text(
                                              // unescape.convert(widget
                                              //     .coursesBean
                                              //     .categories_object[0]
                                              //     .name),
                                              "သင်တန်းအမျိုးအစား",
                                              textScaleFactor: 1.0,
                                              style: TextStyle(
                                                  fontFamily: "Pyidaungsu",
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_right,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) =>
                                                DialogAuthorWidget(null),
                                          );
                                        },
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg",
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    height: 140,
                                    child: Text(
                                      // unescape.convert(
                                      //     widget.coursesBean.title),
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 32.0, right: 16.0),
                                  child: Row(
                                    children: <Widget>[
                                      RatingBar(
                                        // initialRating: widget
                                        //     .coursesBean.rating.average
                                        //     .toDouble(),
                                        initialRating: 4.0,
                                        minRating: 0,
                                        allowHalfRating: true,
                                        direction: Axis.horizontal,
                                        tapOnlyMode: true,
                                        glow: false,
                                        ignoreGestures: true,
                                        itemCount: 5,
                                        itemSize: 19,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          // "${widget.coursesBean.rating.average.toDouble()} (${widget.coursesBean.rating.total} review)",
                                          "၄.၀ (၅ ဦး)",
                                          textScaleFactor: 1.0,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                ),
              )
            ];
          },
          body: AnimatedSwitcher(
              duration: Duration(milliseconds: 150), child: _buildBody(null)),
          // body: AnimatedSwitcher(
          //     duration: Duration(milliseconds: 150), child: _buildBody(state)),
        ),
        bottomNavigationBar: _buildBottom(null),
      ),
    );
  }

  _buildBody(state) {
    return TabBarView(
      children: <Widget>[
        OverviewWidget(null, null),
        CurriculumWidget(null),
        FaqWidget(null),
        // CurriculumWidget(state.courseDetailResponse),
        // FaqWidget(state.courseDetailResponse),
      ],
    );
  }

  bool get _isAppBarExpanded {
    if (screenHeight == null) screenHeight = MediaQuery.of(context).size.height;
    return _scrollController.hasClients &&
        _scrollController.offset >
            (screenHeight / kef - (kToolbarHeight * kef));
  }

  _buildBottom(CourseState state) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor.fromHex("#F6F6F6"),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildPrice(null),
          ],
        ),
      ),
    );
  }

  _buildPrice(CourseState state) {
    return GestureDetector(
      onTap: () async {
        var dialog = showDialog(
            context: context,
            builder: (builder) {
              return BlocProvider.value(
                child: Dialog(
                  child: PurchaseDialog(),
                ),
                value: _bloc,
              );
            });

        dialog.then((value) {
          if (value == "update") {
            // _bloc.add(FetchEvent(widget.coursesBean.id));
          } else {
            setState(() {});
          }
        });
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
                    "အသင်းဝင်မယ်",
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
                  child: Icon(Icons.arrow_drop_down, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget setUpButtonChild(CourseState state) {
    String buttonText;
    bool enable = state is LoadedCourseState;

    if (state is LoadedCourseState) {
      buttonText = state.courseDetailResponse.purchase_label;
    }

    if (enable == true) {
      return new Text(
        buttonText.toUpperCase(),
        textScaleFactor: 1.0,
      );
    } else {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
  }

  _buildStartButton(LoadedCourseState state) {
    return MaterialButton(
      height: 40,
      color: secondColor,
      onPressed: () {
        Navigator.of(context).pushNamed(
          UserCourseScreen.routeName,
          arguments: UserCourseScreenArgs(
            state.courseDetailResponse.id.toString(),
            widget.coursesBean.title,
            widget.coursesBean.images.small,
            state.courseDetailResponse.author.avatar_url,
            state.courseDetailResponse.author.login,
            "0",
            "1",
            "2",
            "2",
          ),
        );
      },
      child: Text(
        localizations.getLocalization("start_course_button"),
        textScaleFactor: 1.0,
        style: TextStyle(color: white),
      ),
    );
  }
}

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:myanmar_political_studies/data/models/account.dart';
import 'package:myanmar_political_studies/data/models/category.dart';
import 'package:myanmar_political_studies/main.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:myanmar_political_studies/ui/bloc/detail_profile/bloc.dart';
import 'package:myanmar_political_studies/ui/screen/category_detail/category_detail_screen.dart';
import 'package:myanmar_political_studies/ui/screen/course/course_screen.dart';
import 'package:myanmar_political_studies/ui/screen/search_detail/search_detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailProfileScreenArgs {
  Account account;
  int teacherId;

  DetailProfileScreenArgs(this.account);

  DetailProfileScreenArgs.fromId(this.teacherId);
}

class DetailProfileScreen extends StatelessWidget {
  static const routeName = "detailProfileScreen";
  final DetailProfileBloc _bloc;

  const DetailProfileScreen(this._bloc) : super();

  @override
  Widget build(BuildContext context) {
    return DetailProfileWidget();
    // final DetailProfileScreenArgs args =
    //     ModalRoute.of(context).settings.arguments;
    // if (args.teacherId != null) {
    //   _bloc.setTeacherId(args.teacherId);
    // } else {
    //   _bloc.setAccount(args.account);
    // }
    // return BlocProvider<DetailProfileBloc>(
    //     create: (context) => _bloc, child: DetailProfileWidget());
  }
}

class DetailProfileWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailProfileWidgetState();
  }
}

class _DetailProfileWidgetState extends State<DetailProfileWidget> {
  DetailProfileBloc _bloc;
  ScrollController _scrollController;
  String title = "";
  num kef = 2;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (!_isAppBarExpanded) {
          setState(() {
            title = "";
          });
        } else {
          if (_bloc.account != null) {
            setState(() {
              title = "ဆရာ ဦးအောင်အောင်";
            });
          }
        }
      });
    // _bloc = BlocProvider.of<DetailProfileBloc>(context)
    //   ..add(LoadDetailProfile());
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset >
            (MediaQuery.of(context).size.height / kef - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    kef = (MediaQuery.of(context).size.height > 690) ? kef : 1.8;

    var isTeacher = true;

    var tabsCount = 2;

    // return BlocBuilder<DetailProfileBloc, DetailProfileState>(
    //   builder: (context, state) {
    return DefaultTabController(
      length: tabsCount,
      child: Scaffold(
        body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              var avatar = ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Image.network(
                  "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg",
                  fit: BoxFit.cover,
                  height: 100.0,
                  width: 100.0,
                ),
              );

              return <Widget>[
                SliverAppBar(
                  leading: IconButton(
                    icon:
                        SvgPicture.asset('assets/icons/arrow_back_appbar.svg'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Text(
                    "ဆရာ ဦးအောင်အောင်",
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  expandedHeight: MediaQuery.of(context).size.height / kef + 50,
                  floating: false,
                  // <--- this is required if you want the appbar to come back into view when you scroll up
                  pinned: true,
                  // <--- this will make the appbar disappear on scrolling down
                  snap: false,
                  actions: <Widget>[
                    // Visibility(
                    //   visible: isTeacher,
                    //   child: IconButton(
                    //     icon: Icon(Icons.share),
                    //     onPressed: () {},
                    //   ),
                    // ),
                    Visibility(
                      visible: false,
                      child: IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                    ),
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
                      indicatorColor: Blue1,
                      tabs: _getTabs(null),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      background: SafeArea(
                        child: Container(
                          color: Primary,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(top: 50.0),
                                    child: avatar),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "ဆရာ ဦးအောင်အောင်",
                                    // textScaleFactor: 1.0,
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Visibility(
                                  visible: isTeacher,
                                  child: Text(
                                    "ဆရာ",
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5)),
                                  ),
                                ),
                                Visibility(
                                  visible: isTeacher,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        RatingBar(
                                          initialRating: 4.5,
                                          minRating: 0,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 16,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          glow: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 50),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.0, right: 5.0),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: SizedBox(
                                                width: 32,
                                                height: 32,
                                                child: SvgPicture.asset(
                                                    "assets/icons/social_facebook_circle.svg",
                                                    color: Colors.white)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.0, right: 5.0),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: SizedBox(
                                                width: 32,
                                                height: 32,
                                                child: SvgPicture.asset(
                                                    "assets/icons/social_instagram_circle.svg",
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ];
            },
            body: getBody(null)),
      ),
    );
    // },
    // );
  }

  _launchURL(String url) async {
    await launch(url);
  }

  Widget getBody(state) {
    return TabBarView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget tempus ex. Mauris sollicitudin arcu eu lacinia tincidunt. In eu commodo quam. Curabitur convallis lectus ac nulla dignissim, id pulvinar nisi fringilla. Sed sollicitudin est sed dolor sagittis, in iaculis risus blandit. Nunc ut massa sed felis fermentum interdum nec quis velit. Nunc nisl sem, congue a eleifend vel, auctor quis nisl. Nullam non arcu venenatis, gravida est a, ullamcorper lacus. Sed eros nunc, euismod ut lacus id, malesuada interdum tellus. Sed malesuada pharetra lacus a vehicula. In rutrum risus neque, vitae rhoncus sem auctor sit amet. Sed sed erat velit. Nullam rutrum augue non ante cursus, sed placerat dolor accumsan. Maecenas rutrum ex id velit semper aliquam. Cras id ultrices ex. Nam ac tortor maximus, pretium turpis eget, malesuada felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent non velit gravida nibh rhoncus viverra. In sit amet ante eget quam bibendum vestibulum. Donec commodo risus a ipsum malesuada lacinia. Nulla elementum est odio, eu placerat eros tincidunt id. Aliquam vel ultrices lorem. Nullam non ultricies arcu, sit amet tincidunt justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean malesuada at leo ut malesuada. Praesent cursus ultricies ultricies. In hac habitasse platea dictumst.Vivamus et maximus arcu, vitae lacinia sapien. Cras molestie libero sed aliquam ullamcorper. Nunc at erat et arcu tincidunt porta. Nam et pulvinar nulla, in rutrum enim. Pellentesque posuere dolor id nunc tristique aliquam. Quisque nec tristique nisi. Sed rutrum lorem diam, vestibulum malesuada erat lobortis et. Donec non turpis et mauris tincidunt vestibulum. Nulla tempus, mauris efficitur scelerisque egestas, magna lorem bibendum ex, sed feugiat elit metus eu orci. Curabitur blandit mi eget quam volutpat tempor. Nam volutpat auctor nulla in ultricies.",
            textScaleFactor: 1.0,
          ),
        ),
        ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            var item = index;
            var padding = (index == 0) ? 20.0 : 0.0;

            var rating = 4.0;
            var reviews = 0;

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CourseScreen.routeName,
                  // arguments: CourseScreenArgs(item),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                // child: Text("hi"),
                child: _buildCard(
                    context,
                    "https://stylemixthemes.com/masterstudy/academy/wp-content/uploads/sites/9/2018/08/photo-1475452779376-caebfb988090-1949x1299.jpeg",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    4.5,
                    reviews,
                    "item.price.price",
                    "item.price.old_price",
                    true),
              ),
            );
          },
        ),
      ],
    );
  }

  List<Widget> _getTabs(state) {
    List<Widget> tabs = List();

    tabs.addAll([
      Tab(
        // text: localizations.getLocalization("profile_bio_tab"),
        child: Text(
          'ဆရာ အကြောင်း',
          style: TextStyle(color: Colors.black, fontSize: 11),
        ),
      ),
      Tab(
        // text: localizations.getLocalization("profile_courses_tab")
        child: Text(
          'သင်ခန်းစာများ',
          style: TextStyle(color: Colors.black, fontSize: 11),
        ),
      ),
    ]);

    return tabs;
  }

  _buildCard(context, image, title, stars, reviews, price, oldPrice, free) {
    var unescape = new HtmlUnescape();

    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        child: Card(
          borderOnForeground: true,
          elevation: 3,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FadeInImage.memoryNetwork(
                  image: image,
                  placeholder: kTransparentImage,
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Political Studies",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor.fromHex("#2a3045").withOpacity(0.5)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 6.0, left: 16.0, right: 16.0),
                  child: Text(
                    title,
                    textScaleFactor: 1.0,
                    maxLines: 2,
                    style: TextStyle(fontSize: 20, color: dark),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: Divider(
                    color: HexColor.fromHex("#e0e0e0"),
                    thickness: 1.3,
                  ),
                ),
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
                        allowHalfRating: true,
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
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "၄.၅ (၅ ဦး)",
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildPrice(context, price, oldPrice, free),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildPrice(context, price, oldPrice, free) {
    if (free) return Center();
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

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar(this.color, this.tabBar);

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: tabBar,
      );
}

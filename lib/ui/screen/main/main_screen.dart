import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterstudy_app/data/models/AppSettings.dart';
import 'package:masterstudy_app/main.dart';
import 'package:masterstudy_app/ui/screen/courses/courses_screen.dart';
import 'package:masterstudy_app/ui/screen/favorites/favorites_screen.dart';
import 'package:masterstudy_app/ui/screen/home/home_screen.dart';
import 'package:masterstudy_app/ui/screen/home_simple/home_simple_screen.dart';
import 'package:masterstudy_app/ui/screen/profile/profile_screen.dart';
import 'package:masterstudy_app/ui/screen/search/search_screen.dart';

import '../../../theme/theme.dart';

class MainScreenArgs {
  final OptionsBean optionsBean;

  MainScreenArgs(this.optionsBean);
}

class MainScreen extends StatelessWidget {
  static const routeName = "mainScreen";

  const MainScreen() : super();

  @override
  Widget build(BuildContext context) {
    final MainScreenArgs args = ModalRoute.of(context).settings.arguments;

    return MainScreenWidget(args.optionsBean);
  }
}

class MainScreenWidget extends StatefulWidget {
  final OptionsBean optionsBean;

  const MainScreenWidget(this.optionsBean) : super();

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreenWidget> {
  String token;
  var _selectedIndex = 0;
  final _selectedItemColor = Color(0xFF191970);
  final _selectedBgColor = Colors.white;
  final _unselectedItemColor = Colors.white;
  final _unselectedBgColor = Color(0xFF191970);
  final Widget search = SvgPicture.asset('assets/icons/search.svg');

  Color _getBgColor(int index) =>
      _selectedIndex == index ? _selectedBgColor : _unselectedBgColor;

  Color _getItemColor(int index) =>
      _selectedIndex == index ? _selectedItemColor : _unselectedItemColor;

  Widget _buildIcon(String iconData, String text, int index) => Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Material(
          color: _getBgColor(index),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Icon(iconData),
                Padding(
                  padding: EdgeInsets.only(top: 2.0, bottom: 4.0),
                  child: SvgPicture.asset(iconData,
                      height: 22.0, color: _getItemColor(index)),
                ),
                Text(text,
                    textScaleFactor: 1.0,
                    style:
                        TextStyle(fontSize: 12, color: _getItemColor(index))),
              ],
            ),
            onTap: () => _onItemTapped(index),
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor.fromHex("#191970"),
        centerTitle: true,
        title: SvgPicture.asset('assets/icons/MPS-Logo.svg'),
        actions: [IconButton(icon: search, onPressed: null)],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              Primary, //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
          child: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        new Container(
                          height: 130,
                          child: UserAccountsDrawerHeader(
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/drawer_header.jpg")),
                            ),
                            accountEmail: Text(''),
                            accountName: Row(
                              children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/user.png")),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Maxart Olivia',
                                      style: new TextStyle(
                                        color: Colors.white,
                                        // textBaseline: TextAlign.left,
                                      ),
                                    ),
                                    Text(
                                      '+95 9 123 456 789',
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                    // Text(
                                    //   'Edit Profile >',
                                    //   style: new TextStyle(color: Colors.white),
                                    // ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Edit Profile",
                                            style: new TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: SvgPicture.asset(
                                                "assets/icons/chevron_right.svg"),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        new ListTile(
                          // contentPadding: EdgeInsets.all(0),
                          leading:
                              SvgPicture.asset("assets/icons/sidebar_home.svg"),
                          title: new Text(
                            'ပင်မစာမျက်နှာ',
                            style: TextStyle(
                              fontFamily: 'Pyidaungsu',
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                          onTap: () {
                            this.setState(() {
                              // screen = 1;
                            });
                            Navigator.pop(context);
                          },
                          // shape: ,
                        ),
                        new ListTile(
                          leading:
                              SvgPicture.asset("assets/icons/sidebar_book.svg"),
                          title: new Text(
                            'အပ်နှံထားသောအတန်းများ',
                            style: TextStyle(
                              fontFamily: 'Pyidaungsu',
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                          onTap: () {
                            this.setState(() {
                              // screen = 0;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        new ListTile(
                          leading: SvgPicture.asset(
                              "assets/icons/sidebar_group.svg"),
                          title: new Text(
                            'ကျွန်ုပ်အကြောင်း',
                            style: TextStyle(
                              fontFamily: 'Pyidaungsu',
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                          onTap: () {
                            this.setState(() {
                              // screen = 0;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        new ListTile(
                          leading: SvgPicture.asset(
                              "assets/icons/sidebar_contact.svg"),
                          title: new Text(
                            'ဆက်သွယ်ရန်',
                            style: TextStyle(
                              fontFamily: 'Pyidaungsu',
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                          onTap: () {
                            this.setState(() {
                              // screen = 0;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        new ListTile(
                          leading: SvgPicture.asset(
                              "assets/icons/sidebar_setting.svg"),
                          title: new Text(
                            'ပြင်ဆင်ရန်',
                            style: TextStyle(
                              fontFamily: 'Pyidaungsu',
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                          onTap: () {
                            this.setState(() {
                              // screen = 0;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        new ListTile(
                          leading: SvgPicture.asset(
                              "assets/icons/sidebar_share.svg"),
                          title: new Text(
                            'ဝေမျှမည်',
                            style: TextStyle(
                              fontFamily: 'Pyidaungsu',
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                          onTap: () {
                            this.setState(() {
                              // screen = 0;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        new ListTile(
                          leading: SvgPicture.asset(
                              "assets/icons/sidebar_logoff.svg"),
                          title: new Text(
                            'ထွက်ခွာရန်',
                            style: TextStyle(
                              fontFamily: 'Pyidaungsu',
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                          onTap: () {
                            this.setState(() {
                              // screen = 0;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        new Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 40,
                              height: 35,
                              margin:
                                  new EdgeInsets.symmetric(horizontal: 20.0),
                              child: RaisedButton(
                                  color: Orange,
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                      "assets/icons/arrow_back.svg")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: _getBody(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _buildIcon("assets/icons/tab_home.svg", "ပင်မစာမျက်နှာ", 0),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: _buildIcon("assets/icons/tab_book.svg", "သင်ခန်းစာများ", 1),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: _buildIcon("assets/icons/tab_blog.svg", "ဆောင်းပါးများ", 2),
              title: SizedBox.shrink()),
        ],
        selectedFontSize: 0,
        currentIndex: _selectedIndex,
        selectedItemColor: _selectedItemColor,
        unselectedItemColor: _unselectedItemColor,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return (widget.optionsBean?.app_view ?? true)
            ? HomeSimpleScreen()
            : HomeScreen();
      case 1:
        return CoursesScreen(() {
          setState(() {
            _selectedIndex = 0;
          });
        });
      case 2:
        return SearchScreen();
      case 3:
        return FavoritesScreen();
      case 4:
        return ProfileScreen(() {
          setState(() {
            _selectedIndex = 1;
          });
        });
      default:
        return Center(
          child: Text(
            "Not implemented!",
            textScaleFactor: 1.0,
          ),
        );
    }
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inject/inject.dart';
import 'package:masterstudy_app/data/models/AppSettings.dart';
import 'package:masterstudy_app/main.dart';
import 'package:masterstudy_app/theme/theme.dart';
import 'package:masterstudy_app/ui/bloc/splash/bloc.dart';
import 'package:masterstudy_app/ui/screen/auth/auth_screen.dart';
import 'package:masterstudy_app/ui/screen/home/home_screen.dart';
import 'package:masterstudy_app/ui/screen/home_simple/home_simple_screen.dart';
import 'package:masterstudy_app/ui/screen/main/main_screen.dart';
import 'package:masterstudy_app/ui/widgets/loading_error_widget.dart';
import 'package:masterstudy_app/ui/screen/splash/onboard.dart';
import 'package:page_transition/page_transition.dart';

@provide
class SplashScreen extends StatelessWidget {
  static const String routeName = "splashScreen";
  SplashBloc bloc;

  SplashScreen(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => bloc,
        child: SplashWidget(),
      ),
    );
  }
}

class SplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashWidgetState();
  }
}

class SplashWidgetState extends State<SplashWidget> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 8.0 : 8.0,
      width: isCurrentPage ? 8.0 : 8.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white)),
    );
  }

  @override
  void initState() {
    BlocProvider.of<SplashBloc>(context).add(CheckAuthSplashEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (BuildContext context, SplashState state) {
        return Center(child: _buildLogoBlock(state));
      },
    );
  }

  _buildLogoBlock(state) {
    if (state is InitialSplashState)
      return Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            SizedBox(
              width: 212.0,
              child: SvgPicture.asset('assets/icons/main_logo.svg'),
            ),
            CircularProgressIndicator(),
          ],
        ),
      );

    if (state is CloseSplash) {
      // if (state.isSigned) {
      //   openMainPage(state.appSettings.options);
      // } else {
      //   openAuthPage(state.appSettings.options);
      // }
      // //   String imgUrl = "";
      //   String postsCount = "";
      //   if (state.appSettings != null) {
      //     imgUrl = (state.appSettings.options.logo == null)
      //         ? ""
      //         : state.appSettings.options.logo;
      //     if (state.appSettings.addons != null)
      //       dripContentEnabled =
      //           state.appSettings.addons.sequential_drip_content != null &&
      //               state.appSettings.addons.sequential_drip_content == "on";
      //     postsCount = state.appSettings.options.posts_count.toString();
      //   }

      //   appLogoUrl = imgUrl;
      //   return Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       SizedBox(
      //         width: 212.0,
      //         child: SvgPicture.asset('assets/icons/main_logo.svg'),
      //       )
      //     ],
      //   );
      // }
      // if (state is ErrorSplashState) {
      //   return LoadingErrorWidget(() {
      //     BlocProvider.of<SplashBloc>(context).add(CheckAuthSplashEvent());
      //   });
      // }
      var mySLides = getSlides();
      controller = new PageController();
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height - 100,
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
              children: <Widget>[
                SlideTile(
                  imagePath: mySLides[0].getImageAssetPath(),
                  title: mySLides[0].getTitle(),
                ),
                SlideTile(
                  imagePath: mySLides[1].getImageAssetPath(),
                  title: mySLides[1].getTitle(),
                ),
                SlideTile(
                  imagePath: mySLides[2].getImageAssetPath(),
                  title: mySLides[2].getTitle(),
                )
              ],
            ),
          ),
          bottomSheet: slideIndex != 2
              ? Container(
                  color: Primary,
                  // margin: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          controller.animateToPage(2,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.linear);
                        },
                        splashColor: Colors.blue[50],
                        child: Text(
                          "ကျော်မည်",
                          style: TextStyle(
                              fontFamily: 'Pyidaungsu',
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            for (int i = 0; i < 3; i++)
                              i == slideIndex
                                  ? _buildPageIndicator(true)
                                  : _buildPageIndicator(false),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          print("this is slideIndex: $slideIndex");
                          controller.animateToPage(slideIndex + 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                        },
                        splashColor: Colors.blue[50],
                        child: Text(
                          "နောက်သို့",
                          style: TextStyle(
                              fontFamily: 'Pyidaungsu',
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                )
              : InkWell(
                  onTap: () {
                    // SchedulerBinding.instance.addPostFrameCallback((_) {
                    //   Future.delayed(const Duration(milliseconds: 2000), () {
                    //     Navigator.of(context).pushReplacementNamed(
                    //         AuthScreen.routeName,
                    //         arguments:
                    //             AuthScreenArgs(state.appSettings.options));
                    //   });
                    // });
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      // Future.delayed(const Duration(milliseconds: 2000), () {
                      Navigator.of(context).pushReplacementNamed(
                          MainScreen.routeName,
                          arguments: MainScreenArgs(state.appSettings.options));
                      // });
                    });

                    // if (state.isSigned) {
                    //   openMainPage(state.appSettings.options);
                    // } else {
                    //   openAuthPage(state.appSettings.options);
                    // }
                    // Navigator.push(
                    //   context,
                    //   PageTransition(
                    //     type: PageTransitionType.fade,
                    //     child: HomeSimpleScreen(),
                    //   ),
                    // );
                  },
                  child: Container(
                    height: 50,
                    color: Primary,
                    alignment: Alignment.center,
                    child: Text(
                      "စတင်အသုံးပြုမည်",
                      style: TextStyle(
                          fontFamily: 'Pyidaungsu',
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
        ),
      );
    }
    void openAuthPage(OptionsBean optionsBean) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 2000), () {
          Navigator.of(context).pushReplacementNamed(AuthScreen.routeName,
              arguments: AuthScreenArgs(optionsBean));
        });
      });
    }

    void openMainPage(OptionsBean optionsBean) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 2000), () {
          Navigator.of(context).pushReplacementNamed(MainScreen.routeName,
              arguments: MainScreenArgs(optionsBean));
        });
      });
    }
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700, fontSize: 21, letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}

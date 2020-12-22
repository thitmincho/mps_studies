import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:masterstudy_app/data/models/purchase/UserPlansResponse.dart';
import 'package:masterstudy_app/main.dart';
import 'package:masterstudy_app/theme/theme.dart';
import 'package:masterstudy_app/ui/bloc/plans/bloc.dart';
import 'package:masterstudy_app/ui/screen/web_checkout/web_checkout_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlansScreen extends StatelessWidget {
  static const routeName = "plansScreen";
  final PlansBloc bloc;

  const PlansScreen(this.bloc) : super();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => bloc, child: PlansScreenWidget());
  }
}

class PlansScreenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PlansScreenWidgetState();
  }
}

class PlansScreenWidgetState extends State<PlansScreenWidget> {
  PlansBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<PlansBloc>(context)..add(FetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: HexColor.fromHex("#F3F5F9"),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Primary,
            title: Text(
              // localizations.getLocalization("membership_plans"),
              "Check Out",
              textScaleFactor: 1.0,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  _buildBody(state) {
    if (state is LoadedPlansState) return _buildList(state.plans);
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildList(List<UserPlansBean> plans) {
    return ListView.builder(
        // itemCount: plans.length,
        itemCount: 1,
        itemBuilder: (context, index) {
          var item = plans[index];
          return PlanWidget(
            item,
            onTap: () {
              _openCheckoutScreen(item);
            },
          );
        });
  }

  _openCheckoutScreen(UserPlansBean plansBean) {
    var future = Navigator.pushNamed(
      context,
      WebCheckoutScreen.routeName,
      arguments: WebCheckoutScreenArgs(plansBean.button.url),
    );
    future.then((value) {
      Navigator.pop(context);
    });
  }
}

class PlanWidget extends StatelessWidget {
  final UserPlansBean plansBean;
  final VoidCallback onTap;

  const PlanWidget(this.plansBean, {@required this.onTap}) : super();
  Widget _myListView(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
            title: Text('Sun'),
          ),
          ListTile(
            title: Text('Moon'),
          ),
          ListTile(
            title: Text('Star'),
          ),
        ],
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          // height: 220,
          children: [
            Container(
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // Image >>>>>>>>>>>>>>>>>>>>>>>>
                            Visibility(
                                visible: plansBean.billing_amount != 0,
                                child: Row(
                                  children: [
                                    Text(
                                      "ဈေးနှုန်း - ",
                                      // "\$" +
                                      // plansBean.billing_amount.toString() +
                                      // " ${localizations.getLocalization("plan_per_month")}",
                                      textScaleFactor: 1.0,

                                      style: TextStyle(
                                          fontSize: 14,
                                          color: HexColor.fromHex("2A3045")
                                              .withOpacity(0.8)),
                                    ),
                                    Text(
                                      "၆၀၀၀ ကျပ်",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),

                            // Padding(
                            //   padding: const EdgeInsets.only(top: 8.0),
                            //   child: SizedBox(
                            //     width: 120,
                            //     child: MaterialButton(
                            //       minWidth: double.infinity,
                            //       color: secondColor,
                            //       onPressed: onTap,
                            //       child: Text(
                            //         plansBean.button?.text ?? "GET NOW",
                            //         textScaleFactor: 1.0,
                            //       ),
                            //       textColor: Colors.white,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      Flexible(
                        // child: _buildWebView(plansBean.features),
                        child: _buildWebView(
                            "<p>Public Policy</p><br/><h5>Lerem ipsum amet, adipicigin elit, consectetur docter.</h5>"),
                        flex: 1,
                      )
                    ],
                  ),
                ),
              ),
            ),
            _myListView(context),
          ]

          // child: Column(
          //   children: <Widget>[
          //
          //   ],
          // ),
          // // child:
          ),
    );
  }

  _buildWebView(String description) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Html(
          data: description,
        ),
      ],
    );
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl:
          'data:text/html;base64,${base64Encode(const Utf8Encoder().convert(description))}',
      onPageFinished: (some) async {},
      onWebViewCreated: (controller) async {
        controller.clearCache();
      },
    );
  }
}

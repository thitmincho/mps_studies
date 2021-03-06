import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myanmar_political_studies/data/models/purchase/UserPlansResponse.dart';
import 'package:myanmar_political_studies/main.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:myanmar_political_studies/ui/bloc/plans/bloc.dart';
import 'package:myanmar_political_studies/ui/screen/web_checkout/web_checkout_screen.dart';
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
      child: Column(children: [
        Container(
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 20, right: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset("assets/images/course_checkout.jpg"),
                        // Visibility(
                        //     visible: plansBean.billing_amount != 1,
                        SizedBox(
                          height: 10,
                        ),
                        Row(
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
                                  fontSize: 13,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                        // ),  )
                      ],
                    ),
                  ),
                  Flexible(
                      // child: _buildWebView(plansBean.features),
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Public Policy",
                            style: TextStyle(
                              fontSize: 13,
                              color: Gray3,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Lorem ipsum amet, adipiscing elit. consectetur dolor",
                            style: TextStyle(
                                fontSize: 17,
                                color: Gray1,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                      // _buildWebView(
                      //     "<p>Public Policy</p><br/><h5>Lerem ipsum amet, adipicigin elit, consectetur docter.</h5>"),
                      )
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 20, right: 10, bottom: 20),
              child: Column(children: <Widget>[
                ListTile(
                  leading: Icon(Icons.radio_button_checked),
                  title: Text('kbz pay'.toUpperCase()),
                  trailing: Image.asset("assets/images/KBZ_pay.png",
                      width: 72, height: 39, fit: BoxFit.cover),
                ),
                ListTile(
                  leading: Icon(Icons.radio_button_unchecked),
                  title: Text('Visa card'.toUpperCase()),
                  trailing: Image.asset("assets/images/visacard.png",
                      width: 53, height: 29, fit: BoxFit.cover),
                ),
                ListTile(
                  leading: Icon(Icons.radio_button_unchecked),
                  title: Text('Master card'.toUpperCase()),
                  trailing: Image.asset("assets/images/mastercard.png",
                      width: 47, height: 28, fit: BoxFit.cover),
                ),
              ]),
            ),
          ),
        ),
      ]),
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

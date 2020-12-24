import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:myanmar_political_studies/main.dart';
import 'package:myanmar_political_studies/theme/theme.dart';
import 'package:myanmar_political_studies/ui/bloc/search/bloc.dart';
import 'package:myanmar_political_studies/ui/screen/search_detail/search_detail_screen.dart';
import 'package:myanmar_political_studies/ui/widgets/course_grid_item.dart';
import 'package:myanmar_political_studies/ui/widgets/loading_error_widget.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchScreenWidget();
  }
}

class SearchScreenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchScreenWidgetState();
  }
}

class SearchScreenWidgetState extends State<SearchScreenWidget> {
  SearchScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<SearchScreenBloc>(context)..add(FetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCourses(null),
    );
  }

  _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildBody(LoadedSearchScreenState state) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Visibility(
          //   visible: state.popularSearch.isNotEmpty,
          //   child: Padding(
          //       padding: const EdgeInsets.only(top: 30.0, left: 30.0),
          //       child: Text(localizations.getLocalization("popular_searchs"),
          //           textScaleFactor: 1.0,
          //           style: Theme.of(context)
          //               .primaryTextTheme
          //               .headline
          //               .copyWith(color: dark, fontStyle: FontStyle.normal))),
          // ),
          // _buildChips(state),
          // Padding(
          //     padding: const EdgeInsets.only(top: 30.0, left: 30.0),
          //     child: Text(localizations.getLocalization("new_courses"),
          //         textScaleFactor: 1.0,
          //         style: Theme.of(context)
          //             .primaryTextTheme
          //             .headline
          //             .copyWith(color: dark, fontStyle: FontStyle.normal))),
          _buildCourses(state)
        ],
      ),
    );
  }

  _buildCourses(LoadedSearchScreenState state) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        child: ListView(
          children: [
            CourseGridItem(null),
            CourseGridItem(null),
            CourseGridItem(null),
            CourseGridItem(null),
          ],
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    //   child: Container(
    //     child: StaggeredGridView.countBuilder(
    //       shrinkWrap: true,
    //       physics: const NeverScrollableScrollPhysics(),
    //       crossAxisCount: 1,
    //       staggeredTileBuilder: (_) => StaggeredTile.fit(1),
    //       mainAxisSpacing: 4.0,
    //       crossAxisSpacing: 4.0,
    //       padding: const EdgeInsets.all(2.0),
    //       itemCount: state.newCourses.length,
    //       itemBuilder: (context, index) {
    //         var item = state.newCourses[index];
    //         return CourseGridItem(item);
    //       },
    //     ),
    //   ),
    // );
  }

  _buildChips(LoadedSearchScreenState state) {
    var unescape = new HtmlUnescape();
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 16),
      child: Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: state.popularSearch
              .map((value) => chip(unescape.convert(value)))
              .toList()),
    );
  }

  Widget chip(String label) {
    return GestureDetector(
        onTap: () {
          print(label);
          Navigator.of(context).pushNamed(
            SearchDetailScreen.routeName,
            arguments: SearchDetailScreenArgs(label),
          );
        },
        child: Chip(
          labelPadding: EdgeInsets.all(5.0),
          label: Text(
            label,
            textScaleFactor: 1.0,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 2.0,
          shadowColor: Colors.grey[60],
          padding: EdgeInsets.all(6.0),
        ));
  }
}

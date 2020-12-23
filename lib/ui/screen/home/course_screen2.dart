import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inject/inject.dart';
import 'package:masterstudy_app/ui/bloc/home/bloc.dart';
import 'package:masterstudy_app/ui/widgets/loading_error_widget.dart';

import '../../../theme/theme.dart';
import 'items/categories_item.dart';
// import 'items/new_courses_item.dart';
import 'items/new_courses_item2.dart';
import 'items/top_instructors.dart';
import 'items/trending_item.dart';

@provide
class CourseScreen2 extends StatefulWidget {
  const CourseScreen2() : super();

  @override
  State<StatefulWidget> createState() {
    return _CourseScreen2State();
  }
}

class _CourseScreen2State extends State<CourseScreen2> {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context)..add(FetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //     backgroundColor: HexColor.fromHex("#191970"),
        //     centerTitle: true,
        //     title: Text(
        //       "HOME",
        //       textScaleFactor: 1.0,
        //       style: TextStyle(fontSize: 16.0, color: Colors.white),
        //     )),
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(0),
        //   child: AppBar(
        //     brightness: Brightness.dark,
        //   ),
        // ),
        body: BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return _buildBody(context, state);
      },
    ));
  }

  _buildBody(context, state) {
    if (state is LoadedHomeState) {
      return ListView.builder(
          itemCount: state.layout.length,
          itemBuilder: (context, index) {
            var item = state.layout[index];
            switch (item.id) {
              // case 3:
              //   return TrendingWidget(true, item.name, state.coursesTranding);
              // case 4:
              //   return TopInstructorsWidget(item.name, state.instructors);
              case 1:
                return NewCoursesWidget2(item.name, state.coursesNew);
              case 2:
                return NewCoursesWidget2(item.name, state.coursesNew);
              case 3:
                return NewCoursesWidget2(item.name, state.coursesNew);
              case 4:
                return NewCoursesWidget2(item.name, state.coursesNew);
              case 5:
                return NewCoursesWidget2(item.name, state.coursesNew);
              // case 5:
              //   return TrendingWidget(false, item.name, state.coursesFree);
              default:
              // return CategoriesWidget(item.name, state.categoryList);
              // return NewCoursesWidget(item.name, state.coursesNew);
            }
          });
    }
    if (state is InitialHomeState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ErrorHomeState) {
      return LoadingErrorWidget(() {
        _bloc.add(FetchEvent());
      });
    }
  }
}

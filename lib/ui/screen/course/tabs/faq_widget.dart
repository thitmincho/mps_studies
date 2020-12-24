import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myanmar_political_studies/data/models/course/CourseDetailResponse.dart';
import 'package:myanmar_political_studies/theme/theme.dart';

class FaqWidget extends StatelessWidget {
  final CourseDetailResponse response;

  const FaqWidget(this.response) : super();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          title: Text(
            "What is Lorem ipsum dolor sit amet?",
            textScaleFactor: 1.0,
            style: TextStyle(color: HexColor.fromHex("#273044"), fontSize: 18),
          ),
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget tempus ex. Mauris sollicitudin arcu eu lacinia tincidunt. In eu commodo quam. Curabitur convallis lectus ac nulla dignissim, id pulvinar nisi fringilla. Sed sollicitudin est sed dolor sagittis, in iaculis risus blandit. Nunc ut massa sed felis fermentum interdum nec quis velit. Nunc nisl sem, congue a eleifend vel, auctor quis nisl. Nullam non arcu venenatis, gravida est a, ullamcorper lacus. Sed eros nunc, euismod ut lacus id, malesuada interdum tellus. Sed malesuada pharetra lacus a vehicula. In rutrum risus neque, vitae rhoncus sem auctor sit amet. Sed sed erat velit.",
                textScaleFactor: 1.0,
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            "How to do Lorem ipsum dolor sit amet?",
            textScaleFactor: 1.0,
            style: TextStyle(color: HexColor.fromHex("#273044"), fontSize: 18),
          ),
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget tempus ex. Mauris sollicitudin arcu eu lacinia tincidunt. In eu commodo quam. Curabitur convallis lectus ac nulla dignissim, id pulvinar nisi fringilla. Sed sollicitudin est sed dolor sagittis, in iaculis risus blandit. Nunc ut massa sed felis fermentum interdum nec quis velit. Nunc nisl sem, congue a eleifend vel, auctor quis nisl. Nullam non arcu venenatis, gravida est a, ullamcorper lacus. Sed eros nunc, euismod ut lacus id, malesuada interdum tellus. Sed malesuada pharetra lacus a vehicula. In rutrum risus neque, vitae rhoncus sem auctor sit amet. Sed sed erat velit.",
                textScaleFactor: 1.0,
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            "Can I Lorem ipsum dolor sit amet?",
            textScaleFactor: 1.0,
            style: TextStyle(color: HexColor.fromHex("#273044"), fontSize: 18),
          ),
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget tempus ex. Mauris sollicitudin arcu eu lacinia tincidunt. In eu commodo quam. Curabitur convallis lectus ac nulla dignissim, id pulvinar nisi fringilla. Sed sollicitudin est sed dolor sagittis, in iaculis risus blandit. Nunc ut massa sed felis fermentum interdum nec quis velit. Nunc nisl sem, congue a eleifend vel, auctor quis nisl. Nullam non arcu venenatis, gravida est a, ullamcorper lacus. Sed eros nunc, euismod ut lacus id, malesuada interdum tellus. Sed malesuada pharetra lacus a vehicula. In rutrum risus neque, vitae rhoncus sem auctor sit amet. Sed sed erat velit.",
                textScaleFactor: 1.0,
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            "How much Lorem ipsum dolor sit amet?",
            textScaleFactor: 1.0,
            style: TextStyle(color: HexColor.fromHex("#273044"), fontSize: 18),
          ),
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget tempus ex. Mauris sollicitudin arcu eu lacinia tincidunt. In eu commodo quam. Curabitur convallis lectus ac nulla dignissim, id pulvinar nisi fringilla. Sed sollicitudin est sed dolor sagittis, in iaculis risus blandit. Nunc ut massa sed felis fermentum interdum nec quis velit. Nunc nisl sem, congue a eleifend vel, auctor quis nisl. Nullam non arcu venenatis, gravida est a, ullamcorper lacus. Sed eros nunc, euismod ut lacus id, malesuada interdum tellus. Sed malesuada pharetra lacus a vehicula. In rutrum risus neque, vitae rhoncus sem auctor sit amet. Sed sed erat velit.",
                textScaleFactor: 1.0,
              ),
            )
          ],
        ),
      ],
    );
    // return ListView.builder(
    //     itemCount: response.faq.length,
    //     itemBuilder: (context, index) {
    //       var item = response.faq[index];
    //       return ExpansionTile(
    //         title: Text(
    //           item.question,
    //           textScaleFactor: 1.0,
    //           style:
    //               TextStyle(color: HexColor.fromHex("#273044"), fontSize: 18),
    //         ),
    //         children: <Widget>[
    //           Padding(
    //             padding: const EdgeInsets.only(
    //                 left: 20.0, right: 20.0, bottom: 20.0),
    //             child: Text(
    //               item.answer,
    //               textScaleFactor: 1.0,
    //             ),
    //           )
    //         ],
    //       );
    //     });
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterstudy_app/theme/theme.dart';

class Button_Three extends StatelessWidget {
  const Button_Three({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: MediaQuery.of(context).size.width,
        // width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 11),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Orange, width: 2)
            // color: Orange,
            ),
        child: Text(
          text.toUpperCase(),
          style: GoogleFonts.poppins(
              fontSize: 15, color: Orange, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

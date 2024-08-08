import 'package:appscrip/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCardWidget extends StatelessWidget {
  const DetailsCardWidget({
    super.key,
    required this.size,
    required this.userDetails,
    required this.style,
    this.mainTitle,
    this.subTitletitle1,
    this.subTitletitle2,
    this.subTitletitle3,
    this.subTitletitle4,
    required this.text1,
    required this.text2,
    required this.text3,
    this.text4,
  });

  final Size size;
  final UserModel userDetails;
  final TextStyle style;
  final String? mainTitle;
  final String? subTitletitle1;
  final String? subTitletitle2;
  final String? subTitletitle3;
  final String? subTitletitle4;
  final String text1;
  final String text2;
  final String text3;
  final String? text4;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: size.height * 0.2,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey,
                  offset: Offset(1, 3))
            ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainTitle??'',
                style: GoogleFonts.roboto(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$subTitletitle1 : $text1',
                      style: GoogleFonts.raleway(color: Colors.blueGrey,fontSize: 18,fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '$subTitletitle2 : $text2',
                      style: style,
                    ),
                    Text(
                      '$subTitletitle3 : $text3',
                      style: style,
                    ),
                   text4==null?Container(): Text(
                      '$subTitletitle4 : $text4',
                      style: style,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
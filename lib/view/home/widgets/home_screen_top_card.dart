import 'package:appscrip/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageTopCard extends StatelessWidget {
  const HomePageTopCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.2,
          decoration: const BoxDecoration(gradient: AppColors.gradient),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            height: size.height * 0.10,
            width: size.width * 0.25,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/lamp_png.png'))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 15),
          child: Text(
            'Users Collection',
            style: GoogleFonts.roboto(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70, left: 15),
          child: Text(
            '"Empowering connections by bringing people \ntogether through seamless user management."',
            style: GoogleFonts.roboto(
                fontSize: 11, fontStyle: FontStyle.italic, color: Colors.white),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: size.height * 0.13,
            width: size.width * 0.40,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/home_screen_image.png'))),
          ),
        ),
      ],
    );
  }
}

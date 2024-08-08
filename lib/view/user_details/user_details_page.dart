import 'package:appscrip/constants/app_colors.dart';
import 'package:appscrip/model/user_model.dart';
import 'package:appscrip/view/user_details/widgets/card_widget.dart';
import 'package:appscrip/view/user_details/widgets/custom_text_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class UserDetailsPage extends StatelessWidget {
  final UserModel userDetails;
  final Size size;
  UserDetailsPage({super.key, required this.userDetails, required this.size});
  final TextStyle style = GoogleFonts.roboto();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(gradient: AppColors.gradient),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.75,
              width: size.width,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      userDetails.name ?? '',
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      userDetails.username ?? '',
                      style: style,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTextCard(title:'Website', text: userDetails.website??'',),
                          CustomTextCard(title:'Mob',text: userDetails.phone??'',),
                        ],
                      ),
                    ),
                    DetailsCardWidget(
                      mainTitle: 'Company Info',
                      subTitletitle1: 'Company',
                      text1: userDetails.company?.name??'',
                      subTitletitle2: 'Slogan',
                      text2: userDetails.company?.catchPhrase??'',
                      subTitletitle3: 'Business',
                      text3: userDetails.company?.bs??'',
                        size: size, userDetails: userDetails, style: style),
                    DetailsCardWidget(
                      mainTitle: 'Address',
                      subTitletitle1: 'Street',
                      text1: userDetails.address?.street??'',
                      subTitletitle2: 'Suite',
                      text2: userDetails.address?.suite??'',
                      subTitletitle3: 'City',
                      text3: userDetails.address?.city??'',
                      subTitletitle4: 'Zipcode',
                      text4: userDetails.address?.zipcode,
                        size: size, userDetails: userDetails, style: style),
                      
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: size.height * 0.70,
              right: 0,
              left: 0,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/profile_icon.png'),
                )),
              )),
        ],
      ),
    );
  }
}



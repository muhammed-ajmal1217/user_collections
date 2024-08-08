import 'package:appscrip/constants/app_colors.dart';
import 'package:appscrip/controller/home_controller.dart';
import 'package:appscrip/model/user_model.dart';
import 'package:appscrip/view/home/widgets/home_screen_top_card.dart';
import 'package:appscrip/view/user_details/user_details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final controller = Provider.of<HomeController>(context, listen: false);
    controller.getAllUsersData();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          HomePageTopCard(size: size),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: TextFormField(
                onChanged: (value) {
                  controller.searchUsers(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.inter(),
                  prefixIcon: const Icon(Iconsax.search_normal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<HomeController>(
              builder: (context, controller, child) {
                if (controller.filteredUsers == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.filteredUsers!.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/data_not_found.png'),
                            ),
                          ),
                        ),
                        Text(
                          'No data found',
                          style: GoogleFonts.roboto(
                              fontStyle: FontStyle.italic, fontSize: 18),
                        ),
                      ],
                    ),
                  );
                } else {
                  return RefreshIndicator(
                    onRefresh: () => controller.refreshAllData(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ListView.builder(
                        itemCount: controller.filteredUsers?.length ?? 0,
                        itemBuilder: (context, index) {
                          UserModel? userDetails =
                              controller.filteredUsers?[index];
                          if (userDetails != null) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                elevation: 0,
                                borderOnForeground: true,
                                color: AppColors.white,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UserDetailsPage(
                                          userDetails: userDetails,
                                          size: size,
                                        ),
                                      ),
                                    );
                                  },
                                  leading: const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      'assets/profile_icon.png',
                                    ),
                                  ),
                                  title: Text(
                                    userDetails.name ?? '',
                                    style: GoogleFonts.raleway(),
                                  ),
                                  subtitle: Text(userDetails.email ?? ''),
                                  trailing: const Icon(
                                    Iconsax.arrow_right_3,
                                    color: AppColors.grey,
                                    size: 14,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text('No Data Available'),
                            );
                          }
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

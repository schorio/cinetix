import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/feature/profile/widget/info_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tDefaultSize = 20;
    Color tPrimaryColor = MesCouleurs.primaire;
    return Scaffold(
      body: Stack(
        children: [
          const BlurHash(
            hash: "LaQvwRay_3WB~qt7M{ofD%RjRjay",
            imageFit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 25,
            ),
            child: Column(
              children: [
                const TitlePage(title: "Profile"),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(tDefaultSize),
                    child: Column(
                      children: [
                        /// -- IMAGE
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: Hero(
                                tag: "assets/profile.jpg",
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Image(
                                    image: AssetImage("assets/profile.jpg"),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: tPrimaryColor,
                                ),
                                child: const Icon(
                                  Icons.edit_calendar_outlined,
                                  color: MesCouleurs.blanc,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "@schorio",
                          style: TextStyle(
                            fontFamily: "Montserrat_2",
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          "schorioignace@gmail.com",
                          style: TextStyle(
                            color: MesCouleurs.noir.withOpacity(0.5),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// -- BUTTON
                        SizedBox(
                          width: 150,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.pushNamed(
                                context,
                                AppRouteName.editProfile,
                              )
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tPrimaryColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text(
                              "Modifier",
                              style: TextStyle(
                                color: MesCouleurs.blanc,
                                fontFamily: "Montserrat_2",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 10),

                        /// -- MENU
                        const InfoProfileWidget(
                          title: "TOVONIAINA Schorio Ignace",
                          icon: Icons.supervised_user_circle,
                        ),
                        const InfoProfileWidget(
                          title: "457 bis Ankatso",
                          icon: Icons.home,
                        ),
                        const InfoProfileWidget(
                          title: "+261 32 65 123 75",
                          icon: Icons.call,
                        ),
                        const InfoProfileWidget(
                          title: "schorioignace@gmail.com",
                          icon: Icons.alternate_email,
                        ),
                        const InfoProfileWidget(
                          title: "@schorio",
                          icon: Icons.verified_user,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

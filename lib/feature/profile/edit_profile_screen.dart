import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const TitlePage(title: "Modifier le profile"),
                const SizedBox(height: 30),
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
                          color: MesCouleurs.primaire,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: MesCouleurs.blanc,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // -- Form Fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text("TOVONIAINA Schorio Ignace"),
                              prefixIcon: Icon(Icons.supervised_user_circle)),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text("457 bis Ankatso"),
                              prefixIcon: Icon(Icons.home)),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text("+261 32 65 123 75"),
                              prefixIcon: Icon(Icons.call)),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text("schorioignace@gmail.com"),
                              prefixIcon: Icon(Icons.alternate_email)),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text("@schorio"),
                              prefixIcon: Icon(Icons.verified_user)),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () => {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MesCouleurs.primaire,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text(
                              "Enregistrer",
                              style: TextStyle(
                                color: MesCouleurs.blanc,
                                fontFamily: "Montserrat_2",
                              ),
                            ),
                          ),
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

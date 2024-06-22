import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.mediaQuery,
    required this.sidebarSize,
  }) : super(key: key);

  final Size mediaQuery;
  final double sidebarSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 80,
        left: 95,
        bottom: 10,
      ),
      child: SizedBox(
        height: mediaQuery.height * 0.25,
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: "assets/profile.jpg",
                child: CircleAvatar(
                  radius: sidebarSize / 5,
                  backgroundImage: const AssetImage(
                    "assets/profile.jpg",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "@schorio",
                style: TextStyle(
                  fontFamily: "Montserrat_2",
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

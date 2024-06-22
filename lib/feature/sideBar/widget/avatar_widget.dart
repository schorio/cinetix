import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.mediaQuery,
    required this.sidebarSize,
    required this.color,
  }) : super(key: key);

  final Size mediaQuery;
  final double sidebarSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 75,
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
              Text(
                "@schorio",
                style: TextStyle(
                  fontFamily: "Montserrat_1",
                  fontSize: 25,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cinetix/feature/sideBar/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

class ZoneButtonWidget extends StatelessWidget {
  const ZoneButtonWidget({
    super.key,
    required this.globalKey,
    required this.menuContainerHeight,
  });

  final GlobalKey globalKey;
  final double menuContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 95),
      child: SizedBox(
        key: globalKey,
        width: double.infinity,
        height: menuContainerHeight,
        child: Column(
          children: [
            MyButton(
              text: "Profile",
              iconData: Icons.person,
              height: (menuContainerHeight) / 5,
            ),
            MyButton(
              text: "Tickets",
              iconData: Icons.local_movies_sharp,
              height: (menuContainerHeight) / 5,
            ),
            MyButton(
              text: "Archives",
              iconData: Icons.assignment_rounded,
              height: (menuContainerHeight) / 5,
            ),
            MyButton(
              text: "Notifications",
              iconData: Icons.add_alert_rounded,
              height: (menuContainerHeight) / 5,
            ),
            MyButton(
              text: "Deconnexion",
              iconData: Icons.logout_rounded,
              // iconData: Icons.power_off_rounded,
              height: (menuContainerHeight) / 5,
            ),
          ],
        ),
      ),
    );
  }
}

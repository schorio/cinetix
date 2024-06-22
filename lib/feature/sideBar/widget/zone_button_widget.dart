import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/feature/sideBar/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

class ZoneButtonWidget extends StatelessWidget {
  const ZoneButtonWidget({
    super.key,
    required this.globalKey,
    required this.menuContainerHeight,
    required this.color,
  });

  final GlobalKey globalKey;
  final double menuContainerHeight;
  final Color color;

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
              iconColor: color,
              height: (menuContainerHeight) / 5,
              route: AppRouteName.profile,
            ),
            MyButton(
              text: "Tickets",
              iconData: Icons.local_movies_sharp,
              iconColor: color,
              height: (menuContainerHeight) / 5,
              route: AppRouteName.profile,
            ),
            MyButton(
              text: "Archives",
              iconData: Icons.assignment_rounded,
              iconColor: color,
              height: (menuContainerHeight) / 5,
              route: AppRouteName.profile,
            ),
            MyButton(
              text: "Notifications",
              iconData: Icons.add_alert_rounded,
              iconColor: color,
              height: (menuContainerHeight) / 5,
              route: AppRouteName.profile,
            ),
            MyButton(
              text: "Deconnexion",
              iconData: Icons.logout_rounded,
              // iconData: Icons.power_off_rounded,
              iconColor: color,
              height: (menuContainerHeight) / 5,
              route: AppRouteName.profile,
            ),
          ],
        ),
      ),
    );
  }
}

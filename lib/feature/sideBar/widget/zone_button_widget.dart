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
              text: "Payments",
              iconData: Icons.payment,
              height: (menuContainerHeight) / 5,
            ),
            MyButton(
              text: "Notifications",
              iconData: Icons.notifications,
              height: (menuContainerHeight) / 5,
            ),
            MyButton(
              text: "Settings",
              iconData: Icons.settings,
              height: (menuContainerHeight) / 5,
            ),
            MyButton(
              text: "My Files",
              iconData: Icons.attach_file,
              height: (menuContainerHeight) / 5,
            ),
          ],
        ),
      ),
    );
  }
}

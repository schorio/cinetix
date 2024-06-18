import 'package:cinetix/feature/sideBar/widget/avatar_widget.dart';
import 'package:cinetix/feature/sideBar/widget/mybutton_widget.dart';
import 'package:flutter/material.dart';

class SideBarScreen extends StatefulWidget {
  const SideBarScreen({
    super.key,
    required this.controllerSideBar,
    required this.slideAnimationSideBar,
    required this.globalKey,
    required this.isMenuOpen,
    required this.revMenuOpen,
  });

  final AnimationController controllerSideBar;
  final Animation<Offset> slideAnimationSideBar;
  final GlobalKey globalKey;
  final bool isMenuOpen;
  final Function(bool) revMenuOpen;

  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.95;
    double menuContainerHeight = mediaQuery.height / 2;
    return SlideTransition(
      position: widget.slideAnimationSideBar,
      child: Container(
        color: Colors.white,
        width: sidebarSize,
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: mediaQuery.height,
              width: sidebarSize,
              child: Column(
                children: <Widget>[
                  AvatarWidget(
                    mediaQuery: mediaQuery,
                    sidebarSize: sidebarSize,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 95),
                    child: SizedBox(
                      key: widget.globalKey,
                      width: double.infinity,
                      height: menuContainerHeight,
                      child: Column(
                        children: <Widget>[
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
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              right: (widget.isMenuOpen) ? 20 : sidebarSize,
              bottom: 20,
              child: IconButton(
                enableFeedback: true,
                icon: const Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black45,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    widget.controllerSideBar.reverse();
                    widget.revMenuOpen(widget.isMenuOpen);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

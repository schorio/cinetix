import 'package:cinetix/feature/sideBar/widget/avatar_widget.dart';
import 'package:cinetix/feature/sideBar/widget/zone_button_widget.dart';
import 'package:flutter/material.dart';

class SideBarScreen extends StatefulWidget {
  const SideBarScreen({
    super.key,
    required this.controllerSideBar,
    required this.slideAnimationSideBar,
    required this.globalKey,
    required this.isMenuOpen,
    required this.revMenuOpen,
    required this.themeColor,
  });

  final AnimationController controllerSideBar;
  final Animation<Offset> slideAnimationSideBar;
  final GlobalKey globalKey;
  final bool isMenuOpen;
  final Function(bool) revMenuOpen;
  final Color themeColor;

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
                children: [
                  AvatarWidget(
                    mediaQuery: mediaQuery,
                    sidebarSize: sidebarSize,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  ZoneButtonWidget(
                    globalKey: widget.globalKey,
                    menuContainerHeight: menuContainerHeight,
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
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: widget.themeColor,
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

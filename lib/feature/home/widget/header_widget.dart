import 'package:cinetix/core/design/app_color.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
    required this.color,
    required this.controllerSideBar,
    required this.isMenuOpen,
    required this.revMenuOpen,
  }) : super(key: key);

  final Color color;
  final AnimationController controllerSideBar;
  final bool isMenuOpen;
  final Function(bool) revMenuOpen;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Ciné",
          style: TextStyle(
              color: MesCouleurs.noir,
              fontSize: 40,
              fontFamily: 'Montserrat_1'),
        ),
        Text(
          "Tix",
          style: TextStyle(
              color: widget.color, fontSize: 40, fontFamily: 'Montserrat_1'),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              widget.revMenuOpen(widget.isMenuOpen);
              if (widget.isMenuOpen) {
                widget.controllerSideBar.reverse();
              } else {
                widget.controllerSideBar.forward();
              }
            });
          },
          child: CircleAvatar(
            backgroundImage: const AssetImage('assets/profile.jpg'),
            radius: 25,
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: widget.color,
                radius: 7.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

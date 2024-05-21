import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({
    Key? key,
    required this.couleurDominant,
  }) : super(key: key);

  final Color couleurDominant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 175,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateX(.8),
            transformAlignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(
                color: couleurDominant,
                width: 5,
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            height: 40,
            width: 230,
            child: CustomPaint(
              painter: MovieScreenLinePainter(couleurDominant),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieScreenLinePainter extends CustomPainter {
  const MovieScreenLinePainter(this.couleurDominant);
  final Color couleurDominant;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = couleurDominant
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final h = size.height;
    final w = size.width;

    final path = Path()
      ..moveTo(0, h)
      ..quadraticBezierTo(
        w * 0.44,
        h * 0.57,
        w * 0.5,
        h * 0.6,
      )
      ..quadraticBezierTo(
        w * 0.56,
        h * 0.57,
        w,
        h,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

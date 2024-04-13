import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsFilm extends StatefulWidget {
  const DetailsFilm({super.key});

  @override
  State<DetailsFilm> createState() => _DetailsFilmState();
}

class _DetailsFilmState extends State<DetailsFilm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('test'),
    );
  }
}

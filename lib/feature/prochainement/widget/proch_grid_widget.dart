import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/feature/prochainement/widget/pochette_widget.dart';
import 'package:flutter/material.dart';

class ProchGridWidget extends StatelessWidget {
  const ProchGridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 20,
        alignment: WrapAlignment.center,
        children: [
          for (int index = 0; index < prochainement.length; index++) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Film film = prochainement[index];
                      Navigator.pushNamed(
                        context,
                        AppRouteName.detailsFilm,
                        arguments: film,
                      );
                    },
                    child: PochetteWidget(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: 240,
                      film: prochainement[index],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    prochainement[index].title,
                    style: const TextStyle(
                      fontFamily: 'MontSerrat_2',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

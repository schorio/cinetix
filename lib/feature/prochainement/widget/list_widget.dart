import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/feature/prochainement/widget/bloc_details_widget.dart';
import 'package:cinetix/feature/prochainement/widget/pochette_widget.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: prochainement.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Film film = prochainement[index];

              Navigator.pushNamed(
                context,
                AppRouteName.detailsFilm,
                arguments: film,
              );
            },
            child: filmItem(context, index),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: MesCouleurs.secondaire,
            thickness: 1,
          );
        },
      ),
    );
  }

  Container filmItem(BuildContext context, int index) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            PochetteWidget(index: index),
            const SizedBox(width: 10),
            BlocDetailsWidget(index: index)
          ],
        ));
  }
}

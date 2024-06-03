import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/feature/prochainement/widget/vote_details_widget.dart';
import 'package:cinetix/feature/prochainement/widget/pochette_widget.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  bool condition = true;
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                PochetteWidget(index: index),
                const SizedBox(width: 10),
                VoteDetailsWidget(index: index),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  setState(() {
                    condition = !condition;
                  });
                },
                child: Icon(
                  condition == true
                      ? Icons.how_to_vote_rounded
                      : Icons.check_circle_rounded,
                  size: 30,
                  color: MesCouleurs.noir,
                ),
              ),
            )
          ],
        ));
  }
}

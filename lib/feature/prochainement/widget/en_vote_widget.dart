import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/film_model.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/feature/prochainement/widget/pochette_widget.dart';
import 'package:cinetix/feature/prochainement/widget/vote_details_widget.dart';
import 'package:flutter/material.dart';

class EnVoteWidget extends StatefulWidget {
  const EnVoteWidget({
    required this.resultat,
    Key? key,
  }) : super(key: key);

  final List<Film> resultat;

  @override
  State<EnVoteWidget> createState() => _EnVoteWidgetState();
}

class _EnVoteWidgetState extends State<EnVoteWidget> {
  bool condition = true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: widget.resultat.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Film film = widget.resultat[index];

                  Navigator.pushNamed(
                    context,
                    AppRouteName.detailsFilm,
                    arguments: film,
                  );
                },
                child: filmItem(context, widget.resultat[index]),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: MesCouleurs.secondaire,
                thickness: 1,
              );
            },
          ),
          Positioned(
            bottom: 10,
            right: 30,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouteName.plusFilm,
                );
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: MesCouleurs.noir,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: MesCouleurs.blanc,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container filmItem(BuildContext context, Film film) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      height: MediaQuery.of(context).size.height * 0.17,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PochetteWidget(
                film: film,
                width: MediaQuery.of(context).size.width * 0.28,
                height: MediaQuery.of(context).size.height * 0.17,
              ),
              const SizedBox(width: 10),
              VoteDetailsWidget(film: film),
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
      ),
    );
  }
}

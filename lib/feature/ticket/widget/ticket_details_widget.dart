import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/ticket_model.dart';
import 'package:flutter/material.dart';

class TicketDetailsWidget extends StatelessWidget {
  const TicketDetailsWidget({
    Key? key,
    required this.ticketItem,
  }) : super(key: key);

  final Ticket ticketItem;

  @override
  Widget build(BuildContext context) {
    String title = ticketItem.film.title;
    if (title.length > 10) {
      title =
          '${title.substring(0, 12)} ...'; // Limiter à 10 caractères et ajouter des points de suspension
    }
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleFilm(title),
          const SizedBox(height: 1),
          industryFilm(ticketItem.film.studio),
          const SizedBox(height: 5),
          dateFilm(),
          const SizedBox(height: 2),
          nbPlace(ticketItem.places.length),
          const SizedBox(height: 8),
          ticketItem.valider ? ticketValider() : ticketNonValider()
        ],
      ),
    );
  }

  Row ticketNonValider() {
    return Row(
      children: const [
        Icon(
          Icons.content_paste_search_rounded,
          size: 18,
          color: Colors.grey,
        ),
        SizedBox(width: 3),
        Text(
          "En Attente",
          style: TextStyle(
            fontSize: 12,
            fontFamily: "MontSerrat_1",
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  Row ticketValider() {
    return Row(
      children: const [
        Icon(
          Icons.verified,
          size: 18,
          color: Colors.green,
        ),
        SizedBox(width: 3),
        Text(
          "Valider",
          style: TextStyle(
            fontSize: 12,
            fontFamily: "MontSerrat_1",
            color: Colors.green,
          ),
        )
      ],
    );
  }

  Row nbPlace(int nbPlace) {
    return Row(
      children: [
        Text(
          nbPlace.toString(),
          style: const TextStyle(
            color: MesCouleurs.primaire,
            fontSize: 15,
            fontFamily: 'MontSerrat_2',
          ),
        ),
        const SizedBox(width: 3),
        const Text(
          "place(s)",
          style: TextStyle(
            fontSize: 10,
          ),
        )
      ],
    );
  }

  Row dateFilm() {
    return Row(
      children: const [
        Icon(
          Icons.date_range_rounded,
          size: 12,
          color: MesCouleurs.primaire,
        ),
        SizedBox(width: 3),
        Text(
          "05/10/2024 - 14h00",
          style: TextStyle(
            fontSize: 10,
            color: MesCouleurs.noir,
          ),
        ),
      ],
    );
  }

  Row industryFilm(String studio) {
    return Row(
      children: [
        const Icon(
          Icons.local_fire_department_outlined,
          color: MesCouleurs.primaire,
          size: 12,
        ),
        const SizedBox(width: 5),
        Text(
          studio,
          style: const TextStyle(
            fontSize: 10,
            color: MesCouleurs.noir,
          ),
        ),
      ],
    );
  }

  Text titleFilm(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontFamily: 'MontSerrat_2',
      ),
    );
  }
}

import 'package:cinetix/core/model/ticket_model.dart';
import 'package:flutter/material.dart';

class PochetteWidget extends StatelessWidget {
  const PochetteWidget({
    required this.ticketItem,
    Key? key,
  }) : super(key: key);

  final Ticket ticketItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(
            ticketItem.film.assetImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

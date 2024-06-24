import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/ticket_model.dart';
import 'package:flutter/material.dart';

class ListTicketWidget extends StatefulWidget {
  const ListTicketWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListTicketWidget> createState() => _ListTicketWidgetState();
}

class _ListTicketWidgetState extends State<ListTicketWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 18,
        ),
        itemCount: lesTickets.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: ticketItem(context, lesTickets[index]),
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

  Container ticketItem(BuildContext context, Ticket ticket) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      height: MediaQuery.of(context).size.height * 0.17,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.height * 0.17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(
                  ticket.film.assetImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/model/ticket_model.dart';
import 'package:cinetix/feature/ticket/widget/pochette_widget.dart';
import 'package:cinetix/feature/ticket/widget/ticket_details_widget.dart';
import 'package:flutter/material.dart';

class ListTicketWidget extends StatefulWidget {
  const ListTicketWidget({
    required this.color,
    required this.resultat,
    Key? key,
  }) : super(key: key);

  final Color color;
  final List<Ticket> resultat;

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
        itemCount: widget.resultat.length,
        itemBuilder: (context, index) {
          Ticket ticket = widget.resultat[index];
          return ticketItem(context, ticket);
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
          PochetteWidget(ticketItem: ticket),
          const SizedBox(width: 10),
          TicketDetailsWidget(
            ticketItem: ticket,
            color: widget.color,
          ),
        ],
      ),
    );
  }
}

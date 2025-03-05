import 'package:cinetix/core/model/ticket_model.dart';
import 'package:cinetix/core/widget/search_bar.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/feature/ticket/widget/list_ticket_widget.dart';
import 'package:flutter/material.dart';

class ArchiveTicketScreen extends StatefulWidget {
  const ArchiveTicketScreen({super.key});

  @override
  State<ArchiveTicketScreen> createState() => _ArchiveTicketScreenState();
}

class _ArchiveTicketScreenState extends State<ArchiveTicketScreen> {
  late Color themeColor;
  List<Ticket> filmTrouver = [];

  @override
  void initState() {
    filmTrouver = lesTickets;
    super.initState();
  }

  void searchFilter(String entrer) {
    List<Ticket> resultat = [];
    if (entrer.isEmpty) {
      resultat = lesTickets;
    } else {
      resultat = lesTickets
          .where(
            (element) => element.film.title.toLowerCase().contains(
                  entrer.toLowerCase(),
                ),
          )
          .toList();
    }
    filmTrouver = resultat;
  }

  @override
  void didChangeDependencies() {
    themeColor = ModalRoute.of(context)!.settings.arguments as Color;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 25,
        ),
        child: Column(
          children: [
            TitlePage(
              title: "Archives",
              color: themeColor,
            ),
            const SizedBox(height: 25),
            MySearchBar(
              onChanged: searchFilter,
              color: themeColor,
            ),
            const SizedBox(height: 25),
            ListTicketWidget(
              color: themeColor,
              resultat: lesTicketss,
            ),
          ],
        ),
      ),
    );
  }
}

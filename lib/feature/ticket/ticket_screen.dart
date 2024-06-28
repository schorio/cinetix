import 'package:cinetix/core/model/ticket_model.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/feature/ticket/widget/list_ticket_widget.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late Color themeColor;

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
              title: "Vos tickets",
              color: themeColor,
            ),
            const SizedBox(height: 25),
            ListTicketWidget(
              color: themeColor,
              resultat: lesTickets,
            ),
          ],
        ),
      ),
    );
  }
}

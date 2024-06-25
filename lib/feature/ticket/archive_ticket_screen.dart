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
            ListTicketWidget(color: themeColor),
          ],
        ),
      ),
    );
  }
}

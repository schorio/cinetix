import 'package:cinetix/core/widget/title_page.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 25,
          bottom: 20,
        ),
        child: Column(
          children: const [
            TitlePage(title: "Vos tickets"),
          ],
        ),
      ),
    );
  }
}

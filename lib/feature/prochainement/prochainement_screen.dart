import 'package:cinetix/core/widget/title_page.dart';
import 'package:flutter/material.dart';

class ProchainementScreen extends StatefulWidget {
  const ProchainementScreen({super.key});

  @override
  State<ProchainementScreen> createState() => _ProchainementScreenState();
}

class _ProchainementScreenState extends State<ProchainementScreen> {
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
            TitlePage(title: "Prochainement"),
          ],
        ),
      ),
    );
  }
}

import 'package:cinetix/core/widget/search_bar.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:cinetix/feature/prochainement/widget/list_widget.dart';
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
            SizedBox(height: 20),
            SearchBar(),
            SizedBox(height: 20),
            ListWidget(),
          ],
        ),
      ),
    );
  }
}

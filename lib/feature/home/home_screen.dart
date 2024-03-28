import 'package:flutter/material.dart';
import 'package:cinetix/feature/home/widget/banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Hi, Schorio",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Spacer(),
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/profile.jpg'),
                              radius: 25,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFF7c44c2),
                                  radius: 7.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Recherche',
                              hintStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: BannerWidget(),
                  ),
                ])));
  }
}

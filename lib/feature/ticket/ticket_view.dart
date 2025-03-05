import 'package:animate_do/animate_do.dart';
import 'package:cinetix/core/design/app_color.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/core/widget/title_page.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  late Color couleurDominant;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    couleurDominant = ModalRoute.of(context)!.settings.arguments as Color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 25,
            bottom: MediaQuery.of(context).padding.bottom + 100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitlePage(
                title: "Ticket",
                color: couleurDominant,
              ),
              Text(
                "Votre Ticket".toUpperCase(),
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                ),
              ),
              TicketWidget(
                width: 280,
                height: 450,
                color: MesCouleurs.secondaire.withOpacity(0.6),
                isCornerRounded: true,
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: couleurDominant,
                            radius: 60,
                            child: const CircleAvatar(
                              backgroundColor: MesCouleurs.noir,
                              backgroundImage:
                                  AssetImage("assets/film/minion.jpeg"),
                              radius: 55,
                            ),
                          ),
                          const Text(
                            "Minions: The Rise ...",
                            style: TextStyle(
                              fontSize: 20,
                              color: MesCouleurs.noir,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.content_paste_search_rounded,
                                size: 18,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 3),
                              Text(
                                "En Attente",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "MontSerrat_1",
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ticketDetails("Date", "06 Avril"),
                                  ticketDetails("Heure", "13.00"),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ticketDetails("Places", "A33, A34"),
                                  ticketDetails("Prix", "40 000 Ar"),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 200,
                            color: couleurDominant,
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 800),
                duration: const Duration(milliseconds: 500),
                child: MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteName.home,
                      arguments: couleurDominant,
                    );
                  },
                  color: couleurDominant,
                  minWidth: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  child: const Text(
                    "Confirmer",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget ticketDetails(String title, String details) => Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: MesCouleurs.noir,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 20,
            width: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MesCouleurs.blanc.withOpacity(0.3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              details,
              style: TextStyle(
                fontSize: 11,
                fontStyle: FontStyle.italic,
                color: couleurDominant,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      );
}

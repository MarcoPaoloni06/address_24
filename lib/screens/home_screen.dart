// Importazione delle dipendenze necessarie

import 'package:address_24/services/people_service.dart';
import 'package:address_24/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class HomeListViewScreen extends StatelessWidget {
  HomeListViewScreen({
    super.key,
  });

  // Ottiene una lista di persone dal servizio 'PeopleService' e la converte in una lista di widget 'ContactItem'
  final people = PeopleService().getPeople(results: 15).toList();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection
          .ltr, // Imposta la direzione del testo da sinistra a destra
      child: SingleChildScrollView(
        child: Column(
          // Utilizza una colonna per visualizzare tutti gli elementi 'ContactItem'
          children: people
              .map((e) => ContactItem(p: e))
              .toList(), // Mappa ogni persona in un widget 'ContactItem'
        ),
      ),
    );
  }
}

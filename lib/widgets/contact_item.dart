// Importazione delle dipendenze necessarie

import 'package:address_24/models/person.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.p, // Il contatto da visualizzare
  });

  final Person p; // Persona da visualizzare

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // Utilizza una riga per visualizzare l'avatar e i dettagli del contatto
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(p.picture!.thumbnail!), // Utilizza l'immagine di anteprima come sfondo dell'avatar
              radius: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(p.firstName!), Text(p.cell!)], // Visualizza il nome e il numero di telefono del contatto
            ),
          ],
        ),
      ),
    );
  }
}

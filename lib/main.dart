// Importazione delle dipendenze necessarie
import 'package:address_24/models/person.dart'; // Importa il modello 'Person'
import 'package:address_24/services/people_service.dart'; // Importa il servizio 'PeopleService'
import 'package:flutter/material.dart'; // Importa il framework Flutter
import 'package:flutter/widgets.dart';

import 'screens/home_screen.dart';
import 'widgets/contact_item.dart'; // Importa i widget di base di Flutter

//le callback sono funzioni che vengono passate come argomenti ad altre funzioni o ad altri oggetti

// Funzione principale che avvia l'applicazione
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: HomeListViewScreen(),
    ),
  ));
}

class HomeListViewScreen extends StatelessWidget {
  HomeListViewScreen({super.key});

  final people = PeopleService().getPeople(results: 100).toList();

  ListTile _buildListTitle(Person p) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(p.picture!.thumbnail!),
      ),
      title: Text(p.firstName!),
      subtitle: Text(p.cell!),
      trailing: Icon(Icons.favorite_border),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list),label: "List"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: "Favorite")
        ],
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          return _buildListTitle(people[index]);
        },
      )
    );
  }
}

import 'package:address_book/models/models.dart';
import 'package:address_book/services/people_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final data = PeopleService().getPeople(results: 10).toList();

    Widget mapItemToListView(Person p) {
      //p.picture.medium
      return Row(
        children: [
          CircleAvatar(
            radius: 40,
            foregroundImage: NetworkImage(p.picture!.medium!),
          ),
        ],
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: data.map(mapItemToListView).toList(),
        ),
      ),
    );
  }
}

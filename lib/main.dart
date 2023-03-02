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
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: CircleAvatar(
              radius: 50,
              foregroundImage: NetworkImage(p.picture!.medium!),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: p.firstName!),
                    const TextSpan(text: " "),
                    TextSpan(text: p.lastName!)
                  ],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                textAlign: TextAlign.left,
                p.cell!,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
            ],
          )
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

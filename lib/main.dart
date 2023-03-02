import 'package:address_book/components/contanct_list_item.dart';
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: data
              .map((e) => ContactListItem(
                  srcProfile: e.picture!.medium!,
                  firstName: e.firstName!,
                  lastName: e.lastName!,
                  cell: e.cell!))
              .toList(),
        ),
      ),
    );
  }
}

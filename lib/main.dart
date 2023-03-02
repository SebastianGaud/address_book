import 'package:address_book/components/contanct_list_item.dart';
import 'package:address_book/services/people_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = PeopleService().getPeople(results: 10).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          elevation: 0,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.favorite_outlined), label: 'Favorite')
          ],
        ),
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

import 'package:address_book/components/contanct_list_item.dart';
import 'package:address_book/models/person.dart';
import 'package:address_book/services/people_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  final List<Person> _favoritePerson = [];

  @override
  Widget build(BuildContext context) {
    final data = PeopleService().getPeople(results: 100).toList();

    void onFavorite(String cell) {
      final eF =
          _favoritePerson.where((element) => element.cell == cell).toList();

      if (eF.isNotEmpty) {
        return;
      }

      final e = data.firstWhere((element) => element.cell == cell);
      setState(() {
        _favoritePerson.add(e);
      });
    }

    List<Widget> pages = [
      ContactList(
        data: data,
        onFavorite: onFavorite,
      ),
      ContactList(
        data: _favoritePerson,
        onFavorite: (cell) {},
      )
    ];

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
        body: pages.elementAt(_selectedIndex),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.data, required this.onFavorite});

  final void Function(String cell) onFavorite;
  final List<Person> data;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: data
          .map((e) => ContactListItem(
                srcProfile: e.picture!.medium!,
                firstName: e.firstName!,
                lastName: e.lastName!,
                cell: e.cell!,
                onFavorite: onFavorite,
              ))
          .toList(),
    );
  }
}

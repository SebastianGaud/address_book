import 'package:address_book/components/contanct_list_item.dart';
import 'package:address_book/models/favoritePerson.dart';
import 'package:address_book/models/person.dart';
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
  List<FavoritePerson> _favoritePerson = [];
  List<FavoritePerson> _mainList = [];

  @override
  void initState() {
    super.initState();
    final data = PeopleService().getPeople(results: 100).toList();

    _mainList = data
        .map(
          (e) => FavoritePerson(
              isFavorite: false,
              cell: e.cell,
              firstName: e.firstName,
              lastName: e.lastName,
              picture: e.picture),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    void onFavorite(String cell) {
      final eF =
          _favoritePerson.where((element) => element.cell == cell).toList();

      if (eF.isNotEmpty) {
        return;
      }

      final e = _mainList.firstWhere((element) => element.cell == cell);
      setState(() {
        e.isFavorite = true;
        _favoritePerson = [..._favoritePerson, e];
      });
    }

    List<Widget> pages = [
      ContactList(
        data: _mainList,
        onFavorite: onFavorite,
      ),
      ContactList(
        data: _favoritePerson,
        onFavorite: (cell) {
          final e = _favoritePerson.where((e) => e.cell != cell);
          setState(() {
            _favoritePerson = e.toList();
          });
        },
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
  final List<FavoritePerson> data;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: data.map((e) {
        print(e.isFavorite);
        return ContactListItem(
          srcProfile: e.picture!.medium!,
          firstName: e.firstName!,
          lastName: e.lastName!,
          cell: e.cell!,
          onFavorite: onFavorite,
          isFavorite: e.isFavorite,
        );
      }).toList(),
    );
  }
}

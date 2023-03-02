import 'package:flutter/material.dart';
import 'package:address_book/components/favorite.dart';

class ContactListItem extends StatelessWidget {
  final String srcProfile;
  final String firstName;
  final String lastName;
  final String cell;
  final bool isFavorite;
  //final ValueSetter<String> onFavorite;
  //final ValueGetter<String> onFavorite;

  final void Function(String cell) onFavorite;

  const ContactListItem(
      {super.key,
      required this.srcProfile,
      required this.firstName,
      required this.lastName,
      required this.cell,
      required this.onFavorite,
      this.isFavorite = false});

  onPressed() {
    print(cell);
    onFavorite(cell);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        foregroundImage: NetworkImage(srcProfile),
      ),
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: firstName),
            const TextSpan(text: " "),
            TextSpan(text: lastName)
          ],
          //style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      subtitle: Text(cell),
      trailing: SizedBox(
        width: 80,
        child: Row(
          children: [
            Favorite(onFavorite: onPressed, isFavorite: this.isFavorite),
            const Icon(Icons.phone_enabled_rounded)
          ],
        ),
      ),
    );
  }
}

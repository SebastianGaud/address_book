import 'package:flutter/material.dart';

class ContactListItem extends StatelessWidget {
  final String srcProfile;
  final String firstName;
  final String lastName;
  final String cell;
  //final ValueSetter<String> onFavorite;
  //final ValueGetter<String> onFavorite;

  final void Function(String cell) onFavorite;

  const ContactListItem(
      {super.key,
      required this.srcProfile,
      required this.firstName,
      required this.lastName,
      required this.cell,
      required this.onFavorite});

  onPressed() {
    print(this.cell);
    onFavorite(this.cell);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        foregroundImage: NetworkImage(this.srcProfile),
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
            IconButton(onPressed: onPressed, icon: const Icon(Icons.favorite)),
            const Icon(Icons.phone_enabled_rounded)
          ],
        ),
      ),
    );
  }
}

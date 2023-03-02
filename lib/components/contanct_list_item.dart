import 'package:flutter/material.dart';

class ContactListItem extends StatelessWidget {
  final String srcProfile;
  final String firstName;
  final String lastName;
  final String cell;

  const ContactListItem(
      {super.key,
      required this.srcProfile,
      required this.firstName,
      required this.lastName,
      required this.cell});

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
      trailing: Icon(Icons.phone_enabled_rounded),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Row(
    //       children: [
    //         Padding(
    //           padding:
    //               const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
    //           child: CircleAvatar(
    //             radius: 40,
    //             foregroundImage: NetworkImage(srcProfile),
    //           ),
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text.rich(
    //               TextSpan(
    //                 children: [
    //                   TextSpan(text: firstName),
    //                   const TextSpan(text: " "),
    //                   TextSpan(text: lastName)
    //                 ],
    //                 style: const TextStyle(
    //                     fontSize: 16, fontWeight: FontWeight.w700),
    //               ),
    //             ),
    //             Text(
    //               textAlign: TextAlign.left,
    //               cell,
    //               style: const TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.w300,
    //                   color: Colors.grey),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     const Padding(
    //       padding: EdgeInsets.only(right: 20),
    //       child: Icon(Icons.phone_enabled_rounded),
    //     )
    //   ],
    // );
  }
}

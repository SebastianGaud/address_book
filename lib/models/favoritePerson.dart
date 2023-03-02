// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:address_book/models/models.dart';

class FavoritePerson extends Person {
  bool isFavorite;

  FavoritePerson({
    gender,
    firstName,
    lastName,
    email,
    cell,
    id,
    picture,
    required this.isFavorite,
  }) : super(
            cell: cell,
            gender: gender,
            firstName: firstName,
            lastName: lastName,
            email: email,
            id: id,
            picture: picture);
}

import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  final void Function() onFavorite;
  final bool isFavorite;

  const Favorite(
      {super.key, required this.onFavorite, this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    if (isFavorite) {
      return IconButton(
          onPressed: onFavorite,
          icon: Icon(
            Icons.favorite_rounded,
            color: Colors.red[400],
          ));
    }

    return IconButton(
        onPressed: onFavorite, icon: const Icon(Icons.favorite_border_rounded));
  }
}

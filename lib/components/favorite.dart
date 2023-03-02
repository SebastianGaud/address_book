import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  final void Function() onFavorite;
  final bool isFavorite;

  const Favorite(
      {super.key, required this.onFavorite, this.isFavorite = false});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  setFavorite() {
    widget.onFavorite();
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isFavorite) {
      return IconButton(
          onPressed: setFavorite,
          icon: Icon(
            Icons.favorite_rounded,
            color: Colors.red[400],
          ));
    }

    return IconButton(
        onPressed: setFavorite,
        icon: const Icon(Icons.favorite_border_rounded));
  }
}

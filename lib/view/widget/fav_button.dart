import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_app/view_model/favorites_view_model.dart';

class FavButton extends StatelessWidget {
  const FavButton({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    FavoritesViewModel favoritesViewModel = Provider.of<FavoritesViewModel>(context);

    return GestureDetector(
      onTap: () => favoritesViewModel.favButtonOnTap(id),
      child: favoritesViewModel.isFavorite(id) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_sharp),
    );
  }
}

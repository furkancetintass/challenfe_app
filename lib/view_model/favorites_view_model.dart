import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:temp_app/core/globals/globals.dart' as globals;
import 'package:temp_app/core/interface/user_vm_interface.dart';

class FavoritesViewModel with ChangeNotifier {
  FavoritesViewModel(this.userViewModel);
  UserVmInterface userViewModel;
  var box = Hive.box('myBox');

  addToFavorite(int id) {
    if (!globals.favoritesList.contains(id)) {
      globals.favoritesList.add(id);
      box.put('favoritesList', globals.favoritesList);
    }
    notifyListeners();
  }

  removeFavorite(int id) {
    globals.favoritesList.removeWhere((element) => element == id);
    box.put('favoritesList', globals.favoritesList);
    notifyListeners();
  }

  isFavorite(int id) {
    return globals.favoritesList.contains(id);
  }

  favButtonOnTap(int id) {
    if (isFavorite(id)) {
      removeFavorite(id);
    } else {
      addToFavorite(id);
    }
  }
}

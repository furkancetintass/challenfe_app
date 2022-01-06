import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:temp_app/core/globals/globals.dart' as globals;
import 'package:temp_app/core/interface/user_vm_interface.dart';
import 'package:temp_app/model/notices_model.dart';
import 'package:temp_app/view_model/user_view_model.dart';

class NoticesViewModel with ChangeNotifier {
  NoticesViewModel(this.userViewModel);
  UserVmInterface userViewModel;
  var box = Hive.box('myBox');

  deleteNotice(int id) {
    if (!globals.removedNotices.contains(id)) {
      globals.removedNotices.add(id);
      box.put('removedNotices', globals.removedNotices);
    }
    notifyListeners();
  }

  getNotices() {
    if (userViewModel.userStatus == UserStatus.member) {
      for (var item in globals.removedNotices) {
        noticesModelList.removeWhere((element) => element.id == item);
      }
    } else {
      // misafir girişinde duyuru silmek pasif olduğu için misafirin tüm duyuruları görmesi gerekir.
      noticesModelList = List.generate(
          15,
          (index) => NoticesModel('Duyuru - ${index + 1}', 'Duyuru metni satır - 1',
              List.generate(index + 1, (index) => 'Satır ${index + 1}'), index));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:temp_app/core/interface/user_vm_interface.dart';
import 'package:temp_app/core/theme/my_theme.dart';
import 'package:temp_app/view/screen/beginning_screen.dart';
import 'package:temp_app/view_model/user_view_model.dart';

import 'core/globals/globals.dart' as globals;

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  var box = Hive.box('myBox');
  globals.favoritesList = box.get('favoritesList', defaultValue: []);
  globals.removedNotices = box.get('removedNotices', defaultValue: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // device sadece portrait modda çalışabilir.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Provider<UserVmInterface>(
      create: (_) => UserViewModel(),
      child: MaterialApp(
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        home: const BeginningScreen(),
      ),
    );
  }
}

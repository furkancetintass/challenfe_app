import 'package:flutter/material.dart';
import 'package:temp_app/view_model/user_view_model.dart';

abstract class UserVmInterface {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  set username(String value);

  String get username;

  bool checkInputs(BuildContext context);

  UserStatus get userStatus;

  bool userIsMember();

  void logOut();
}

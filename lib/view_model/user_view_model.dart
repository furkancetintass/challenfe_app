import 'package:flutter/material.dart';
import 'package:temp_app/core/interface/user_vm_interface.dart';

enum UserStatus { member, guest }

class UserViewModel implements UserVmInterface {
  @override
  TextEditingController passwordController = TextEditingController();

  @override
  TextEditingController usernameController = TextEditingController();

  String _username = '';

  @override
  set username(String value) {
    _username = value;
  }

  @override
  String get username => _username;

  UserStatus _userStatus = UserStatus.guest;

  @override
  UserStatus get userStatus => _userStatus;

  @override
  bool checkInputs(BuildContext context) {
    if (usernameController.text == 'demo' && passwordController.text == '12345') {
      username = usernameController.text;
      _userStatus = UserStatus.member;
      return true;
    } else {
      _userStatus = UserStatus.guest;
      return false;
    }
  }

  @override
  bool userIsMember() {
    return _userStatus == UserStatus.member;
  }

  @override
  void logOut() {
    username = '';
    _userStatus = UserStatus.guest;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:reddit/classes/User.dart';

import '../Request.dart';

class Accounts {
  static List<User> _accounts = List.empty(growable: true);
  static int _currentAccount = 0;
  static bool key = false;

 static List<User> get accounts => _accounts;

  static set accounts(List<User> value) {
    _accounts = value;
  }
  static int get currentAccount => _currentAccount;

  static set currentAccount(int value) {
    _currentAccount = value;
  }

  static User addAccount(String userId ,String userEmail , String password){
      Request.writerListener('signUp-' + userId + '-' + userEmail + '-' + password +'-' + password + '-');
      User user= User(password: password , username: userId);
      _accounts.add(user);
    return user;
  }

  static int getLength() {
    return _accounts.length;
  }

  static bool foundUserId(String input) {
    for (int i = 0; i < getLength(); i++) {
      if (accounts[i].username == input) {
        currentAccount = i;
        return false;
      }
    }
    return true;
  }

  static bool editUserId(String input, String oldUserName) {
    if (oldUserName == input) {
      return false;
    }
    for (int i = 0; i < getLength(); i++) {
      if (accounts[i].username == input) {
        return true;
      }
    }
    accounts[currentAccount].username = input;
    return false;
  }

  static bool oldPassword(String input) {
    return !(accounts[currentAccount].password == input);
  }

}
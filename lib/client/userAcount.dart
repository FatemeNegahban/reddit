import 'package:flutter/cupertino.dart';
import 'package:reddit/classes/User.dart';

import '../Request.dart';

class userAccounts {
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

  static User addAccount(User user){

    if(!key){
      Request.writerListener(
          'signUp-' + user.username + '-' + user.email + '-' + user.password+',');
    }if(key){
      _accounts.add(User(password: user.password, username: user.username, email: user.email));
    }
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

  static bool foundEmail(String input) {
    for (int i = 0; i < getLength(); i++) {
      if (accounts[i].email == input) {
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

  static bool editEmail(String input, String oldEmail) {
    if (oldEmail == input) {
      return false;
    }
    for (int i = 0; i < getLength(); i++) {
      if (accounts[i].email == input) {
        return true;
      }
    }
    accounts[currentAccount].email = input;
    return false;
  }

  static bool editPassword(String input) {
    return true;
  }
}
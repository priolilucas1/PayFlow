import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  var _isAuthenticated = false;
  User? _user;

  User get user => _user!;

  void setUser(BuildContext context, var user) {
    if (user != null) {
      _user = user;
      _isAuthenticated = true;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUser(User user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', user.toJson());
    return;
  }

  Future<void> loadCurrentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    final json = instance.get('user') as String;
    setUser(context, User.fromJson(json));
    return;
  }
}

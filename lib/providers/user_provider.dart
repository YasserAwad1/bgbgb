import 'package:flutter/cupertino.dart';
import 'package:kay_sy/models/user_model.dart';

class UserProvider with ChangeNotifier {
  final List<UserModel> _users = [
    UserModel(id: "u1", name: "Ahmad Afif", email: "Test", gender: 1),
    UserModel(id: "u2", name: "Yasser Awad", email: "Test", gender: 1),
    UserModel(id: "u3", name: "Karim Takriti", email: "Test", gender: 1),
  ];
  UserModel findUserById(String id) {
    return _users.firstWhere((element) => element.id == id);
  }
}

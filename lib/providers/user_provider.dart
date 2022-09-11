import 'package:flutter/cupertino.dart';
import 'package:kay_sy/models/user_model.dart';

class UserProvider with ChangeNotifier {
  final List<UserModel> _users = [
    // UserModel(id: "u1", name: "Ahmad Afif", phoneNumber: '0936324541'),
    // UserModel(id: "u2", name: "Yasser Awad", phoneNumber: '0933399568'),
    // UserModel(id: "u3", name: "Karim Takriti", phoneNumber: '0935526232'),
  ];

  List<UserModel> get users {
    return [..._users];
  }

  UserModel findUserById(String id) {
    return _users.firstWhere((element) => element.id == id);
  }

  void addUser(UserModel newUser) {
    _users.add(newUser);
    notifyListeners();
  }
}

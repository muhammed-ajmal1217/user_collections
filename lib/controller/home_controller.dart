import 'dart:developer';
import 'package:appscrip/model/user_model.dart';
import 'package:appscrip/service/api_service.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  List<UserModel>? userDatas = [];
  List<UserModel>? filteredUsers;

  Future<void> getAllUsersData() async {
    try {
      userDatas = await ApiService().getUserData();
      filteredUsers = userDatas;
      notifyListeners();
    } catch (e) {
      log('Error in provider fetching $e');
    }
  }

  Future<void> refreshAllData() async {
    await getAllUsersData();
    notifyListeners();
  }

  void searchUsers(String query) {
    if (query.isEmpty) {
      filteredUsers = userDatas;
    } else {
      filteredUsers = userDatas?.where((user) {
        final name = user.name?.toLowerCase() ?? '';
        return name.contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}

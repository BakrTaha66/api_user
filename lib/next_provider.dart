import 'package:api_user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NextProvider extends ChangeNotifier {
  Dio dio = Dio();
  String url = 'https://reqres.in/api/users';

  UserModel? userModel;

  Future<UserModel> getData() async {
    Response response = await dio.get(url);
    userModel = UserModel.fromJson(response.data);
    notifyListeners();
    return userModel!;
  }
}

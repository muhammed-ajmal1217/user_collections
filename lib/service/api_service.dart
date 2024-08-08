import 'package:appscrip/constants/api_url.dart';
import 'package:appscrip/model/user_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();
  Future<List<UserModel>?> getUserData() async {
    try {
      Response response = await dio.get(ApiUrl.apiUrl);
      if (response.statusCode == 200) {
        List<dynamic> fromJsonList = response.data;
        List<UserModel> userList = fromJsonList
            .map(
              (userData) => UserModel.fromJson(userData),
            )
            .toList();
        return userList;
      } else {
        return null;
      }
    } catch (e) {
      Exception('Error in fetching datas$e');
    }
    return null;
  }
}

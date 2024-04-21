import 'package:logitech/models/user.dart';
import 'package:logitech/services/dio.dart';
import 'package:logitech/config/constants.dart';
import 'package:logitech/models/common.dart';

class UserService {
  static Future<GetProfileResponse> getProfile({
    required String id,
  }) async {
    try {
      final dio = await getDioClient();
      String url = '$apiUrl/api/v1/user/$id';
      final response = await dio.get(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetProfileResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

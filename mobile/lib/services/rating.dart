import 'package:logitech/config/constants.dart';
import 'package:logitech/models/common.dart';
import 'package:logitech/services/dio.dart';

class RatingService {
  static Future<MessageResponse> createRating({
    required String name,
    required String comment,
    required double rating,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/rating/';

      var data = {
        'name': name,
        'comment': comment,
        'rating': rating,
      };

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}

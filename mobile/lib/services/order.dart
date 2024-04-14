import 'package:logitech/config/constants.dart';
import 'package:logitech/models/common.dart';
import 'package:logitech/models/order.dart';
import 'package:logitech/services/dio.dart';

class OrderService {
  static Future<GetOrdersResponse> getOrders({
    required int page,
    required int limit,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/order/';

      final response = await dio.get(
        url,
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetOrdersResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> createOrder({
    required String vehicleType,
    required String startAddress,
    required String destinationAddress,
    required double startLatitude,
    required double startLongitude,
    required double destinationLatitude,
    required double destinationLongitude,
    required String deliveryNote,
    required String totalCost,
    required String totalDistance,
    required String approxWeight,
    required String typeOfGoods,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/order/';

      var data = {
        'vehicleType': vehicleType,
        'startAddress': startAddress,
        'destinationAddress': destinationAddress,
        'startLatitude': startLatitude,
        'startLongitude': startLongitude,
        'destinationLatitude': destinationLatitude,
        'destinationLongitude': destinationLongitude,
        'deliveryNote': deliveryNote,
        'totalCost': totalCost,
        'totalDistance': totalDistance,
        'approxWeight': approxWeight,
        'typeOfGoods': typeOfGoods,
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

  static Future<GetOrderResponse> getOrder({
    required String id,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/order/$id';
      final response = await dio.get(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetOrderResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}

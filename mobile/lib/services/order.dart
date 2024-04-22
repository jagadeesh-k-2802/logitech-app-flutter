import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  static Future<GetOrdersResponse> getOrdersNearby({
    required int radius,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/order/nearby/';
      final response = await dio.get(url, queryParameters: {'radius': radius});

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetOrdersResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<GetOrderStatsResponse> getOrderStats() async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/order/stats/';
      final response = await dio.get(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return GetOrderStatsResponse.fromJson(response.data);
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
    Set<(String, LatLng)>? hubs,
    required String typeOfGoods,
    required double destinationLongitude,
    required String deliveryNote,
    required String totalCost,
    required String totalDistance,
    required String approxWeight,
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
        'hubs': hubs
            ?.map(
              (element) => {
                'address': element.$1,
                'coordinates': [element.$2.longitude, element.$2.latitude]
              },
            )
            .toList(),
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

  static Future<MessageResponse> acceptOrder({
    required String id,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/order/accept/$id';
      final response = await dio.put(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> updateOrderLocation({
    required String id,
    required int index,
    required String message,
    required List<double> coordinates,
    required List<double> userCoordinates,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/order/location/$id';

      final data = {
        'index': index,
        'message': message,
        'coordinates': coordinates,
        'userCoordinates': userCoordinates,
      };

      final response = await dio.put(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return MessageResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> updateOrder({
    required String id,
    required bool isPaymentDone,
  }) async {
    try {
      final dio = await getDioClient();
      final url = '$apiUrl/api/v1/order/$id';

      final data = {
        'isPaymentDone': isPaymentDone,
      };

      final response = await dio.put(url, data: data);

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

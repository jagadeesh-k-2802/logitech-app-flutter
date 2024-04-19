import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logitech/config/constants.dart';
import 'package:logitech/services/dio.dart';
import 'package:logitech/models/auth.dart';
import 'package:logitech/models/common.dart';

class AuthService {
  static Future<TokenResponse> login({
    required String identifier,
    required String password,
    required String fcmToken,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/login';

      var data = {
        'identifier': identifier,
        'password': password,
        'fcmToken': fcmToken
      };

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      var tokenResponse = TokenResponse.fromJson(response.data);
      const storage = FlutterSecureStorage();
      await storage.write(key: tokenKey, value: tokenResponse.token);
      return tokenResponse;
    } catch (error) {
      rethrow;
    }
  }

  static Future<TokenResponse> register({
    String? name,
    required String dateOfBirth,
    required String email,
    required String type,
    required String gender,
    String? phone,
    required String? avatarPath,
    required String password,
    required String fcmToken,
    Map<String, dynamic>? location,
    required Map<String, String> driverDetails,
    required String? aadharCardFile,
    required String? drivingLicenseFile,
    required String? fitnessCertificateFile,
    required String? photoOfVehicleFile,
    required String? driverSelfieFile,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/register';

      FormData data = FormData.fromMap({
        'name': name ?? driverDetails['driverName'],
        'email': email,
        'type': type,
        'gender': gender,
        'phone': phone ?? driverDetails['driverNumber'],
        'dateOfBirth': dateOfBirth,
        'password': password,
        'fcmToken': fcmToken,
        'location': location,
        'driverDetails': driverDetails,
        'avatar': avatarPath != null
            ? await MultipartFile.fromFile(avatarPath)
            : null,
        'aadharCardFile': aadharCardFile != null
            ? await MultipartFile.fromFile(aadharCardFile)
            : null,
        'drivingLicenseFile': drivingLicenseFile != null
            ? await MultipartFile.fromFile(drivingLicenseFile)
            : null,
        'fitnessCertificateFile': fitnessCertificateFile != null
            ? await MultipartFile.fromFile(fitnessCertificateFile)
            : null,
        'photoOfVehicleFile': photoOfVehicleFile != null
            ? await MultipartFile.fromFile(photoOfVehicleFile)
            : null,
        'driverSelfieFile': driverSelfieFile != null
            ? await MultipartFile.fromFile(driverSelfieFile)
            : null,
      });

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      var tokenResponse = TokenResponse.fromJson(response.data);
      const storage = FlutterSecureStorage();
      await storage.write(key: tokenKey, value: tokenResponse.token);
      return tokenResponse;
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> sendConfirmationCode({
    required String email,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/send-confirmation';
      var data = {'email': email};

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

  static Future<MessageResponse> verifyConfirmationCode({
    required String email,
    required String code,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/verify-confirmation';
      var data = {'email': email, 'code': code};

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

  static Future<MessageResponse> logout() async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/logout';

      final response = await dio.get(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      const storage = FlutterSecureStorage();
      await storage.delete(key: tokenKey);
      return MessageResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> updateUserDetails({
    required String name,
    required String email,
    required String phone,
    required String gender,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/update-details';

      var data = {
        'name': name,
        'email': email,
        'phone': phone,
        'gender': gender,
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

  static Future<TokenResponse> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/update-password';

      var data = {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      };

      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      var tokenResponse = TokenResponse.fromJson(response.data);
      const storage = FlutterSecureStorage();
      await storage.write(key: tokenKey, value: tokenResponse.token);
      return tokenResponse;
    } catch (error) {
      rethrow;
    }
  }

  static Future<MessageResponse> updateAvatar({
    String? localFilePath,
    bool removeAvatar = false,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/update-avatar';

      FormData data = FormData.fromMap({
        'removeAvatar': removeAvatar,
      });

      if (localFilePath != null) {
        data.files.add(
          MapEntry('avatar', await MultipartFile.fromFile(localFilePath)),
        );
      }

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

  static Future<MessageResponse> forgotPassword({
    required String email,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/forgot-password';
      var data = {'email': email};
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

  static Future<MessageResponse> verifyForgotPasswordCode({
    required String email,
    required String code,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/verify-forgot-password';
      var data = {'email': email, 'code': code};

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

  static Future<MessageResponse> resetPassword({
    required String code,
    required String password,
  }) async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/reset-password';
      var data = {'code': code, 'password': password};
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

  static Future<UserResponse> getMe() async {
    try {
      final dio = await getDioClient();
      const url = '$apiUrl/api/v1/auth/me';
      final response = await dio.get(url);

      if (response.statusCode != 200) {
        var errorResponse = ErrorResponse.fromJson(response.data);
        throw errorResponse.error;
      }

      return UserResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}

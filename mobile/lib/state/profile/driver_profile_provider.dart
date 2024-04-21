import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logitech/models/user.dart';
import 'package:logitech/services/user.dart';

typedef Data = GetProfileResponseData;

final driverProfileProvider = FutureProvider.autoDispose.family<Data, String>(
  (ref, id) async {
    final response = await UserService.getProfile(id: id);
    return response.data;
  },
);

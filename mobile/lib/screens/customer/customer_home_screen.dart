import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logitech/models/auth.dart';
import 'package:logitech/state/global_state_provider.dart';

class CustomerHomeScreen extends ConsumerWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserResponseData? user = ref.watch(globalStateProvider).user;

    return Scaffold(
      appBar: AppBar(title: Text('Welcome, ${user?.name}')),
      body: null,
    );
  }
}

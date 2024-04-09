import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/state/global_state_provider.dart';
import 'package:logitech/services/auth.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final user = await AuthService.getMe();
        ref.read(globalStateProvider.notifier).setUser(user.data);
        if (!mounted) return;

        // Navigate according to user type
        if (user.data.type == 'customer') {
          context.goNamed(Routes.customerHome);
        } else {
          context.goNamed(Routes.driverHome);
        }
      } catch (error) {
        context.goNamed(Routes.chooseApplication);
      } finally {
        FlutterNativeSplash.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: null);
  }
}

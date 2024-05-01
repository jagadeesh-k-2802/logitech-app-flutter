import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logitech/models/auth.dart';
import 'package:logitech/state/global_state_provider.dart';
import 'package:logitech/state/notification/notifications_provider.dart';

// This is only shell of home screen not full page
class DriverShell extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const DriverShell({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey('DriverShell'));

  @override
  ConsumerState<DriverShell> createState() => _DriverShellState();
}

class _DriverShellState extends ConsumerState<DriverShell> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Update state when notification recieved when on foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        ref.read(globalStateProvider.notifier).onNotification();
        ref.read(notificationsProvider.notifier).invalidate();
      });

      if (!mounted) return;
    });
  }

  void onNavigate(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.watch(globalStateProvider).user;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onNavigate,
        currentIndex: widget.navigationShell.currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            label: 'Home',
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
          ),
          const BottomNavigationBarItem(
            label: 'Orders',
            activeIcon: Icon(Icons.local_shipping),
            icon: Icon(Icons.local_shipping_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Notifications',
            activeIcon: const Icon(Icons.notifications),
            icon: (user?.unReadNotificationsCount ?? 0) > 0
                ? Badge.count(
                    count: user?.unReadNotificationsCount ?? 0,
                    child: const Icon(Icons.notifications_outlined),
                  )
                : const Icon(Icons.notifications_outlined),
          ),
          const BottomNavigationBarItem(
            label: 'Account',
            activeIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: widget.navigationShell,
    );
  }
}

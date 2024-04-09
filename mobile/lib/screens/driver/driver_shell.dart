import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      await FirebaseMessaging.instance.requestPermission(provisional: true);

      // Update state when notification recieved when on foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // TODO: Update notification
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onNavigate,
        currentIndex: widget.navigationShell.currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Orders',
            activeIcon: Icon(Icons.local_shipping),
            icon: Icon(Icons.local_shipping_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Notifications',
            activeIcon: Icon(Icons.notifications),
            icon: Icon(Icons.notifications_outlined),
          ),
          BottomNavigationBarItem(
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

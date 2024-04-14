import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logitech/models/auth.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/services/auth.dart';
import 'package:logitech/state/global_state_provider.dart';
import 'package:app_settings/app_settings.dart';
import 'package:logitech/widgets/core/clickable_list_item.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  Future<void> onLogout() async {
    try {
      await AuthService.logout();
      ref.read(globalStateProvider.notifier).setUser(null);
      if (!mounted) return;
      context.goNamed(Routes.chooseApplication);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: onLogout,
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.read(globalStateProvider).user;

    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClickableListItem(
              prefixIcon: Icons.account_box,
              text: '${user?.name}',
              onTap: () => user?.type == UserType.customer
                  ? context.pushNamed(Routes.customerProfile)
                  : context.pushNamed(Routes.driverProfile),
              suffixIcon: Icons.chevron_right,
            ),
            const Divider(),
            ClickableListItem(
              prefixIcon: Icons.notifications,
              text: 'Notification Settings',
              onTap: () async => await AppSettings.openAppSettings(
                type: AppSettingsType.notification,
              ),
              suffixIcon: Icons.chevron_right,
            ),
            const Divider(),
            ClickableListItem(
              prefixIcon: Icons.logout,
              text: 'Logout',
              textColor: Colors.red,
              onTap: () => showLogoutDialog(),
            ),
          ],
        ),
      ),
    );
  }
}

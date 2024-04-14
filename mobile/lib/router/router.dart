import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/screens/auth/change_password_screen.dart';
import 'package:logitech/screens/auth/choose_application_screen.dart';
import 'package:logitech/screens/common/account_screen.dart';
import 'package:logitech/screens/common/notifications_screen.dart';
import 'package:logitech/screens/common/profile_screen.dart';
import 'package:logitech/screens/customer/customer_home_screen.dart';
import 'package:logitech/screens/customer/customer_orders_screen.dart';
import 'package:logitech/screens/customer/customer_shell.dart';
import 'package:logitech/screens/customer/rating_screen.dart';
import 'package:logitech/screens/customer/order_confirmed_screen.dart';
import 'package:logitech/screens/customer/order_detail_screen.dart';
import 'package:logitech/screens/customer/place_order_screen.dart';
import 'package:logitech/screens/driver/driver_home_screen.dart';
import 'package:logitech/screens/driver/driver_orders_screen.dart';
import 'package:logitech/screens/driver/driver_shell.dart';
import 'package:logitech/screens/splash_screen.dart';
import 'package:logitech/screens/auth/customer_auth_screen.dart';
import 'package:logitech/screens/auth/driver_auth_screen.dart';
import 'package:logitech/screens/auth/forgot_password_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final List<RouteBase> _routes = [
  GoRoute(
    name: Routes.splash,
    path: '/${Routes.splash}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: SplashScreen(),
    ),
  ),
  GoRoute(
    name: Routes.chooseApplication,
    path: '/${Routes.chooseApplication}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: ChooseApplicationScreen(),
    ),
  ),
  GoRoute(
    name: Routes.customerAuth,
    path: '/${Routes.customerAuth}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: CustomerAuthScreen(),
    ),
  ),
  GoRoute(
    name: Routes.driverAuth,
    path: '/${Routes.driverAuth}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: DriverAuthScreen(),
    ),
  ),
  GoRoute(
    name: Routes.forgotPassword,
    path: '/${Routes.forgotPassword}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: ForgotPasswordScreen(),
    ),
  ),
  GoRoute(
    name: Routes.changePassword,
    path: '/${Routes.changePassword}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: ChangePasswordScreen(),
    ),
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return CustomerShell(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: Routes.customerHome,
            path: '/${Routes.customerHome}',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CustomerHomeScreen(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(routes: [
        GoRoute(
          name: Routes.customerOrders,
          path: '/${Routes.customerOrders}',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: CustomerOrdersScreen(),
          ),
        ),
        GoRoute(
          name: Routes.customerOrderDetailPath(''),
          path: '${Routes.customerOrderDetailPath(':id')}',
          pageBuilder: (context, state) => NoTransitionPage(
            child: OrderDetailScreen(
              id: state.pathParameters['id'] as String,
            ),
          ),
        ),
      ]),
      StatefulShellBranch(routes: [
        GoRoute(
          name: Routes.customerNotification,
          path: '/${Routes.customerNotification}',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: NotificationsScreen(),
          ),
        ),
      ]),
      StatefulShellBranch(routes: [
        GoRoute(
          name: Routes.customerAccount,
          path: '/${Routes.customerAccount}',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AccountScreen(),
          ),
        ),
        GoRoute(
          name: Routes.customerProfile,
          path: '/${Routes.customerProfile}',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProfileScreen(),
          ),
        ),
      ]),
    ],
  ),
  GoRoute(
    name: Routes.placeOrder,
    path: '/${Routes.placeOrder}',
    pageBuilder: (context, state) => NoTransitionPage(
      child: PlaceOrderScreen(state.extra),
    ),
  ),
  GoRoute(
    name: Routes.orderConfirmed,
    path: '/${Routes.orderConfirmed}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: OrderConfirmedScreen(),
    ),
  ),
  GoRoute(
    name: Routes.rating,
    path: '/${Routes.rating}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: RatingScreen(),
    ),
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return DriverShell(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: Routes.driverHome,
            path: '/${Routes.driverHome}',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DriverHomeScreen(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: Routes.driverOrders,
            path: '/${Routes.driverOrders}',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DriverOrdersScreen(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(routes: [
        GoRoute(
          name: Routes.driverNotification,
          path: '/${Routes.driverNotification}',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: NotificationsScreen(),
          ),
        ),
      ]),
      StatefulShellBranch(routes: [
        GoRoute(
          name: Routes.driverAccount,
          path: '/${Routes.driverAccount}',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AccountScreen(),
          ),
        ),
        GoRoute(
          name: Routes.driverProfile,
          path: '/${Routes.driverProfile}',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProfileScreen(),
          ),
        ),
      ]),
    ],
  ),
];

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: _rootNavigatorKey,
  routes: _routes,
);

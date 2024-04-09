import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/theme/theme.dart';

class ChooseApplicationScreen extends StatefulWidget {
  const ChooseApplicationScreen({super.key});

  @override
  State<ChooseApplicationScreen> createState() =>
      _ChooseApplicationScreenState();
}

class _ChooseApplicationScreenState extends State<ChooseApplicationScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LogiTech', style: textTheme.headlineLarge),
              const SizedBox(height: 32.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => context.pushNamed(Routes.customerAuth),
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Card(
                        surfaceTintColor: Colors.lightBlue,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.person_outline,
                                size: 48.0,
                              ),
                              const SizedBox(height: 4.0),
                              Text('Customer', style: textTheme.bodyLarge),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  InkWell(
                    onTap: () => context.pushNamed(Routes.driverAuth),
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Card(
                        surfaceTintColor: Colors.lightBlue,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.local_shipping_outlined,
                                size: 48.0,
                              ),
                              const SizedBox(height: 4.0),
                              Text('Driver', style: textTheme.bodyLarge),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

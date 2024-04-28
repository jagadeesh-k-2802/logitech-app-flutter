import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logitech/models/auth.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/services/auth.dart';
import 'package:logitech/state/global_state_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:logitech/utils/functions.dart';

class CustomerAuthScreen extends ConsumerStatefulWidget {
  const CustomerAuthScreen({super.key});

  @override
  ConsumerState<CustomerAuthScreen> createState() => _CustomerAuthScreenState();
}

class _CustomerAuthScreenState extends ConsumerState<CustomerAuthScreen> {
  bool isLogin = true;
  bool obscureText = true;
  List<double> coordinates = List.empty();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  String typeOfUse = 'Personal';

  @override
  void dispose() {
    nameController.dispose();
    genderController.dispose();
    dobController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    companyNameController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() => obscureText = !obscureText);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dobController.text = picked.toString().split(' ')[0];
      });
    }
  }

  Future<void> onLogin() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';

      await AuthService.login(
        identifier: emailController.text,
        password: passwordController.text,
        fcmToken: fcmToken,
      );

      UserResponse userResponse = await AuthService.getMe();
      ref.read(globalStateProvider.notifier).setUser(userResponse.data);

      if (!mounted) return;
      context.goNamed(Routes.customerHome);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> fetchLocation() async {
    try {
      addressController.text = 'Fetching Location...';
      var location = await getCurrentLocation(context);
      coordinates = [location?.$1.latitude ?? 0, location?.$1.longitude ?? 0];
      addressController.text = location?.$2 ?? '';
    } catch (error) {
      addressController.text = '';
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> onSignup() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';

      await AuthService.register(
        name: nameController.text,
        dateOfBirth: dobController.text,
        type: UserType.customer.name,
        email: emailController.text,
        phone: phoneController.text,
        gender: genderController.text,
        avatarPath: null,
        location: {
          'type': 'Point',
          'address': addressController.text,
          'coordinates': coordinates
        },
        password: passwordController.text,
        fcmToken: fcmToken,
        driverDetails: {},
        aadharCardFile: null,
        drivingLicenseFile: null,
        fitnessCertificateFile: null,
        photoOfVehicleFile: null,
        driverSelfieFile: null,
      );

      UserResponse userResponse = await AuthService.getMe();
      ref.read(globalStateProvider.notifier).setUser(userResponse.data);

      if (!mounted) return;
      context.goNamed(Routes.customerHome);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isLogin ? 'Customer Login' : 'Customer Sign Up',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            if (!isLogin)
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                keyboardType: TextInputType.name,
              ),
            if (!isLogin) const SizedBox(height: 16.0),
            if (!isLogin)
              DropdownButtonFormField(
                value: genderController.text.isNotEmpty
                    ? genderController.text
                    : null,
                decoration: const InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    genderController.text = value.toString();
                  });
                },
              ),
            if (!isLogin) const SizedBox(height: 16.0),
            if (!isLogin)
              GestureDetector(
                onTap: () => selectDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: dobController,
                    decoration:
                        const InputDecoration(labelText: 'Date of Birth'),
                  ),
                ),
              ),
            const SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: togglePasswordVisibility,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: obscureText,
            ),
            if (!isLogin) const SizedBox(height: 16.0),
            if (!isLogin)
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
              ),
            if (!isLogin) const SizedBox(height: 16.0),
            if (!isLogin)
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  suffixIcon: IconButton(
                    onPressed: fetchLocation,
                    icon: const Icon(Icons.location_on),
                  ),
                ),
                keyboardType: TextInputType.streetAddress,
                minLines: 2,
                maxLines: 3,
              ),
            if (!isLogin) const SizedBox(height: 16.0),
            if (!isLogin)
              DropdownButtonFormField(
                value: typeOfUse,
                decoration: const InputDecoration(
                  labelText: 'Company/Personal Use',
                ),
                items: ['Company', 'Personal'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    typeOfUse = value.toString();
                  });
                },
              ),
            if (!isLogin && typeOfUse == 'Company')
              const SizedBox(height: 16.0),
            if (!isLogin && typeOfUse == 'Company')
              TextField(
                controller: companyNameController,
                decoration: const InputDecoration(labelText: 'Company Name'),
              ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                isLogin ? onLogin() : onSignup();
              },
              child: Text(isLogin ? 'Login' : 'Sign Up'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text(isLogin
                  ? 'Don\'t have an account? Sign Up'
                  : 'Already have an account? Login'),
            ),
            Visibility(
              visible: isLogin,
              child: TextButton(
                onPressed: () => context.pushNamed(Routes.forgotPassword),
                child: const Text('Forgot Password'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

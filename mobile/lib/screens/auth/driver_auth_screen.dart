import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logitech/models/auth.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/services/auth.dart';
import 'package:logitech/state/global_state_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:logitech/utils/functions.dart';

class DriverAuthScreen extends ConsumerStatefulWidget {
  const DriverAuthScreen({super.key});

  @override
  ConsumerState<DriverAuthScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<DriverAuthScreen> {
  bool isLogin = true;
  bool obscureText = true;
  bool showDocumentScreen = false;
  final formKey = GlobalKey<FormState>();
  List<double> coordinates = List.empty();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ownerNumberController = TextEditingController();
  TextEditingController driverNumberController = TextEditingController();
  TextEditingController upiIdController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController driverNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController vehicleBodyTypeController = TextEditingController();
  TextEditingController vehicleCapacityController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController drivingLicenseController = TextEditingController();

  String? aadharCardFilePath;
  String? drivingLicenseFilePath;
  String? fcCertificateFilePath;
  String? vehiclePhotoFilePath;
  String? driverSelfieFilePath;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    ownerNumberController.dispose();
    driverNumberController.dispose();
    ownerNameController.dispose();
    driverNameController.dispose();
    cityController.dispose();
    vehicleBodyTypeController.dispose();
    vehicleCapacityController.dispose();
    vehicleNumberController.dispose();
    drivingLicenseController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() => obscureText = !obscureText);
  }

  Future<void> pickFile(String fileType) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        switch (fileType) {
          case 'aadharCard':
            aadharCardFilePath = image.path;
            break;
          case 'drivingLicense':
            drivingLicenseFilePath = image.path;
            break;
          case 'fcCertificate':
            fcCertificateFilePath = image.path;
            break;
          case 'vehiclePhoto':
            vehiclePhotoFilePath = image.path;
            break;
          case 'driverSelfie':
            driverSelfieFilePath = image.path;
            break;
        }
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dobController.text = picked.toString().split(' ')[0];
      });
    }
  }

  Future<void> onLogin() async {
    if (formKey.currentState?.validate() == false) return;

    try {
      final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';

      await AuthService.login(
        identifier: emailController.text,
        password: passwordController.text,
        fcmToken: fcmToken,
      );

      UserResponse userResponse = await AuthService.getMe();

      if (userResponse.data.type == UserType.customer) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please Login using Customer Login')),
        );
      } else {
        ref.read(globalStateProvider.notifier).setUser(userResponse.data);
        if (!mounted) return;
        context.goNamed(Routes.driverHome);
      }
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> onGoToDocumentScreen() async {
    if (formKey.currentState?.validate() == false) return;

    if (coordinates.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tap on Location Button in City')),
      );

      return;
    }

    setState(() => showDocumentScreen = true);
  }

  Future<void> onSignup() async {
    if (aadharCardFilePath?.isEmpty == true ||
        drivingLicenseFilePath?.isEmpty == true ||
        fcCertificateFilePath?.isEmpty == true ||
        vehiclePhotoFilePath?.isEmpty == true ||
        driverSelfieFilePath?.isEmpty == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Upload all files')),
      );

      return;
    }

    try {
      final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';

      await AuthService.register(
        dateOfBirth: dobController.text,
        email: emailController.text,
        phone: null,
        type: UserType.driver.name,
        gender: genderController.text,
        avatarPath: null,
        password: passwordController.text,
        fcmToken: fcmToken,
        location: {
          'type': 'Point',
          'address': cityController.text,
          'coordinates': coordinates
        },
        driverDetails: {
          'ownerNumber': ownerNumberController.text,
          'driverNumber': driverNumberController.text,
          'ownerName': ownerNameController.text,
          'driverName': driverNameController.text,
          'upiId': upiIdController.text,
          'vehicleBodyType': vehicleBodyTypeController.text,
          'vehicleCapacity': vehicleCapacityController.text,
          'vehicleNumber': vehicleNumberController.text,
          'drivingLicenseNumber': drivingLicenseController.text,
        },
        aadharCardFile: aadharCardFilePath,
        drivingLicenseFile: drivingLicenseFilePath,
        fitnessCertificateFile: fcCertificateFilePath,
        photoOfVehicleFile: vehiclePhotoFilePath,
        driverSelfieFile: driverSelfieFilePath,
      );

      UserResponse userResponse = await AuthService.getMe();
      ref.read(globalStateProvider.notifier).setUser(userResponse.data);

      if (!mounted) return;
      context.goNamed(Routes.driverHome);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> fetchLocation() async {
    try {
      cityController.text = 'Fetching Location...';
      var location = await getCurrentLocation(context);
      coordinates = [location?.$1.latitude ?? 0, location?.$1.longitude ?? 0];
      cityController.text = location?.$2 ?? '';
    } catch (error) {
      cityController.text = '';
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Widget documentScreen() {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Documents')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: null,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(defaultPagePadding),
        child: ElevatedButton(
          onPressed: () => onSignup(),
          child: const Text('Start Taking Orders'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            const Text('Aadhar Card'),
            const SizedBox(height: 4.0),
            ElevatedButton(
              onPressed: () => pickFile('aadharCard'),
              child: Text(
                aadharCardFilePath?.split('/').last ?? 'Choose File',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Driving License'),
            const SizedBox(height: 4.0),
            ElevatedButton(
              onPressed: () => pickFile('drivingLicense'),
              child: Text(
                drivingLicenseFilePath?.split('/').last ?? 'Choose File',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Vehicle Fitness Certificate (FC)'),
            const SizedBox(height: 4.0),
            ElevatedButton(
              onPressed: () => pickFile('fcCertificate'),
              child: Text(
                fcCertificateFilePath?.split('/').last ?? 'Choose File',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Photo of Vehicle'),
            const SizedBox(height: 4.0),
            ElevatedButton(
              onPressed: () => pickFile('vehiclePhoto'),
              child: Text(
                vehiclePhotoFilePath?.split('/').last ?? 'Choose File',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Driver Selfie'),
            const SizedBox(height: 4.0),
            ElevatedButton(
              onPressed: () => pickFile('driverSelfie'),
              child: Text(
                driverSelfieFilePath?.split('/').last ?? 'Choose File',
              ),
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showDocumentScreen) return documentScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isLogin ? 'Driver Login' : 'Driver Sign Up',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              if (!isLogin) const SizedBox(height: 16.0),
              if (!isLogin)
                TextFormField(
                  controller: ownerNameController,
                  decoration: const InputDecoration(labelText: 'Owner Name'),
                  keyboardType: TextInputType.name,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "Owner Name is required";
                    }

                    if ((value?.length ?? 0) < 5) {
                      return "Owner Name should be atleast 5 characters";
                    }

                    return null;
                  },
                ),
              if (!isLogin) const SizedBox(height: 16.0),
              if (!isLogin)
                TextFormField(
                  controller: driverNameController,
                  decoration: const InputDecoration(labelText: 'Driver Name'),
                  keyboardType: TextInputType.name,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "Driver Name is required";
                    }

                    if ((value?.length ?? 0) < 5) {
                      return "Driver Name should be atleast 5 characters";
                    }

                    return null;
                  },
                ),
              if (!isLogin) const SizedBox(height: 16.0),
              if (!isLogin)
                TextFormField(
                  controller: ownerNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Owner Phone Number',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "Owner Phone Number is required";
                    }

                    if ((value?.length ?? 0) != 10) {
                      return "Owner Phone Number should be 10 characters";
                    }

                    return null;
                  },
                ),
              if (!isLogin) const SizedBox(height: 16.0),
              if (!isLogin)
                TextFormField(
                  controller: driverNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Driver Phone Number',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "Driver Phone Number is required";
                    }

                    if ((value?.length ?? 0) != 10) {
                      return "Driver Phone Number should be 10 characters";
                    }

                    return null;
                  },
                ),
              if (!isLogin) const SizedBox(height: 16.0),
              if (!isLogin)
                TextFormField(
                  controller: upiIdController,
                  decoration: const InputDecoration(
                    labelText: 'UPI ID (For Payments)',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "UPI ID is required";
                    }

                    return null;
                  },
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
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "Gender is required";
                    }

                    return null;
                  },
                ),
              if (!isLogin) const SizedBox(height: 16.0),
              if (!isLogin)
                GestureDetector(
                  onTap: () => selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: dobController,
                      decoration: const InputDecoration(
                        labelText: 'Date of Birth',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty == true) {
                          return "Date of Birth is required";
                        }

                        return null;
                      },
                    ),
                  ),
                ),
              if (!isLogin) const SizedBox(height: 16.0),
              if (!isLogin)
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: 'City',
                    suffixIcon: IconButton(
                      onPressed: fetchLocation,
                      icon: const Icon(Icons.location_on),
                    ),
                  ),
                  keyboardType: TextInputType.streetAddress,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "City is required";
                    }

                    return null;
                  },
                ),
              if (!isLogin) const SizedBox(height: 16.0),
              if (!isLogin)
                DropdownButtonFormField(
                  value: vehicleBodyTypeController.text.isNotEmpty
                      ? vehicleBodyTypeController.text
                      : null,
                  decoration: const InputDecoration(
                    labelText: 'Vehicle Body Type',
                  ),
                  items: [
                    'Goods Container (Opened)',
                    'Goods Container (Closed)',
                    'Refrigerated Container',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      vehicleBodyTypeController.text = value.toString();
                    });
                  },
                ),
              if (!isLogin) const SizedBox(height: 16.0),
              if (!isLogin)
                TextFormField(
                  controller: vehicleCapacityController,
                  decoration: const InputDecoration(
                    labelText: 'Vehicle Capacity (Litres)',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "Vehicle Capacity is required";
                    }

                    return null;
                  },
                ),
              if (!isLogin) const SizedBox(height: 16.0),
              if (!isLogin)
                TextFormField(
                  controller: vehicleNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Vehicle Registration Number',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "Vehicle Registration is required";
                    }

                    return null;
                  },
                ),
              if (!isLogin) const SizedBox(height: 16.0),
              if (!isLogin)
                TextFormField(
                  controller: drivingLicenseController,
                  decoration: const InputDecoration(
                    labelText: 'Driving License Number',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "Driving License Number is required";
                    }

                    return null;
                  },
                ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value?.isEmpty == true) {
                    return "Email is required";
                  }

                  if (!validEmailAddress(value)) {
                    return "Please, Enter valid email";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
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
                obscureText: obscureText,
                keyboardType: TextInputType.visiblePassword,
                validator: (String? value) {
                  if (value?.isEmpty == true) {
                    return "Password is required";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  isLogin ? onLogin() : onGoToDocumentScreen();
                },
                child: Text(isLogin ? 'Login' : 'Sign Up'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  setState(() => isLogin = !isLogin);
                },
                child: Text(
                  isLogin
                      ? 'Don\'t have an account? Sign Up'
                      : 'Already have an account? Login',
                ),
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
      ),
    );
  }
}

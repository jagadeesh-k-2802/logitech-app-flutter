import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logitech/config/constants.dart';
import 'package:logitech/models/auth.dart';
import 'package:logitech/services/auth.dart';
import 'package:logitech/state/global_state_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:logitech/widgets/core/clickable_list_item.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? selectedGender;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      UserResponseData? user = ref.read(globalStateProvider).user;
      nameController.text = user?.name ?? '';
      emailController.text = user?.email ?? '';
      phoneController.text = user?.phone ?? '';
      selectedGender = user?.gender;
      setState(() {});
    });
  }

  Future<void> onNewProfilePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    CroppedFile? file = await ImageCropper().cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Photo',
          toolbarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop Photo',
        ),
      ],
    );

    if (file == null) return;

    try {
      await AuthService.updateAvatar(localFilePath: file.path);
      UserResponse userResponse = await AuthService.getMe();
      final appState = ref.read(globalStateProvider.notifier);
      appState.setUser(userResponse.data);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> onProfilePictureRemove() async {
    try {
      await AuthService.updateAvatar(removeAvatar: true);
      UserResponse userResponse = await AuthService.getMe();
      final appState = ref.read(globalStateProvider.notifier);
      appState.setUser(userResponse.data);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  void showProfilePhotoChangeModal({UserResponseData? user}) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 120,
          width: double.maxFinite,
          child: Column(
            children: [
              ClickableListItem(
                prefixIcon: Icons.photo,
                text: 'New Profile Picture',
                onTap: () {
                  Navigator.pop(context);
                  onNewProfilePicture();
                },
              ),
              Visibility(
                visible: user?.avatar != 'default-profile.png',
                child: ClickableListItem(
                  text: 'Remove Current Picture',
                  textColor: Colors.red,
                  prefixIcon: Icons.delete,
                  onTap: () {
                    Navigator.pop(context);
                    onProfilePictureRemove();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> onUpdateProfileInformation() async {
    if (formKey.currentState?.validate() == false) return;

    try {
      await AuthService.updateUserDetails(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: selectedGender ?? '',
      );

      UserResponse userResponse = await AuthService.getMe();
      final appState = ref.read(globalStateProvider.notifier);
      appState.setUser(userResponse.data);
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile details have been updated')),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.watch(globalStateProvider).user;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: ClipOval(
                  child: CircleAvatar(
                    radius: 60,
                    child: CachedNetworkImage(
                      imageUrl: '$apiUrl/avatar/${user?.avatar}',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              TextButton(
                onPressed: () => showProfilePhotoChangeModal(user: user),
                child: const Text('Change Profile Photo'),
              ),
              const SizedBox(height: 14),
              Form(
                key: formKey,
                child: Column(children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return 'Please, Enter your name';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return 'Please, Enter your email';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Add Phone Number',
                    ),
                  ),
                  const SizedBox(height: 14),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      hintText: 'Gender',
                    ),
                    value: selectedGender,
                    icon: const Icon(Icons.arrow_drop_down_sharp),
                    elevation: 16,
                    onChanged: (String? value) {
                      setState(() => selectedGender = value);
                    },
                    validator: (String? value) {
                      if (selectedGender == null) {
                        return 'Please, Select your Gender';
                      }

                      return null;
                    },
                    items: ['Male', 'Female'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ]),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onUpdateProfileInformation,
                child: const Text('Update Profile'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

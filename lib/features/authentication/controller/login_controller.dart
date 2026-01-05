import 'package:e_commerce_web/data/repository.authentications/authentication_repo/authentication_repository.dart';
import 'package:e_commerce_web/data/repository.authentications/user_repo/user_repository.dart';
import 'package:e_commerce_web/features/authentication/controller/user_controller.dart';
import 'package:e_commerce_web/features/authentication/model/user_model.dart';
import 'package:e_commerce_web/utils/constants/enums.dart';
import 'package:e_commerce_web/utils/constants/image_strings.dart';
import 'package:e_commerce_web/utils/helpers/network_manager.dart';
import 'package:e_commerce_web/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_web/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    emailController.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    passwordController.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
  }

  /// Handles email and password sign-in process
  Future<void> emailAndPasswordSignIn() async {
    try {
      /// Start loading
      TFullScreenLoader.openLoadingDialog(
        'Logging you in......',
        TImagePath.docerAnimation,
      );

      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validations
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Save DATA if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', emailController.text.trim());
        localStorage.write(
          'REMEMBER_ME_PASSWORD',
          passwordController.text.trim(),
        );
      }

      /// Login user using Email and Password Authentication
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      /// Fetch user details and assign to User Controller
      final user = await UserController.instance.fetchUserDetails();

      /// Remove Loader
      TFullScreenLoader.stopLoading();
      if (kDebugMode) {
        print('User Role: ${user.role}');
      }

      /// If the user in not admin, logout and return
      if (user.role != AppRole.admin) {
        await AuthenticationRepository.instance.logout();
        TLoaders.errorSnackBar(
          title: 'Not Authorized',
          message: 'You are not authorized or do have access. Contact Admin',
        );
      } else {
        /// Redirect
        AuthenticationRepository.instance.screenRedirect();
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Handles registration of Admin user
  Future<void> registerAdmin({
    required String email,
    required String password,
  }) async {
    try {
      /// Start loading
      TFullScreenLoader.openLoadingDialog(
        'Registering Admin.....',
        TImagePath.docerAnimation,
      );

      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validations
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        // return;
      }

      /// Register user using Email and Password Authentications
      await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// Create admin record in the Firestore
      final userRepository = Get.put(UserRepository());
      final User? registeredUser = FirebaseAuth.instance.currentUser;
      if (kDebugMode) {
        print("Registered User: $registeredUser");
      }
      if (registeredUser != null) {
        await userRepository.createUser(
          users: UserModel(
            id: registeredUser.uid,
            firstName: 'CwA',
            lastName: 'Admin',
            role: AppRole.admin,
            createdAt: DateTime.now(),
            email: email,
          ),
        );
      } else {
        throw "Registration Successfully but user object is null. Please login";
      }

      /// Remove Loader
      TFullScreenLoader.stopLoading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      if (e is FirebaseAuthException) {
        TLoaders.errorSnackBar(
          title: 'Firebase Auth Excetpion',
          message: e.toString(),
        );
      } else if (e is FirebaseException) {
        TLoaders.errorSnackBar(
          title: 'Firebase Exception',
          message: e.stackTrace,
        );
      } else {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Oh Snap', message: e);
      }
    }
  }
}

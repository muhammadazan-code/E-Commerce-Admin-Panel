import 'package:e_commerce_web/data/repository.authentications/user_repo/user_repository.dart';
import 'package:e_commerce_web/features/authentication/model/user_model.dart';
import 'package:e_commerce_web/utils/popups/loaders.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Fetch user details from the repository
  Future<UserModel> fetchUserDetails() async {
    try {
      final user = await UserRepository.instance.fetchAdminDetails();
      if (kDebugMode) {
        print("User Controller fetch Details Admin $user");
      }
      if (kDebugMode) {
        print('USER CONTROLLER User Role: ${user.role}');
      }
      return user;
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'fetch User Controller details Something went wrong',
        message: e.toString(),
      );
      return UserModel.empty();
    }
  }
}

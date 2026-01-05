import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_web/data/repository.authentications/authentication_repo/authentication_repository.dart';
import 'package:e_commerce_web/features/authentication/model/user_model.dart';
import 'package:e_commerce_web/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_web/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_web/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_web/utils/exceptions/platform_exceptions.dart'
    show TPlatformException;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// Firebase Firestor instance
  final _db = FirebaseFirestore.instance;

  /// Method to save the user data to Firestore
  Future<void> createUser({required UserModel users}) async {
    try {
      if (kDebugMode) {
        print(
          'Create User to save the user record method called from user repo.',
        );
      }
      final user = await _db
          .collection('Users')
          .doc(users.id)
          .set(users.toJson());
      if (kDebugMode) {
        user;
        print("Create user user repo");
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("User Repo fauthex $e");
      }
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("User Repo fex $e");
      }
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("User Repo platformException ${e.stacktrace}");
      }
      throw TPlatformException(e.code).message;
    } on FormatException catch (e) {
      if (kDebugMode) {
        print("User Repo formatexception ${e.source}");
      }

      throw TFormatException();
    } catch (e) {
      throw "Something went wrong. $e";
    }
  }

  /// Function to fetch user details based on User ID.
  Future<UserModel> fetchAdminDetails() async {
    try {
      final docSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .get();
      if (kDebugMode) {
        print("uSER REPO FETCH METHOD CALLED $docSnapshot");
      }
      return UserModel.fromSnapshot(docSnapshot);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } catch (e) {
      throw "Something went wrong. $e";
    }
  }
}

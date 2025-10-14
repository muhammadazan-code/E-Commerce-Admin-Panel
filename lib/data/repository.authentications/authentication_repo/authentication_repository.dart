import 'package:e_commerce_web/Routes/routes.dart';
import 'package:e_commerce_web/utils/exceptions/export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Firebase Auth Instance
  final _auth = FirebaseAuth.instance;

  /// Get Authenticated User data
  User? get authUser => _auth.currentUser;

  /// Get isAuthenticated User
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }

  /// LOGIN
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      if (kDebugMode) {
        print("Authentication Repo. Login to you.");
      }
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  /// REGISTER
  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      if (kDebugMode) {
        print("Authentication Repo. Creating an accout.....");
      }
      return await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("Firebase Auth $e");
      }

      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Firebase Exception $e");
      }
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Platform Exception....$e");
      }

      throw TPlatformException(e.code).message;
    } on FormatException catch (_) {
      if (kDebugMode) {
        print("Format Exception.");
      }
      throw TFormatException();
    } catch (e) {
      throw "Something went wrong. $e";
    }
  }

  /// Function to determine the relevant screen and redirect it accordingly
  void screenRedirect() async {
    if (kDebugMode) {
      print('Screen Direct');
    }
    final user = _auth.currentUser;
    /// If the user is logged in
    if (user != null) {
      /// Navigate to the Dashboard Screen
      Get.offAllNamed(TRoutes.dashboard);
    } else {
      /// Navigate to the Login Screen
      Get.offAllNamed(TRoutes.login);
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(TRoutes.login);
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

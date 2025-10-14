import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_web/utils/constants/enums.dart';
import 'package:e_commerce_web/utils/formatters/formatter.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String phoneNumber;
  final String profilePicture;
  final AppRole role;
  final String email;
  final String username;
  final String? id;

  /// Constructor for UserModel
  UserModel({
    this.firstName = "",
    this.lastName = "",
    this.createdAt,
    this.updatedAt,
    this.phoneNumber = "",
    this.profilePicture = "",
    this.role = AppRole.user,
    this.email = "",
    this.username = "",
    this.id,
  });

  /// Helper method
  String get fullName => "$firstName $lastName";
  String get formattedDate => TFormatter.formatData(createdAt);
  String get formatPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to create an empty user model
  static UserModel empty() => UserModel(email: '');

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'PhoneNumber': phoneNumber,
      'Username': username,
      'UpdatedAt': updatedAt,
      'ProfilePicture': profilePicture,
      'CreatedAt': createdAt,
      'Role': role.name,
      'Email': email,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data();
      if (kDebugMode) {
        print("It is called from User model $data");
        final role = data!['Role'];
        print(role);
        print(role.runtimeType);
        print('dfdadfa');
        if (data['Role'] == 'Admin') {
          print(data['Role'].runtimeType);
        }
      }
      return UserModel(
        id: document.id,

        /// If the data contains key FirstName then we get the value of FirstName else not.
        firstName: data!.containsKey('FirstName')
            ? data['FirstName'] ?? 'Null First Name 1'
            : 'Null First Name 2',

        /// If the data contains key LastName then we get the value of LastName else not.
        lastName: data.containsKey('LastName')
            ? data['LastName'] ?? 'Null Last Name 1'
            : 'Null Last Name 2',

        /// If the data contains key Username then we get the value of Username else not.
        username: data.containsKey('Username')
            ? data['Username'] ?? 'username null 1'
            : 'username null 2',

        /// If the data contains key Email then we get the value of Email else not.
        email: data.containsKey('Email')
            ? data['Email'] ?? "Email Null 1"
            : "Email Null 2",

        /// If then data contains key PhoneNumber then we get the value of PhoneNumber else not.
        phoneNumber: data.containsKey('PhoneNumber')
            ? data['PhoneNumber'] ?? 'phone number null 1'
            : 'phone number null 2',

        /// If the data contains key ProfilePicture then we get the value of ProfilePicture else not.
        profilePicture: data.containsKey('ProfilePicture')
            ? data['ProfilePicture'] ?? 'NULL PP 1'
            : 'NULL PP 2',

        /// If the data contains key CreatedAt then it gets the vaue of CreatedAt else not.
        createdAt: data.containsKey('CreatedAt')
            ? data['CreatedAt']?.toDate() ?? DateTime.now()
            : DateTime.now(),

        /// If the data contains key UpdatedAt then we get the value of UpdtedAt else not.
        updatedAt: data.containsKey('UpdatedAt')
            ? data['UpdatedAt']?.toDate() ?? DateTime.now()
            : DateTime.now(),

        /// If the data contains key Role then we get the value of Role and if it is null then we get AppRole.user. Here we compare App Role with Admin role if boths are equal then AppRole will bhe admin otherwise user role.
        role: data.containsKey('Role')
            ? (data['Role'] == 'AppRole.admin')
                  ? AppRole.admin
                  : AppRole.user
            : AppRole.user,
      );
    } else {
      return empty();
    }
  }
}

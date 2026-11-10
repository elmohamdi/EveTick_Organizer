import 'package:cloud_firestore/cloud_firestore.dart';

class AppUserModel {
  final String uid;
  final String email;
  final String name;
  final bool isEmailVerified;
  final bool isGuest;
  final String role;
  final bool termsAccepted;
  AppUserModel({
    required this.uid,
    required this.email,
    this.name = '',
    this.isEmailVerified = false,
    this.isGuest = false,
    required this.role,
    this.termsAccepted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'isEmailVerified': isEmailVerified,
      'isGuest': isGuest,
      'createdAt': FieldValue.serverTimestamp(),
      'role':role,
      'termsAccepted': termsAccepted,
    };
  }

  factory AppUserModel.fromJson(Map<String, dynamic> json) {
    return AppUserModel(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      isEmailVerified: json['isEmailVerified'] ?? false,
      isGuest: json['isGuest'] ?? false,
       role: json['role'] ?? 'client',
      termsAccepted: json['termsAccepted'] ?? false,
    );
  }
}

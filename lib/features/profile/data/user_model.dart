class UserModel {
  final String name;
  final String? imageUrl;
  final String? phone;
  final String? address;
  final String? email;

  UserModel({
    this.name = '',
    this.imageUrl,
    this.phone,
    this.address,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'phone': phone,
      'address': address,
      'email': email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json, String uid) {
    return UserModel(
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'],
      phone: json['phone'],
      address: json['address'],
      email: json['email'],
    );
  }
}

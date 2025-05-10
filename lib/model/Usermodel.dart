class UserModel {
  String? id;
  String? name;
  String? email;
  String? profileImage;
  String? phoneNo;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.phoneNo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImage: json['profileImage'],
      phoneNo: json['phoneNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'phoneNo': phoneNo,
    };
  }
}

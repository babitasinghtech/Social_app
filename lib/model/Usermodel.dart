class UserModel {
  String? id;
  String? name;
  String? email;
  String? profileImage;
  String? phoneNumber;
  String? about;
  String? createAt;
  String? lastOnlineStatus;
  String? status;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.phoneNumber,
    this.about,
    this.createAt,
    this.lastOnlineStatus,
    this.status,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileImage = json['profileImage'];
    phoneNumber = json['phoneNumber'];
    about = json['About'];
    createAt = json['CreateAt'];
    lastOnlineStatus = json['LastOnlineStatus'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profileImage'] = this.profileImage;
    data['phoneNumber'] = this.phoneNumber;
    data['About'] = this.about;
    data['CreateAt'] = this.createAt;
    data['LastOnlineStatus'] = this.lastOnlineStatus;
    data['Status'] = this.status;
    return data;
  }
}

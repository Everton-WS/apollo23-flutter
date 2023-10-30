class UserModel {
  late String name;
  late String email;
  late String mobile;
  late String? password = '1234';
  late Map<String, dynamic> social;

  UserModel({required this.name, required this.email, required this.mobile, required this.social});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'] ?? '';
    password = json['password'] ?? '1234';
    social = json['social'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "mobile": mobile,
      "social": social,
    };
  }
}

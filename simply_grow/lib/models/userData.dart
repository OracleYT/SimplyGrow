//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.userId,
    this.name,
    // this.lastName,
    this.email,
    // this.role,
    // this.validity,
    this.semId,
    this.categoryId,
    this.token,
  });

  String userId;
  String name;
  String email;
  String semId;
  String categoryId;
  String token;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json["user_id"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        semId: json["sem_id"] ?? "",
        categoryId: (json["category_id"] ?? "").toString(),
        token: json["token"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "sem_id": semId,
        "category_id": categoryId.toString(),
        "token": token,
      };
}

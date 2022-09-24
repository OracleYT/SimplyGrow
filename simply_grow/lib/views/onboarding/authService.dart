import 'dart:convert';
import 'dart:io';

import 'package:simply_grow/api.dart';
import 'package:simply_grow/constant.dart';
import 'package:simply_grow/models/userData.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthService extends GetxController {
  AuthService({UserData user}) {
    if (user != null) userData.value = user;
  }
  var userData = UserData().obs;

  Future<String> login(
      String baseUrl, String centre, String email, String password,
      {bool putData = true}) async {
    if (baseUrl == null || baseUrl == "") baseUrl = ApiEndpoints.baseApi;
    print(baseUrl +
        "login_v3?email=$email&password=${Uri.encodeComponent(password)}");
    try {
      var response = await http.get(
        Uri.parse(baseUrl +
            "login_v3?email=$email&password=${Uri.encodeComponent(password)}"),
      );
      if (response.statusCode == 200) {
        Map jdata = json.decode(response.body);
        if (!jdata.containsKey("user_id")) return "error";
        print("login_v : ${response.body}");
        await Utils.putBaseUrlToLocal(baseUrl);
        UserData user = userDataFromJson(response.body);
        //print(userData.toJson());
        // List<Cred> savedAccounts = await Utils.getSavedAccounts();
        bool isAccountSaved = false;
        // savedAccounts.forEach((account) {
        //   print('saved account: ${account.email} & $email');
        //   if (account.email == email && account.baseUrl == baseUrl)
        //     isAccountSaved = true;
        // });

        if (putData
            // && !isAccountSaved
            ) {
          await Utils.putUserDataToLocal(email, password);
        }
        // await ApiEndpoints.getSystemSettingOfSuper();
        userData.value = user;
        // await getToken(user.token);
        return "success";
      } else {
        return "error";
      }
    } on Exception catch (e) {
      printError(info: e.toString());
      return "fatal";
    }
  }

  // getToken(String authToken) async {
  //   var token = "";
  //   try {
  //     token = await FirebaseMessaging.instance.getToken();
  //     //[TO:DO] call api to store token to backend.
  //     print(token);
  //     await ApiEndpoints.sendFCM(authToken, token);
  //   } on Exception catch (e) {
  //     // TODO
  //     print(e.toString());
  //   }
  // }

  Future<String> signUp(String base_url, String firstName, String lastName,
      String email, String password, int schoolId, int classId) async {
    print(base_url + ApiEndpoints.API + "create_user");
    try {
      var response = await http
          .post(Uri.parse(base_url + ApiEndpoints.API + "create_user"), body: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "class_id": classId.toString(),
        "password": Uri.encodeComponent(password),
        "confirm_password": Uri.encodeComponent(password),
        "school_id": schoolId.toString()
      });
      if (response.statusCode == 200) {
        print(response.body);
        var jdata = json.decode(response.body);
        if (jdata['status'] != 'success') {
          Utils.toast(jdata['error_reason'].toString());
          return "error";
        }
        return "success";
      } else {
        Utils.toast("enter valid email");
        return "error";
      }
    } on Exception catch (e) {
      print(e.toString());

      return "fatal";
    }
  }
}

import 'dart:convert';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'api.dart';
import 'views/onboarding/authWrapper.dart';

class Utils {
  static Color themeColor = const Color.fromRGBO(28, 64, 142, 1);
  static Color themeColorLight = const Color.fromRGBO(28, 64, 142, 0.2);
  static Color buttonColor = const Color.fromRGBO(28, 64, 142, 1);
  static Color assignmentColor = const Color(0xff3F8FEE);
  static LinearGradient gradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xff905CE5), Color(0xff3F8FEE)]);
  static LinearGradient labGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xff905CE5).withOpacity(0.6),
        const Color(0xff3F8FEE).withOpacity(0.6)
      ]);
  static void toast(String msg) {
    BotToast.showText(text: msg);
  }

  static Future<List<String>> getUserDataFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> data = [];
    if (prefs.containsKey('useremail')) {
      data.add(prefs.getString('useremail'));
      data.add(prefs.getString('userpassword'));
    }
    return data;
  }

  static Future<bool> isOnboardingDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isOnboardingDone = await prefs.getBool('isOnboardingDone');
    return isOnboardingDone;
  }

  static Future<void> setOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboardingDone', true);
    return;
  }

  static Future<void> putUserDataToLocal(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(email + ',' + password);

    await prefs.setString('useremail', email);
    await prefs.setString('userpassword', password);
  }

  static Future<String> getBaseUrlFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = "";
    if (prefs.containsKey('userbaseUrl')) {
      data = prefs.getString('userbaseUrl');
    } else {}
    print("<--" + data);
    return data;
  }

  static Future<void> putBaseUrlToLocal(String baseUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(ApiEndpoints.baseApi + "-->" + baseUrl);
    await prefs.setString('userbaseUrl', baseUrl);
  }
}

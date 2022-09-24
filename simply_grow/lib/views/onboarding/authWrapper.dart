import 'package:simply_grow/controllers/authController.dart';
import 'package:simply_grow/widgets/loadingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthWrapper extends StatelessWidget {
  final authController = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    authController.getAccountDetails();
    return LoadingPage();
  }
}

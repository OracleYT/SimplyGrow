import 'dart:convert';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NavigationController extends GetxController {
  var categoryId = Get.arguments != null ? Get.arguments["categoryId"] : null;
  var currentIndex = 0.obs;
  AdvancedDrawerController advancedDrawerController;

  @override
  void onInit() {
    super.onInit();
    advancedDrawerController = AdvancedDrawerController();
    print('categoryId: $categoryId');
    if (categoryId != null && jsonDecode(categoryId)[0] != -1) {
      currentIndex.value = 0;
    } else {
      currentIndex.value = 1;
    }
  }

  onPageChange(index) {
    currentIndex.value = index;
  }
}

import 'package:simply_grow/views/home/navigationWrapper.dart';
// import 'package:simply_grow/views/onboarding/landingPage.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../views/onboarding/authService.dart';
import '../views/onboarding/introduction_animation/introduction_animation_screen.dart';
import '../views/registrationPage.dart';

class AuthController extends GetxController {
  getAccountDetails() async {
    List<String> data = await Utils.getUserDataFromLocal();
    bool isOnboardingDone = await Utils.isOnboardingDone();

    if (data.isEmpty) {
      if (isOnboardingDone == null) {
        await Utils.setOnboardingStatus();
        Get.offAll(() => const IntroductionAnimationScreen());
      } else {
        // Utils.toast("Login Successful");
        Get.offAll(() => NavigationWrapper(
            // title: "helll",
            ));
      }

      // Get.offAll(() => LandingPage());
    } else {
      performNewLogin(data);
    }
  }

  performNewLogin(data) async {
    AuthService authService = Get.put(AuthService(), permanent: true);
    String baseUrl = await Utils.getBaseUrlFromLocal();
    String res = await authService.login(baseUrl, "", data[0], data[1]);
    if (res == "success") {
      print("loggedin");
      // Utils.toast("Login Successful");
      Get.offAll(() => NavigationWrapper());
      // arguments: {
      //   "categoryId": authService.userData.value.categoryId ?? "[-1]"
      // });
    } else {
      Utils.toast("Login Failed");
      Get.offAll(() => const RelaxView());
    }
  }
}

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
  // After changing the logo ,run the following command to update the Splash screen
  // flutter pub run flutter_native_splash:create
  // static String logo = 'images/logo.png';
  // static String innerLogo = 'images/logo.png';
  // static String name = 'codingjr';
  // static bool stateSelectionAvailable = false;
  // if stateSelectionAvailable is false, the state selection screen will not be shown
  // if stateSelectionAvailable is false and schoolId is not set, the schoolId will be set to the default schoolId=1
  // if stateSelectionAvailable is true and preselectedState is empty, the state selection screen will be shown with stateList
  // if stateSelectionAvailable is true and preselectedState is not empty, the state selection screen will be shown with preselectedState
  // static int schoolId = 1;
  // static String preSelecteddState = "";
  // static bool disableScreenshot = true;
  // static bool showLockedCourses = true;
  // static bool enablePayment = false;
  // static String razorpayKey = "rzp_test_HyWA7WUqKlW6Yf";
  // static String zoom_api_key = "";
  // static String zoom_api_secret = "";
  // static String schoolName = "";
  // static String schoolLogo = "";
  // static bool shop = true;
  // static bool showOnboarding = true;
//------------------------------------------------------------------------------//
  // static String isUpdateAvailable = "";
  // static String test_platform_enable = "";
  // static String enableFlashCard = "";
  // static String networkingLab = "";
  // static String cyberSecurityLab = "";
  // static String appDev = "";
  // static String gameDev = "[]";
  // static String machineLearn = "";
  // '[{"id":1,"icon":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level1\/dist\/assets\/9d6fb3befef5423895177627400123d9.jpg","heading":"Image Cartoonify","url":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level1\/dist\/index.html","subHeading":"with Python","children":[]},{"id":2,"icon":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level2\/dist\/assets\/f9fa4ebb50944b33f33130ed349a79eb.jpg","heading":"Handwritten Digit Recognition","url":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level2\/dist\/index.html","subHeading":"with Python","children":[]},{"id":3,"icon":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level3\/dist\/assets\/5a9036eb48e053e2acb65c21e7aab52f.jpg","heading":"Color Detection","url":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level3\/dist\/index.html","subHeading":"with Python, Panda and OpenCV","children":[]},{"id":4,"icon":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level4\/dist\/assets\/4d5114c8ca2c446c15d6f1613f7d8cf2.jpg","heading":"Level 4","url":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level4\/dist\/index.html","subHeading":"with Python and OpenCV","children":[]},{"id":5,"icon":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level5\/dist\/assets\/2b47af708dfbd413dc87d650848a012f.png","heading":"Level 5","url":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level5\/dist\/index.html","subHeading":"with Python","children":[]},{"id":1,"icon":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level1\/dist\/assets\/9d6fb3befef5423895177627400123d9.jpg","heading":"Detecting Fake News","url":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level1\/dist\/index.html","subHeading":"with Python","children":[]},{"id":2,"icon":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level2\/dist\/assets\/f9fa4ebb50944b33f33130ed349a79eb.jpg","heading":"Image Segmentation","url":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level2\/dist\/index.html","subHeading":"with Python","children":[]},{"id":3,"icon":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level3\/dist\/assets\/5a9036eb48e053e2acb65c21e7aab52f.jpg","heading":"Stock Price Prediction","url":"https:\/\/codingjrgfs.s3.ap-south-1.amazonaws.com\/gameLab\/level3\/dist\/index.html","subHeading":"with Python","children":[]},]';
  // static String ai = "[]";

//   static Map<String, dynamic> nData = {};
//   static TextStyle buttonText =
//       TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
//   static TextStyle title = TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
//   static TextStyle subtitle1 =
//       TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
//   static TextStyle subtitle2 =
//       TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
//   static TextStyle bodyText1 =
//       TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
//   static TextStyle bodyText2 =
//       TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
//   static TextStyle tileTitle = TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.w700,
//     height: 1,
//     color: Colors.white,
//   );
//   static TextStyle tileSubtitle = TextStyle(
//     fontSize: 11,
//     fontWeight: FontWeight.w300,
//     color: Colors.white,
//   );

//   static List<String> homeTabs = [
//     "My Courses",
//     // "Enrolled Courses",
//     "Live Classes",
//     "Notices",
//     "Blogs",
//     "Timetable",
//     // "IDE",
//     // "Web Editor",
//     "Progress",
//     "Homework",
//     "Chat",
//     "Online Test",
//     //"Fees",
//     // "Attendance",
//     // "Chat"
//   ];
//   static List<String> homeTab1 = [
//     "My Courses",
//     "Live Classes",
//     "Progress",
//   ];
//   static List<String> hometabswithshopfalse = [
//     "Live Classes",
//     "Progress",
//   ];
//   static List<String> homeTab2 = [
//     "Notices",
//     "Blogs",
//     "Timetable",
//   ];
//   static List<String> homeTab3 = [
//     "Homework",
//     // "Chat",
//     "Online Test",
//   ];
//   static homeTabsNavigation(String i, String liveClasstype) {
//     switch (i) {
//       case 'Live Classes':
//         Get.to(() => LiveClassPage(liveClassType: liveClasstype));
//         break;
//       case 'My Courses':
//         Get.to(() => MyCoursesPage(), arguments: {"enrolledPage": false});
//         break;
//       case 'Enrolled Courses':
//         Get.to(() => MyCoursesPage(), arguments: {"enrolledPage": true});
//         break;
//       case 'Notices':
//         Get.to(() => NoticePage());
//         break;
//       case 'Blogs':
//         Get.to(() => BlogPage());
//         break;
//       case 'Timetable':
//         Get.to(() => TimeTable());
//         break;
//       // case 'IDE':
//       //   Get.to(() => MyFilesIDEPage());
//       //   break;
//       // case 'Web Editor':
//       //   Get.to(() => MyFilesWebPage());
//       //   break;
//       case 'Progress':
//         Get.to(() => PerformancePage());
//         break;
//       case 'Homework':
//         Get.to(() => HomeworkPage());
//         break;
//       // case 'Chat':
//       //   Get.to(() => ChatScreen());
//       //   break;
//       case 'Online Test':
//         Get.to(() => WebViewPage2(
//               webViewUrl: "http://test.codingjr.online",
//             ));
//         break;

//       default:
//     }
//   }

//   static void showToast(String message) {
//     Fluttertoast.cancel();
//     Fluttertoast.showToast(
//         msg: message,
//         textColor: Colors.black,
//         backgroundColor: themeColor,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1);
//   }

//   static void showLoading() {
//     BotToast.showCustomLoading(
//         toastBuilder: (c) => Container(
//               height: 75,
//               width: 75,
//               decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.85),
//                   borderRadius: BorderRadius.circular(12)),
//               child: Center(
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   valueColor: AlwaysStoppedAnimation(Utils.buttonColor),
//                 ),
//               ),
//             ));
//   }

//   static void closeLoading() {
//     BotToast.closeAllLoading();
//   }

  static void toast(String msg) {
    BotToast.showText(text: msg);
  }

//   // static void showDialog() {}

//   static Future<void> removeUserFromLocal() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('useremail');
//     await prefs.remove('userpassword');
//   }

  static Future<List<String>> getUserDataFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> data = [];
    if (prefs.containsKey('useremail')) {
      data.add(prefs.getString('useremail'));
      data.add(prefs.getString('userpassword'));
    }
    return data;
  }

//   static Future<void> putProfileImagetoLocal(String path) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userimagePath', path);
//   }

  static Future<bool> isOnboardingDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isOnboardingDone = await prefs.getBool('isOnboardingDone');
    return isOnboardingDone;
  }

//   static Future<void> setOnboardingStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isOnboardingDone', true);
//     return;
//   }

//   static Future<String> getProfileImageFromLocal() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String path = prefs.getString('userimagePath');
//     return path;
//   }

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

//   static Future<void> putUserIdToLocal(String userId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     print(userId);
//     await prefs.setString('useruserId', userId);
//   }

//   static Future<String> getUserIdFromLocal() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String userId;
//     if (prefs.containsKey('userId')) {
//       userId = prefs.getString('userId');
//     }
//     return userId;
//   }

//   static Future addItemToSavedAccount(
//       String email, String password, String baseUrl, String centre) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     print(email + ',adding,' + password);
//     List<Cred> creds = await getSavedAccounts();
//     creds.insert(
//         0,
//         Cred(
//             email: email,
//             password: password,
//             baseUrl: baseUrl,
//             centre: centre));
//     prefs.setString("savedAccounts", credToJson(creds));
//   }

//   static Future deleteItemToSavedAccount(int index) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<Cred> creds = await getSavedAccounts();
//     creds.removeAt(index);
//     await prefs.setString("savedAccounts", credToJson(creds));
//   }

//   static Future<List<Cred>> getSavedAccounts() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<Cred> creds = [];
//     if (prefs.containsKey("savedAccounts")) {
//       creds = credFromJson(prefs.getString("savedAccounts"));
//     }
//     return creds;
//   }

//   static String getUserName(AuthService authService) {
//     var fName = authService.userData.value.firstName != null
//         ? authService.userData.value.firstName
//         : "";
//     var lName = authService.userData.value.lastName != null
//         ? authService.userData.value.lastName
//         : "";
//     var name = fName + ' ' + lName;

//     return name.trim().capitalize;
//   }

//   static Future<void> storeString(String key, String value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var b = await prefs.setString(key, value);
//     print(key + ',' + value + "," + b.toString());
//   }

//   static Future<String> getString(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var b = await prefs.containsKey(key);
//     print(key + "," + b.toString());
//     var s = prefs.getString(key) ?? "";
//     print(key + "," + s);
//     return s;
//   }

//   static Future<void> removeString(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove(key);
//   }

// // store bool in shred preferences
//   static Future<void> storeBool(String key, bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var b = await prefs.setBool(key, value);
//     print(key + ',' + value.toString() + "," + b.toString());
//   }

//   // get stored bool from shred preferences
//   static Future<bool> getBool(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var b = prefs.containsKey(key);
//     print(key + "," + b.toString());
//     var s = prefs.getBool(key) ?? false;
//     print(key + "," + s.toString());
//     return s;
//   }

//   static void determineNotificationPayload(Map<String, dynamic> data,
//       {bool isBackground = false}) {
//     if (data.containsKey("type")) {
//       switch (data['type']) {
//         case "liveClass":
//           ApiEndpoints.clearLiveClass();
//           break;
//         case "notice":
//           ApiEndpoints.clearNotices();
//           break;
//         case "clearAll":
//           ApiEndpoints.clearCache();
//           break;
//         case "logout":
//           Utils.removeUserFromLocal();
//           ApiEndpoints.clearCache();
//           if (!isBackground) {
//             Get.offAll(() => AuthWrapper());
//           }

//           break;
//         default:
//       }
//     }
//   }

//   static String determineNotificationType(Map<String, dynamic> data) {
//     if (data.containsKey("type")) {
//       switch (data['type']) {
//         case "liveClass":
//           return "liveclass";
//           break;
//         case "notice":
//           return "notice";
//           break;
//         case "clearAll":
//           return "clearAll";
//           break;

//         default:
//           return "default";
//       }
//     } else
//       return "default";
//   }

//   static void determineNotificationNavigation(Map<String, dynamic> data) async {
//     String type = await Utils.getString("liveClassType");
//     if (data.containsKey("type")) {
//       switch (data['type']) {
//         case "liveClass":
//           Get.offAll(
//               () => LiveClassPage(
//                     liveClassType: type,
//                   ),
//               predicate: (r) => r.isFirst);

//           break;
//         case "notice":
//           Get.to(() => NoticePage());
//           break;
//         case "logout":
//           Utils.removeUserFromLocal();
//           ApiEndpoints.clearCache();

//           Get.offAll(() => AuthWrapper());
//           break;
//           break;
//         default:
//       }
//     }
//   }

//   static void showNotification(
//       String title, String subtitleMsg, IconData icon, Function ontap) {
//     BotToast.showCustomNotification(
//         toastBuilder: (cancel) {
//           return ListTile(
//             tileColor: Vx.gray50,
//             leading: Container(
//                 width: 50, child: Center(child: Icon(icon, color: themeColor))),
//             title: Text(
//               title,
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold),
//             ),
//             trailing:
//                 Icon(EvaIcons.closeCircle, color: themeColor.withOpacity(0.75))
//                     .onTap(() {
//               cancel();
//             }),
//             subtitle: Text(
//               subtitleMsg,
//               style: TextStyle(
//                   color: Vx.gray500, fontSize: 16, fontWeight: FontWeight.w400),
//             ),
//           )
//               .box
//               .rounded
//               .shadowLg
//               .gray50
//               .make()
//               .onTap(() {
//                 ontap();
//               })
//               .px(14)
//               .material();
//         },
//         // leading: (cancel) => Container(
//         //     width: 50, child: Center(child: Icon(icon, color: themeColor))),
//         // title: (_) => Text(title),
//         // subtitle: (_) => Text(subtitleMsg),
//         // onTap: () {
//         //   ontap();
//         // },
//         enableSlideOff: true,
//         backButtonBehavior: BackButtonBehavior.close,
//         crossPage: true,
//         // borderRadius: 12,
//         // contentPadding: EdgeInsets.all(1),
//         onlyOne: true,
//         animationDuration: Duration(milliseconds: 250),
//         animationReverseDuration: Duration(milliseconds: 300),
//         duration: Duration(seconds: 5));
//   }

//   static void showCustomDialog(BuildContext context,
//       {@required String title,
//       String msg,
//       Widget content,
//       String yesText,
//       String noText,
//       double height = 130,
//       void Function(BuildContext c) onYes,
//       void Function(BuildContext c) onNo}) {
//     showDialog(
//         context: context,
//         builder: (c) {
//           return Material(
//             color: Colors.transparent,
//             child: Center(
//               child: Container(
//                 height: height,
//                 width: MediaQuery.of(c).size.width * 0.8,
//                 padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           title.isEmpty
//                               ? Container()
//                               : Text(
//                                   title,
//                                   style: subtitle1,
//                                 ),
//                           content != null
//                               ? content
//                               : msg.isEmpty
//                                   ? Container()
//                                   : Text(
//                                       msg,
//                                       style: bodyText1,
//                                     ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         // ignore: deprecated_member_use
//                         // FlatButton(
//                         //   child: Text(
//                         //     noText,
//                         //     style: subtitle1.copyWith(
//                         //         color: Colors.black.withOpacity(0.4),
//                         //         fontWeight: FontWeight.w600),
//                         //   ),
//                         //   onPressed: () {
//                         //     onNo(c);
//                         //   },
//                         // ),
//                         // ignore: deprecated_member_use
//                         // FlatButton(
//                         //   color: themeColor.withOpacity(0.2),
//                         //   shape: RoundedRectangleBorder(
//                         //       borderRadius: BorderRadius.circular(8)),
//                         //   child: Text(
//                         //     yesText,
//                         //     style: subtitle1.copyWith(
//                         //         color: Colors.black,
//                         //         fontWeight: FontWeight.w600),
//                         //   ),
//                         //   onPressed: () {
//                         //     onYes(c);
//                         //   },
//                         // ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   static void showDialogV2({
//     String title,
//     String msg,
//     String yesText,
//     String noText = "",
//     double height = 250,
//     Icon icon,
//     void Function() onYes,
//     void Function() onNo,
//   }) {
//     BotToast.showAnimationWidget(
//         clickClose: false,
//         allowClick: false,
//         onlyOne: true,
//         crossPage: true,
//         backButtonBehavior: BackButtonBehavior.ignore,
//         wrapToastAnimation: (controller, cancel, child) => Stack(
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: () {
//                     //cancel();
//                   },
//                   //The DecoratedBox here is very important,he will fill the entire parent component
//                   child: AnimatedBuilder(
//                     builder: (_, child) => Opacity(
//                       opacity: controller.value,
//                       child: child,
//                     ),
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(color: Colors.black26),
//                       child: SizedBox.expand(),
//                     ),
//                     animation: controller,
//                   ),
//                 ),
//                 CustomOffsetAnimation(
//                   controller: controller,
//                   child: child,
//                 )
//               ],
//             ),
//         toastBuilder: (cancelFunc) => Center(
//               child: Container(
//                       width: Get.width * 0.9,
//                       height: height,
//                       color: Colors.white,
//                       child: Column(
//                         children: [
//                           10.heightBox,
//                           icon != null ? icon : Container(),
//                           // 4.heightBox,
//                           Text(title, style: Utils.title).centered(),
//                           4.heightBox,
//                           Text(
//                             msg,
//                             textAlign: TextAlign.center,
//                             style: Utils.subtitle1.copyWith(
//                               fontWeight: FontWeight.w600,
//                               color: Vx.gray500,
//                             ),
//                           ),
//                           20.heightBox,
//                           Container(
//                             color: Utils.buttonColor,
//                             padding: EdgeInsets.symmetric(vertical: 14),
//                             child: Center(
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(yesText,
//                                       style: Utils.buttonText.copyWith(
//                                           color: Colors.white, height: 1)),
//                                 ],
//                               ),
//                             ),
//                           ).cornerRadius(50).onTap(() {
//                             cancelFunc();
//                             onYes();
//                           }).px(10),
//                           10.heightBox,
//                           noText.isNotEmpty
//                               ? Container(
//                                   color: Utils.buttonColor.withOpacity(0.1),
//                                   padding: EdgeInsets.symmetric(vertical: 14),
//                                   child: Center(
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text(noText,
//                                             style: Utils.buttonText.copyWith(
//                                                 color: Utils.buttonColor,
//                                                 fontWeight: FontWeight.w700,
//                                                 height: 1)),
//                                       ],
//                                     ),
//                                   ),
//                                 ).cornerRadius(50).onTap(() {
//                                   cancelFunc();
//                                   onNo();
//                                 }).px(10)
//                               : Container(),
//                         ],
//                       ).px16())
//                   .cornerRadius(12),
//             ),
//         animationDuration: Duration(milliseconds: 300));
//   }

//   static String getRandomString(int length) {
//     const _chars =
//         'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
//     Random _rnd = Random();
//     return String.fromCharCodes(Iterable.generate(
//         length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
//   }
  // static Future<void> putZoomKeysToLocal(String zoomData) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   print('zoomData: $zoomData');
  //   await prefs.setString('zoomData', zoomData);
  // }

  // static Future<dynamic> getZoomKeysFromLocal() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String resp = prefs.getString('zoomData');
  //   return json.decode(resp);
  // }
}

// List<Cred> credFromJson(String str) =>
//     List<Cred>.from(json.decode(str).map((x) => Cred.fromJson(x)));

// String credToJson(List<Cred> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Cred {
//   Cred({this.email, this.password, this.baseUrl, this.centre});

//   String email;
//   String password;
//   String baseUrl;
//   String centre;

//   factory Cred.fromJson(Map<String, dynamic> json) => Cred(
//         email: json["email"],
//         password: json["password"],
//         baseUrl: json["baseUrl"],
//         centre: json["centre"] ?? "",
//       );

//   Map<String, dynamic> toJson() => {
//         "email": email,
//         "password": password,
//         "baseUrl": baseUrl,
//         "centre": centre ?? "",
//       };
// }

// List<String> states = [
//   'Andaman and Nicobar Islands',
//   'Andhra Pradesh',
//   'Arunachal Pradesh',
//   'Assam',
//   'Bihar',
//   'Chandigarh',
//   'Chhattisgarh',
//   'Dadra Nagar Haveli and Daman Diu',
//   'Delhi',
//   'Goa',
//   'Gujarat',
//   'Haryana',
//   'Himachal Pradesh',
//   'Jammu and Kashmir',
//   'Jharkhand',
//   'Karnataka',
//   'Kerela',
//   'Ladakh',
//   'Lakhsadweep',
//   'Madhya Pradesh',
//   'Maharashtra',
//   'Manipur',
//   'Meghalaya',
//   'Mizoram',
//   'Nagaland',
//   'Odisha',
//   'Puducherry',
//   'Punjab',
//   'Rajasthan',
//   'Sikkim',
//   'Tamil Nadu',
//   'Telangana',
//   'Tripura',
//   'Uttar Pradesh',
//   'Uttarakhand',
//   'West Bengal'
// ];

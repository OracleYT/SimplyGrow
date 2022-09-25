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
  static Color themeColor = Colors.black;
  static Color themeColorLight = const Color.fromRGBO(28, 64, 142, 0.2);
  static Color buttonColor = const Color.fromRGBO(28, 64, 142, 1);
  static Color assignmentColor = const Color(0xff3F8FEE);
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

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:simply_grow/constant.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:simply_grow/models/cardDetails.dart';
import 'package:simply_grow/models/topicCardData.dart';

import 'models/courseDetails.dart';

class ApiEndpoints {
  static String testRoot = "http://13.235.110.101/";
  static String root = "https://codingjr.online/";
  static String chatRoot =
      "https://codingjr.school:3000/"; //nalanda  --> needs to be nodejs server
  //static String root = "https://www.nalandaeducation.online/";
  // ignore: non_constant_identifier_names
  static String API = "api/";
  static String baseApi = root + "api/";
  static String signUp = baseApi + "create_user";

//   static Future<String> fetchCertificate(
//       String category_id, String sub_category_id, String token) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();
//     String certificateUrl = baseUrl != null
//         ? baseUrl + "view_user_certificate"
//         : baseApi + "view_user_certificate";

//     print(certificateUrl +
//         "?category_id=$category_id&&sub_category_id=$sub_category_id&&auth_token=$token");
//     String certificate = certificateUrl +
//         "?category_id=$category_id&&sub_category_id=$sub_category_id&&auth_token=$token";

//     return certificate;
//   }

//   static Future<List<CertificateDetails>> getCertificateDetails(
//       String token) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();
//     String certificateUrl = baseUrl != null
//         ? baseUrl + "issued_user_certificates"
//         : baseApi + "issued_user_certificates";

//     print(certificateUrl + "?auth_token=$token");
//     var response = await http.get(
//       Uri.parse(certificateUrl + "?auth_token=$token"),
//     );
//     print(jsonDecode(response.body));
//     List<CertificateDetails> certificateDetails =
//         certificateDetailFromJson(response.body);
//     print('certificateDetails: $certificateDetails');
//     return certificateDetails;
//   }

//   static Future<String> getTimeTable(token, String catId) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String timeTable = baseUrl != null
//         ? baseUrl + "time_table_pdf?category_id=$catId&&auth_token=$token"
//         : baseApi + "time_table_pdf?category_id=$catId&&auth_token=$token";
//     print(baseUrl);
//     var response = await http.get(Uri.parse(timeTable));
//     print(response.statusCode);
//     print(response.body);
//     var responseBody = json.decode(response.body);
//     return responseBody['url'] ?? "";
//   }

//   static Future<List<String>> getBanner() async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String bannerApi =
//         baseUrl != null ? baseUrl + "banners" : baseApi + "banners";
//     print(bannerApi);
//     var response = await http.get(Uri.parse(bannerApi));
//     List<String> images = [];
//     List<String>.from(
//         jsonDecode(response.body).map((x) => print('adsacsada ${x['image']}')));
//     images =
//         List<String>.from(jsonDecode(response.body).map((x) => x['image']));
//     print(response.statusCode);
//     return images;
//   }
//   //**************API CACHE********************* */

//   //Get Dio client for caching api calls
  static Dio getDioClient() {
    var _dioCacheManager = DioCacheManager(CacheConfig());
    Dio _dio = Dio();
    _dio.interceptors.add(_dioCacheManager.interceptor);
    return _dio;
  }

//   //Cache storing options
  static Options cacheOptions(bool force, {String key}) =>
      buildCacheOptions(Duration(days: 2),
          forceRefresh: force,
          primaryKey: key,
          options: Options(responseType: ResponseType.plain));

//   ///clears the cache
//   static void clearCache() async {
//     var _dioCacheManager = DioCacheManager(CacheConfig());
//     await _dioCacheManager.clearAll();
//     Utils.toast("All cached cleared");
//   }

//   static void clearNotices() async {
//     var _dioCacheManager = DioCacheManager(CacheConfig());
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String notices = baseUrl != null
//         ? baseUrl + "fetchNotifications_v2"
//         : baseApi + "fetchNotifications_v2";
//     print(notices);

//     var b = await _dioCacheManager.delete(notices,
//         subKey: "category_id", requestMethod: "GET");
//     print("cache cleared: " + b.toString());
//     if (b) {
//       Utils.toast("Notices refreshed");
//     }
//   }

//   static void clearLiveClass() async {
//     String s = await Utils.getString("liveClassType");
//     if (s == "0") {
//       await clearLiveClassDate();
//     } else {
//       await clearLiveClassWeekDay();
//     }
//   }

//   static void clearLiveClassWeekDay() async {
//     var _dioCacheManager = DioCacheManager(CacheConfig());
//     String baseUrl = await Utils.getBaseUrlFromLocal();
//     String liveClasses = baseUrl != null
//         ? baseUrl + "live_classes_v6"
//         : baseApi + "live_classes_v6";
//     List<String> days = [
//       "sunday",
//       "monday",
//       "tuesday",
//       "wednesday",
//       "thursday",
//       "friday",
//       "saturday"
//     ];
//     await Future.forEach(days, (element) async {
//       var b = await _dioCacheManager.delete(liveClasses,
//           subKey: "week_day=$element", requestMethod: "GET");
//       if (b) {
//         print("cache cleared: " + element);
//       }
//     });

//     Utils.toast("Live Class refreshed");
//   }

//   static void clearLiveClassDate() async {
//     var _dioCacheManager = DioCacheManager(CacheConfig());
//     String baseUrl = await Utils.getBaseUrlFromLocal();
//     String liveClasses = baseUrl != null
//         ? baseUrl + "live_classes_v2"
//         : baseApi + "live_classes_v2";

//     var b = await _dioCacheManager.delete(liveClasses, requestMethod: "GET");
//     print("cache cleared: " + b.toString());
//     liveClasses = baseApi + "live_classes_v5";
//     b = await _dioCacheManager.delete(liveClasses, requestMethod: "GET");
//     print("cache cleared: " + b.toString());
//     Utils.toast("Live Class refreshed");
//   }
//   //**************API CACHE********************* */

//   // static Future<String> uploadProfileImage(
//   //     FormData formData, String token) async {
//   //   await http.post(Uri.parse(ApiEndpoints.baseApi +
//   //       'upload_user_image' +
//   //       '?data=$formData&auth_token=$token'));
//   // }

//   static Future<BatchDetails> getBatchDetails(String id) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String batchDetailsUrl = baseUrl != null
//         ? baseUrl + "get_batch_details"
//         : baseApi + "get_batch_details";

//     print(batchDetailsUrl + "?id=$id");
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(batchDetailsUrl + "?id=$id",
//         options: ApiEndpoints.cacheOptions(false));

//     // var response = await http.get(
//     //   Uri.parse(batchDetailsUrl + "?id=$id"),
//     // );
//     log(response.data);
//     BatchDetails batchDetails = batchDetailsFromJson(response.data);

//     return batchDetails;
//   }

//   static Future<String> getUserCredit(String token) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String creditUrl =
//         baseUrl != null ? baseUrl + "get_credit" : baseApi + "get_credit";

//     print(creditUrl + "?auth_token=$token");
//     var response = await http.get(
//       Uri.parse(creditUrl + "?auth_token=$token"),
//     );
//     print(jsonDecode(response.body));
//     var credit = jsonDecode(response.body);

//     print('credit ${credit != null ? credit["data"]["credit"] : 0}');
//     print('credit ${credit != null ? credit["message"] : 0}');

//     return credit != null ? credit["data"]["credit"] : '0';
//   }

//   static Future<String> generateOrderId(String amount) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String orderIdUrl = baseUrl != null
//         ? baseUrl + "razorpay_create_order"
//         : baseApi + "razorpay_create_order";

//     print(orderIdUrl);
//     Dio dio = ApiEndpoints.getDioClient();
//     var response = await dio.post(orderIdUrl,
//         data: FormData.fromMap({
//           "amount": amount,
//         }),
//         options: Options(responseType: ResponseType.plain));
//     print(response.data);
//     var jdata = jsonDecode(response.data);
//     if (jdata["status"] == "success") {
//       return jdata["data"]["order_id"];
//     } else {
//       return "";
//     }
//   }

//   static Future<String> verifyRazorpaySignature(
//       String payId, String orderId, String signature) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String verifyUrl = baseUrl != null
//         ? baseUrl + "verify_razorpay_signature"
//         : baseApi + "verify_razorpay_signature";

//     print(verifyUrl);
//     Dio dio = ApiEndpoints.getDioClient();
//     var response = await dio.post(verifyUrl,
//         data: FormData.fromMap({
//           "razorpay_payment_id": payId,
//           "razorpay_order_id": orderId,
//           "razorpay_signature": signature,
//         }),
//         options: Options(responseType: ResponseType.plain));

//     print(response.data);
//     var jdata = jsonDecode(response.data);
//     return jdata["status"];
//   }

//   static Future<Map<String, dynamic>> postPurchaseSuccessful(
//       Map<String, dynamic> data) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String purchaseSuccessful = baseUrl != null
//         ? baseUrl + "insert_purchased"
//         : baseApi + "insert_purchased";

//     print(purchaseSuccessful);
//     print(data);
//     Dio _dio = Dio();
//     try {
//       var response = await _dio.post(purchaseSuccessful,
//           data: FormData.fromMap(data),
//           options: Options(
//             responseType: ResponseType.plain,
//           ));
//       // var response = await http.post(
//       //   Uri.parse(purchaseSuccessful),
//       //   body: {"auth_token": token, "classes[0]": id, "discount": credit},
//       // );

//       // print(purchaseSuccessful +
//       //     "?auth_token=$token&class[0]=$id&discount=$credit");
//       print(response.data);
//       Map<String, dynamic> status = json.decode(response.data);

//       print(status['message']);
//       return status;
//     } on DioError catch (e) {
//       print(e.message);
//       Utils.storeBool("isPaymentPending", true);

//       Utils.storeString("paymentPayload", jsonEncode(data));
//       Map<String, dynamic> status = {
//         "message":
//             "We are still processing your payment. You may close the page. Your purchased contents will be reflected soon.",
//         "status": "failure",
//       };
//       return status;
//     }
//   }

//   static Future<void> sendFCM(String authToken, String androidToken) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String fcm = baseUrl != null
//         ? baseUrl + "UpdateAndroidToken"
//         : baseApi + "UpdateAndroidToken";
//     print(fcm);
//     var body = {"auth_token": authToken, "android_token": androidToken};
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.post(fcm,
//         data: FormData.fromMap(body),
//         options: Options(responseType: ResponseType.plain));
//     print(response.statusCode);
//     print(response.data);
//   }

//   static Future<String> uploadImage(filepath, token) async {
//     var request = http.MultipartRequest(
//         'POST',
//         Uri.parse(
//             ApiEndpoints.baseApi + 'upload_user_image' + '?auth_token=$token'));
//     request.files.add(await http.MultipartFile.fromPath('image', filepath));
//     var res = await request.send();
//     print(res);
//     return res.reasonPhrase;
//   }

//   static Future<List<BlogItem>> getBlogsList({bool force = false}) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String blogs = baseUrl != null ? baseUrl + "blogs" : baseApi + "blogs";
//     print(baseUrl);
//     // var response = await http.get(Uri.parse(blogs));
//     var _dio = ApiEndpoints.getDioClient();
//     var response =
//         await _dio.get(blogs, options: ApiEndpoints.cacheOptions(force));

//     print(response.data);
//     final blogItems = blogItemFromJson(response.data);
//     return blogItems;
//   }

//   static Future<List<NoticeItem>> getNoticesList(token, categoryId,
//       {bool force = false}) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String notices = baseUrl != null
//         ? baseUrl + "fetchNotifications_v2"
//         : baseApi + "fetchNotifications_v2";

//     print(notices + "?category_id=${categoryId}&&auth_token=$token");

//     // var response =
//     //     await http.get(Uri.parse(notices + "?category_id=$categoryId"));
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await http.get(
//         Uri.parse(notices + "?category_id=${categoryId}&auth_token=$token"));
//     print(response.body);
//     // if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
//     //   // data come from cache
//     //   print("Data come from cache");
//     // } else {
//     //   // data come from net
//     //   print("Data come from net");
//     // }
//     var jsonData = json.decode(response.body);

//     final noticeItem = List<NoticeItem>.from(
//         jsonData['result'].map((x) => NoticeItem.fromJson(x)));
//     return noticeItem;
//   }

//   static Future<List<CategoryItem>> getcategoriesList(bool isDemo,
//       {bool force = false}) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String categories =
//         baseUrl != null ? baseUrl + "categories" : baseApi + "categories";

//     print(categories);
//     var _dio = ApiEndpoints.getDioClient();
//     var response =
//         await _dio.get(categories, options: ApiEndpoints.cacheOptions(force));
//     //print(response.body);
//     final categoryItems = categoryItemFromJson(response.data);
//     return categoryItems;
//   }

  static Future<List<CourseDetail>> getTopCoursesList() async {
    String api = " https://carducate.000webhostapp.com/subjects.php";
    try {
      var _dio = ApiEndpoints.getDioClient();
      var response =
          await _dio.get(api, options: ApiEndpoints.cacheOptions(true));

      print("response:" + response.data);
      print("response got");

      final courseDetail = courseDetailFromJson(response.data);
      print("All courses list fetched");

      return courseDetail;
    } catch (e) {
      print(e);
    }
    return [];
  }

//   static Future<List<CourseDetail>> getResumeCoursesList(token) async {
//     String resumeCourses = baseApi + 'get_resume_courses?auth_token=$token';

//     try {
//       print("apicall:" + resumeCourses);

//       var response = await http.get(Uri.parse(resumeCourses));

//       print("response:" + response.body);
//       print("response got");

//       final courseDetail = courseDetailFromJson(response.body);
//       print("resume courses list fetched");

//       return courseDetail;
//     } catch (e) {
//       print(e);
//     }
//     return [];
//   }

//   static Future<List<CategoryItem>> getcategoriesAssignedToStudentList(
//       String token,
//       {bool force = false}) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String endPoint = "categories_v4";
//     String categoriesAssignedToStudent =
//         baseUrl != null ? baseUrl + endPoint : baseApi + endPoint;
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(
//         categoriesAssignedToStudent + "?auth_token=$token",
//         options: ApiEndpoints.cacheOptions(force));
//     // print(response.data);
//     final categoryItems = categoryItemFromJson(response.data);
//     return categoryItems;
//   }

//   static Future<bool> postSendMessage(
//     String token,
//     String categoryId,
//     String name,
//     String mobile,
//     String message,
//   ) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String sendMessage = baseUrl != null
//         ? baseUrl + "student_message"
//         : baseApi + "student_message";
//     print(Uri.parse(sendMessage));
//     var response = await http.post(Uri.parse(sendMessage), body: {
//       "auth_token": token,
//       "category_id": categoryId,
//       "name": name,
//       "mobile": mobile,
//       "message": message,
//     });
//     print(response.body);
//     bool status = json.decode(response.body)['status'];
//     return status;
//   }

//   static Future<bool> postResumeCourses(
//     String token,
//     String courseId,
//   ) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String update_resume_courses = baseUrl != null
//         ? baseUrl + "update_resume_courses"
//         : baseApi + "update_resume_courses";
//     print(Uri.parse(update_resume_courses));
//     var response = await http.post(Uri.parse(update_resume_courses), body: {
//       "auth_token": token,
//       "course_id": courseId,
//     });
//     print(response.body);
//     bool status = json.decode(response.body)['status'];
//     return status;
//   }

//   static Future<List<SubCategoryItem>> getSubCategoriesList(
//       String categoryId, bool enrolledPage, String token, bool isDemo,
//       {bool force = false}) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();
//     String endPoint = enrolledPage == true
//         ? "sub_categories_enrolled_courses"
//         : "sub_categories_v3";
//     String subCategories =
//         baseUrl != null ? baseUrl + endPoint : baseApi + endPoint;
//     int forDemo = isDemo == true ? 1 : 0;
//     // print(subCategories +
//     //     "?category_id=$categoryId&auth_token=$token&for_demo=$forDemo");
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(
//         subCategories +
//             "?category_id=$categoryId&auth_token=$token&for_demo=$forDemo",
//         options: ApiEndpoints.cacheOptions(force));

//     //print(response.body);
//     final subCategoryItems = subCategoryItemFromJson(response.data);
//     return subCategoryItems;
//   }

//   static Future<List<SubCategoryItem>> getAllSubcategories(String categoryId,
//       {bool force = false}) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();
//     String subCategories = baseUrl != null
//         ? baseUrl + "sub_categories"
//         : baseApi + "sub_categories";
//     // print(subCategories + "?category_id=$categoryId");
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(subCategories + "?category_id=$categoryId",
//         options: ApiEndpoints.cacheOptions(force));
//     print(response.data);
//     final subCategoryItems = subCategoryItemFromJson(response.data);
//     return subCategoryItems;
//   }

//   static Future<List<CourseDetail>> getDemoCoursesList(
//       {bool force = false}) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String demoCourses =
//         baseUrl != null ? baseUrl + "demo_courses" : baseApi + "demo_courses";
//     print(demoCourses);
//     var _dio = ApiEndpoints.getDioClient();
//     var response =
//         await _dio.get(demoCourses, options: ApiEndpoints.cacheOptions(force));

//     //print(response.body);
//     final courseDetail = courseDetailFromJson(response.data);
//     return courseDetail;
//   }

//   static Future<List<CourseDetail>> getsubCategorywiseCoursesList(
//       String categoryId, String subCategoryId,
//       {bool force = false}) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String subCategorywiseCourses = baseUrl != null
//         ? baseUrl + "sub_category_wise_course"
//         : baseApi + "sub_category_wise_course";

//     print(subCategorywiseCourses +
//         "?category_id=$categoryId&sub_category_id=$subCategoryId");
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(
//         subCategorywiseCourses +
//             "?category_id=$categoryId&sub_category_id=$subCategoryId",
//         options: ApiEndpoints.cacheOptions(force));

//     //print(response.body);
//     final courseDetail = courseDetailFromJson(response.data);
//     return courseDetail;
//   }

//   static Future<List<CourseDetail>> getenrolledCoursesList(String token,
//       {bool force = false}) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String enrolledCourses =
//         baseUrl != null ? baseUrl + "my_courses" : baseApi + "my_courses";
//     print(enrolledCourses + "?auth_token=$token");
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(enrolledCourses + "?auth_token=$token",
//         options: ApiEndpoints.cacheOptions(force));

//     //print(response.body);
//     final courseDetail = courseDetailFromJson(response.data);
//     return courseDetail;
//   }

//   static Future<List<SchoolDetail>> getSchoolDetail(int schoolId) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String schoolId = baseUrl != null
//         ? baseUrl + "school_with_id"
//         : baseApi + "school_with_id";

//     print(schoolId + "?schoolId=$schoolId");
//     var response = await http.get(
//       Uri.parse(schoolId + "?schoolId=$schoolId"),
//     );
//     print(response.body);
//     final schoolDetail = schoolDetailFromJson(response.body);
//     print(schoolDetail);
//     return schoolDetail;
//   }

//   static Future<List<SchoolDetail>> getSchoolList(String state) async {
//     String schools = baseApi + "schools";
//     print(schools + "?state=$state");
//     var response = await http.get(
//       Uri.parse(schools + "?state=$state"),
//     );
//     print(response.body);
//     final schoolList = schoolDetailFromJson(response.body);
//     print(schoolList);
//     return schoolList;
//   }

//   static Future<List<SectionDetail>> getSectionsList(
//       String courseId, String token,
//       {bool force = true}) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String sections =
//         baseUrl != null ? baseUrl + "sections" : baseApi + "sections";

//     print(sections + "?course_id=$courseId&auth_token=$token");
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(
//         sections + "?course_id=$courseId&auth_token=$token",
//         options: ApiEndpoints.cacheOptions(force));

//     //print(response.body);
//     final sectionDetail = sectionDetailFromJson(response.data);
//     return sectionDetail;
//   }

//   // enrolled_to_free_course_mobile_post
//   // 	param: auth_token, course_id
//   static Future<String> postenrollToDemo(String courseId, String token) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String enrollToDemo = baseUrl != null
//         ? baseUrl + "enrolled_to_free_course_mobile"
//         : baseApi + "enrolled_to_free_course_mobile";

//     print(enrollToDemo);
//     var response = await http.post(Uri.parse(enrollToDemo),
//         body: {"auth_token": token, "course_id": courseId});
//     print(response.body);
//     String status = json.decode(response.body)['status'];
//     return status;
//   }

//   // static Future<List<ActivityData>> getActivityList({
//   //   String classId,
//   //   String token,
//   // }) async {
//   //   String baseUrl = await Utils.getBaseUrlFromLocal();

//   //   String testData = baseUrl != null
//   //       ? baseUrl + "fetch_activity"
//   //       : baseApi + "fetch_activity";

//   //   print(testData + "?class_id=$classId&auth_token=$token");
//   //   var response = await http.get(
//   //     Uri.parse(testData + "?auth_token=$token&class_id=$classId"),
//   //   );
//   //   print(response.body);
//   //   final testDatas = ActivityListFromJson(response.body);
//   //   // return testDatas;
//   //   return [ActivityData(id: '1', classId: '599',results: ['600'], totalquestions: "8",title: "Test Title",questions: [ActivityQuestions(
//   //             id: "1",
//   //             correct: "2",
//   //             options: ["Hy", "bye", "See"],
//   //             question: "Testing itt..."),ActivityQuestions(
//   //             id: "1",
//   //             correct: "2",
//   //             options: ["Hy", "bye", "See"],
//   //             question: "Testing itt..."),ActivityQuestions(
//   //             id: "1",
//   //             correct: "2",
//   //             options: ["Hy", "bye", "See"],
//   //             question: "Testing itt..."),ActivityQuestions(
//   //             id: "1",
//   //             correct: "2",
//   //             options: ["Hy", "bye", "See"],
//   //             question: "Testing itt...")],)];
//   // }

//   static Future<List<QuizData>> getQuizData(String quizId, String token) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String quizData =
//         baseUrl != null ? baseUrl + "quiz_data" : baseApi + "quiz_data";

//     print(quizData + "?quiz_id=$quizId&auth_token=$token");
//     var response = await http.get(
//       Uri.parse(quizData + "?quiz_id=$quizId&auth_token=$token"),
//     );
//     //print(response.body);
//     final quizDatas = quizDataFromJson(response.body);
//     return quizDatas;
//   }

//   static Future<QuizInstruction> getQuizInstruction(
//       String quizId, String token) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String quizInstruction =
//         baseUrl != null ? baseUrl + "quiz_data_v2" : baseApi + "quiz_data_v2";

//     print(quizInstruction + "?quiz_id=$quizId&auth_token=$token");
//     var response = await http.get(
//       Uri.parse(quizInstruction + "?quiz_id=$quizId&auth_token=$token"),
//     );
//     //print(response.body);
//     final quizInstructions = quizInstructionFromJson(response.body);
//     return quizInstructions;
//   }

//   static Future<bool> postQuizResults(
//       String quizId, String token, int correct, int total) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String quizResults =
//         baseUrl != null ? baseUrl + "quiz_results" : baseApi + "quiz_results";

//     print(quizResults);
//     var response = await http.post(Uri.parse(quizResults), body: {
//       "quiz_id": quizId,
//       "total_questions": total.toString(),
//       "correct_answers": correct.toString(),
//       "auth_token": token
//     });
//     print(response.body);

//     return true;
//   }

//   static Future<String> getsaveCourseProgress(
//       String lessonId, String token) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String saveCourseProgress = baseUrl != null
//         ? baseUrl + "save_course_progress"
//         : baseApi + "save_course_progress";

//     print(saveCourseProgress +
//         "?lesson_id=$lessonId&progress=1&auth_token=$token");
//     var response = await http.get(
//       Uri.parse(saveCourseProgress +
//           "?lesson_id=$lessonId&progress=1&auth_token=$token"),
//     );
//     print(response.body);
//     return response.body;
//   }

//   static Future<void> getLiveClassType() async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();
//     String liveClassType = baseUrl != null
//         ? baseUrl + "system_settings"
//         : baseApi + "system_settings";
//     print(liveClassType);
//     var response = await http.get(Uri.parse(liveClassType));
//     print(response.body);
//     var j = json.decode(response.body);
//     print(j);
//     log("SETTING LIVE CLASS WITH TYPE:" + (j['live_class_type'] ?? "0"));
//     await Utils.storeString("liveClassType", (j['live_class_type'] ?? "0"));
//     if (Platform.isAndroid) {
//       Utils.enablePayment = (j['enable_payment_android'] == "1");
//     } else {
//       Utils.enablePayment = (j['enable_payment_ios'] == "1");
//     }
//     Utils.razorpayKey = j['razorpay_key'];
//   }

  // static Future<void> getSystemSettingOfSuper() async {
  //   String baseUrl = baseApi;
  //   String systemSetting = baseUrl != null
  //       ? baseUrl + "system_settings"
  //       : baseApi + "system_settings";
  //   print(systemSetting);
  //   var response = await http.get(Uri.parse(systemSetting));
  //   print(response.body);
  //   var j = json.decode(response.body);
  //   print(j);
  //   log("SETTING LIVE CLASS WITH TYPE:" + (j['live_class_type'] ?? "0"));
  //   await Utils.storeString("liveClassType", (j['live_class_type'] ?? "0"));
  //   if (Platform.isAndroid) {
  //     Utils.enablePayment = (j['enable_payment_android'] == "1");
  //   } else {
  //     Utils.enablePayment = (j['enable_payment_ios'] == "1");
  //   }
  //   Utils.razorpayKey = j['razorpay_key'];
  //   Utils.isUpdateAvailable = (j['check_for_update'] ?? "1");
  //   log("Is Update available:  " + Utils.isUpdateAvailable);
  //   Utils.enableFlashCard = (j['display_flash_questions'] ?? "0");
  //   log("Is Flash card enabled:  " + Utils.enableFlashCard);
  //   Utils.test_platform_enable = (j['enable_test_platform'] ?? "0");
  //   log("Is Test Platform enable:  " + Utils.test_platform_enable);
  //   if (Utils.test_platform_enable == "0") {
  //     // Utils.homeTab3.remove("Online Test");
  //   }
// }

//   static Future<List<LiveClass>> getLiveClasses(String date, String token,
//       {bool force = false}) async {
//     String liveClassType = await Utils.getString("liveClassType");
//     log("CALLING LIVE CLASS WITH TYPE:" + liveClassType);
//     if (liveClassType == "0") {
//       return await getLiveClassesByDate(date, token, force: force);
//     } else {
//       return await getLiveClassesByWeekDay(date, token, force: force);
//     }
//   }

//   static Future<List<LiveClass>> getLiveClassesOfCodingjr(
//       String token, String date, String catId, String url,
//       {bool force = false}) async {
//     ///while edditing the live class, remember to change the clear live class method
//     String baseUrl = url;

//     String liveClasses = baseUrl != null
//         ? baseUrl + "live_classes_v5"
//         : baseApi + "live_classes_v5";

//     log(liveClasses + "?date=$date&category_id=$catId&auth_token=$token");
//     // var response = await http.get(
//     //   Uri.parse(liveClasses + "?date=$date&auth_token=$token"),
//     // );
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(liveClasses,
//         queryParameters: {
//           "date": date,
//           "category_id": catId,
//           "auth_token": token
//         },
//         options: buildCacheOptions(Duration(days: 2),
//             forceRefresh: force,
//             primaryKey: liveClasses,
//             options: Options(responseType: ResponseType.plain)));
//     if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
//       // data come from cache
//       print("Data come from cache");
//     } else {
//       // data come from net
//       print("Data come from net");
//     }
//     var jsonData = json.decode(response.data);
//     print(jsonData);
//     List<LiveClass> liveClassList =
//         List<LiveClass>.from(jsonData.map((x) => LiveClass.fromJson(x)));

//     // print('liveClassList $liveClassList');
//     return liveClassList;
//   }

//   static Future<List<LiveClass>> getLiveClassesByWeekDay(
//       String date, String token,
//       {bool force = false}) async {
//     ///while edditing the live class, remember to change the clear live class method
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String liveClasses = baseUrl != null
//         ? baseUrl + "live_classes_v6"
//         : baseApi + "live_classes_v6";

//     log(liveClasses + "?week_day=$date&auth_token=$token");
//     // var response = await http.get(
//     //   Uri.parse(liveClasses + "?date=$date&auth_token=$token"),
//     // );
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(liveClasses,
//         queryParameters: {"week_day": date, "auth_token": token},
//         options: buildCacheOptions(Duration(days: 2),
//             forceRefresh: force,
//             primaryKey: liveClasses,
//             subKey: "week_day=$date",
//             options: Options(responseType: ResponseType.plain)));
//     if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
//       // data come from cache
//       print("Data come from cache");
//     } else {
//       // data come from net
//       print("Data come from net");
//     }
//     var jsonData = json.decode(response.data);
//     log(response.data);
//     List<LiveClass> liveClassList = List<LiveClass>.from(
//         jsonData["data"]['live_classes'].map((x) => LiveClass.fromJson(x)));

//     // print('liveClassList $liveClassList');
//     return liveClassList;
//   }

//   static Future<List<LiveClass>> getLiveClassesByDate(String date, String token,
//       {bool force = false}) async {
//     ///while edditing the live class, remember to change the clear live class method
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String liveClasses = baseUrl != null
//         ? baseUrl + "live_classes_v2"
//         : baseApi + "live_classes_v2";

//     log(liveClasses + "?date=$date&auth_token=$token");
//     // var response = await http.get(
//     //   Uri.parse(liveClasses + "?date=$date&auth_token=$token"),
//     // );
//     var _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(liveClasses,
//         queryParameters: {"date": date, "auth_token": token},
//         options: buildCacheOptions(Duration(days: 2),
//             forceRefresh: force,
//             primaryKey: liveClasses,
//             options: Options(responseType: ResponseType.plain)));
//     if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
//       // data come from cache
//       print("Data come from cache");
//     } else {
//       // data come from net
//       print("Data come from net");
//     }
//     var jsonData = json.decode(response.data);
//     print(jsonData);
//     List<LiveClass> liveClassList =
//         List<LiveClass>.from(jsonData.map((x) => LiveClass.fromJson(x)));

//     // print('liveClassList $liveClassList');
//     return liveClassList;
//   }

// //------------------------------------------------------------------------------
// //--------------------Performance API-------------------------------------------
//   static Future<String> getBarchartData(String token, String categoryId) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String performance = baseUrl != null
//         ? baseUrl + "get_chart_data"
//         : baseApi + "get_chart_data";

//     log(performance + "?auth_token=$token&category_id=$categoryId");
//     Dio _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.post(
//       performance,
//       data: FormData.fromMap({"auth_token": token, "category_id": categoryId}),
//       options: Options(responseType: ResponseType.plain),
//     );

//     var jdata = json.decode(response.data);
//     log(response.data);
//     if (jdata['status'] == 'success') {
//       return jdata['data'];
//     }
//     return '';
//   }

//   static Future<String> getPieChartData(
//       String token, String categoryId, String subCategoryId) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String performance = baseUrl != null
//         ? baseUrl + "get_pie_chart_data"
//         : baseApi + "get_pie_chart_data";

//     log(performance +
//         "?auth_token=$token&category_id=$categoryId&sub_category_id=$subCategoryId");
//     Dio _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.post(
//       performance,
//       data: FormData.fromMap({
//         "auth_token": token,
//         "category_id": categoryId,
//         "sub_category_id": subCategoryId
//       }),
//       options: Options(responseType: ResponseType.plain),
//     );

//     var jdata = json.decode(response.data);
//     log(response.data);
//     if (jdata['status'] == 'success') {
//       return jdata['data'];
//     }
//     return '';
//   }

// //------------------------------------------------------------------------------
// //--------------------Save API-----------------------------------------------
//   static Future<bool> saveUserCode({
//     String token,
//     String code,
//     String fileName,
//     String language,
//   }) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String saveCode = baseUrl != null
//         ? baseUrl + "save_user_code"
//         : baseApi + "save_user_code";

//     var data = {
//       "auth_token": token,
//       "user_code": code,
//       "filename": fileName,
//       "language": language
//     };
//     log(saveCode +
//         "?auth_token=$token&user_code=$code&filename=$fileName&language=$language");
//     Dio _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.post(
//       saveCode,
//       data: FormData.fromMap(data),
//       options: Options(responseType: ResponseType.plain),
//     );

//     var jdata = json.decode(response.data);
//     log(response.data);
//     if (jdata['status'] == 'success') {
//       return true;
//     }
//     return false;
//   }

//   static Future<List<CodeFile>> getAllCodeFiles({
//     String token,
//     String languages,
//   }) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String getAllCodeFiles = baseUrl != null
//         ? baseUrl + "get_user_all_code"
//         : baseApi + "get_user_all_code";

//     var data = {"auth_token": token, "language": languages};
//     log(getAllCodeFiles + "?auth_token=$token&language=$languages");
//     Dio _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.post(
//       getAllCodeFiles,
//       data: FormData.fromMap(data),
//       options: Options(responseType: ResponseType.plain),
//     );
//     log(response.data);

//     final codeFile = codeFileFromJson(response.data);
//     return codeFile;
//   }

//   static Future<bool> deleteCodeFile({
//     String token,
//     String id,
//   }) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String deleteCodeFile = baseUrl != null
//         ? baseUrl + "delete_user_code_file"
//         : baseApi + "delete_user_code_file";

//     var data = {"auth_token": token, "id": id};
//     log(deleteCodeFile + "?auth_token=$token&id=$id");
//     Dio _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.post(
//       deleteCodeFile,
//       data: FormData.fromMap(data),
//       options: Options(responseType: ResponseType.plain),
//     );
//     log(response.data);
//     var jdata = json.decode(response.data);
//     if (jdata['status'] == 'success') {
//       return true;
//     }
//     return false;
//   }

// //------------------------------------------------------------------------------
// //--------------------Location API-----------------------------------------------
//   static Future<List<NearbySchoolDetail>> getNearbySchools({
//     String latitude,
//     String longitude,
//   }) async {
//     String baseUrl = baseApi;

//     String getAllLocations = baseUrl != null
//         ? baseUrl + "get_nearest_institutes"
//         : baseApi + "get_nearest_institutes";

//     log(getAllLocations + "?latitude=$latitude&longitude=$longitude");
//     Dio _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(
//       getAllLocations,
//       queryParameters: {
//         "latitude": latitude,
//         "longitude": longitude,
//       },
//       options: Options(responseType: ResponseType.plain),
//     );
//     log(response.data);
//     final nearbySchoolDetail = nearbySchoolDetailFromJson(response.data);
//     return nearbySchoolDetail;
//   }

// //------------------------------------------------------------------------------
// //--------------------Flash card API-----------------------------------------------
  static Future<List<Card>> getFlashCards(String token) async {
    String baseUrl = baseApi;

    String flashCards = baseUrl != null
        ? baseUrl + "flash_questions_list"
        : baseApi + "flash_questions_list";
    var data = {"auth_token": token};
    log(flashCards);
    // Dio _dio = ApiEndpoints.getDioClient();
    // var response = await _dio.get(
    //   flashCards,
    //   queryParameters: data,
    //   options: Options(responseType: ResponseType.plain),
    // );
    // log(response.data);
    // final flashCard = flashCardFromJson(response.data);
    // return flashCard;
    return [];
  }

//   static Future<bool> saveFlashCardProgress({
//     String token,
//     String totalQuestions,
//     String correctAnswers,
//   }) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String saveFlashCardProgress = baseUrl != null
//         ? baseUrl + "save_flash_card_progress"
//         : baseApi + "save_flash_card_progress";

//     var data = {
//       "auth_token": token,
//       "total_questions": totalQuestions,
//       "correct_answers": correctAnswers
//     };
//     log(saveFlashCardProgress +
//         "?auth_token=$token&total_questions=$totalQuestions&correct_answers=$correctAnswers");
//     Dio _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.post(
//       saveFlashCardProgress,
//       data: FormData.fromMap(data),
//       options: Options(responseType: ResponseType.plain),
//     );
//     log(response.data);
//     var jdata = json.decode(response.data);
//     if (jdata['status'] == true) {
//       return true;
//     }
//     return false;
//   }

  static Future<List<TopicCardDetails>> checkFlashResponseGiven({
    String token,
    String date,
  }) async {
    String baseUrl = await Utils.getBaseUrlFromLocal();

    String checkFlashResponseGiven = baseUrl != null
        ? baseUrl + "check_flash_response_given"
        : "check_flash_response_given";

    var data = {"auth_token": token, "date": date};
    log(checkFlashResponseGiven + "?auth_token=$token&date=$date");
    // Dio _dio = ApiEndpoints.getDioClient();
    // var response = await _dio.get(
    //   checkFlashResponseGiven,
    //   queryParameters: data,
    //   options: Options(responseType: ResponseType.plain),
    // );
    // log(response.data);
    // var jdata = json.decode(response.data);
    // if (jdata['status'] == true) {
    //   final flashCardProgresses = List<FlashCardProgress>.from(
    //       jdata['data'].map((x) => FlashCardProgress.fromJson(x)));
    //   return flashCardProgresses;
    // }
    return [];
  }

//   static Future<List<FlashCardProgress>> getFlashResponseList({
//     String token,
//   }) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String getFlashResponseList = baseUrl != null
//         ? baseUrl + "get_flash_response_list"
//         : baseApi + "get_flash_response_list";

//     var data = {"auth_token": token};
//     log(getFlashResponseList + "?auth_token=$token");
//     Dio _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(
//       getFlashResponseList,
//       queryParameters: data,
//       options: Options(responseType: ResponseType.plain),
//     );
//     log(response.data);
//     final flashCardProgress = flashCardProgressFromJson(response.data);
//     return flashCardProgress;
//   }

//   //------------------------------------------------------------------------------
//   // static OAuth2Helper oauth2Helper;
//   // var client = http.Client();
//   // static Future<void> fetchFiles() async {
//   //   GoogleOAuth2Client googleClient = GoogleOAuth2Client(
//   //       redirectUri: 'com.global.codingjr:/oauth2redirect',
//   //       customUriScheme: 'com.global.codingjr');
//   //
//   //   oauth2Helper = OAuth2Helper(googleClient,
//   //       grantType: OAuth2Helper.AUTHORIZATION_CODE,
//   //       clientId:
//   //           '1031739085102-bulof9dangsfmcn5dpfsc3f3gtetr8h3.apps.googleusercontent.com',
//   //       scopes: [
//   //         'https://www.googleapis.com/auth/youtube',
//   //         'https://www.googleapis.com/auth/youtube.force-ssl'
//   //       ]);
//   //   // var resp = await oauth2Helper.fetchToken();
//   //   // print(resp);
//   //   return;
//   // }

//   static String youTubeList =
//       "https://youtube.googleapis.com/youtube/v3/liveChat/messages";

//   static Future<List<LiveChatList>> getLiveChatList(
//       String liveChatId, String apiKey) async {
//     var response = await http.get(
//       Uri.parse(youTubeList +
//           "?liveChatId=$liveChatId&part=snippet&part=authorDetails&key=$apiKey"),
//     );
//     // print('getLiveChatList = ${response.body}');
//     List<LiveChatList> chatListItems = liveChatListFromJson(response.body);
//     return chatListItems;
//   }

//   static Future<String> getChatId(String videoId) async {
//     http.Response res = await http.get(Uri.parse(
//         'https://www.googleapis.com/youtube/v3/videos?id=$videoId&part=liveStreamingDetails&key=AIzaSyAHFJbKOnAVwlUz9CtRA-BsFdeNrt1bt0w'));
//     String chatId = jsonDecode(res.body)['items'][0]['liveStreamingDetails']
//         ['activeLiveChatId'];
//     print('chatID: $chatId');
//     return chatId;
//   }

//   // static Future<List<types.Message>> fetchChatList(String liveChatId) async {
//   //   List<LiveChatList> _liveChatData = await ApiEndpoints.getLiveChatList(
//   //       liveChatId, 'AIzaSyB0wsYHRIiBTvNKqWRB3Dt9yC8g3AgxwRU');
//   //   List<types.Message> _newMessages = <types.Message>[];
//   //
//   //   _liveChatData.forEach((item) {
//   //     _newMessages.add(new types.TextMessage(
//   //         author: new types.User(
//   //             id: item.userId,
//   //             firstName: item.name,
//   //             imageUrl: item.profileImage),
//   //         id: item.userId,
//   //         text: item.textMessage));
//   //   });
//   //   List<types.Message> _msgList = _newMessages.reversed.toList();
//   //   return _msgList;
//   // }

//   // static Future<String> insertChat(
//   //     String liveChatId, String apiKey, String msg) async {
//   //   var body = jsonEncode({
//   //     "snippet": {
//   //       "displayMessage": msg,
//   //       "type": "textMessageEvent",
//   //       "textMessageDetails": {"messageText": msg},
//   //       "liveChatId": liveChatId
//   //     }
//   //   });
//   //   print('here: $liveChatId,,,, $apiKey ,,,, $msg');
//   //   http.Response res = await oauth2Helper.post(
//   //       youTubeList + "?part=snippet&part=authorDetails&key=$apiKey",
//   //       body: body);
//   //   String channelId = json.decode(res.body)['snippet']['authorChannelId'];
//   //   return channelId;
//   // }

//   //---------------------HOMEWORK--APIS------------------------------------

//   // fetch details of submitted homework
//   static Future<SubmittedHomework> getSubmittedHomework(
//       {String token, String homeworkId}) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String getSubmittedHomeworkRequest = baseUrl != null
//         ? baseUrl + "student_submitted_homework"
//         : baseApi + "student_submitted_homework";

//     var data = {"auth_token": token, "homework_id": homeworkId};
//     log(getSubmittedHomeworkRequest +
//         "?auth_token=$token&homework_id=$homeworkId");
//     Dio _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(
//       getSubmittedHomeworkRequest,
//       queryParameters: data,
//       options: Options(responseType: ResponseType.plain),
//     );
//     log(response.data);
//     final submittedHomeworkResponse = submittedHomeworkFromJson(response.data);
//     return submittedHomeworkResponse;
//   }

//   // to fetch homework given
//   static Future<List<HomeWorkList>> getHomeworkList(
//       String token, String categoryId, String subCategoryId) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String getHomeworkListRequest = baseUrl != null
//         ? baseUrl + "student_homework_list"
//         : baseApi + "student_homework_list";

//     var data = {
//       "auth_token": token,
//       "category_id": categoryId,
//       "sub_category_id": subCategoryId
//     };
//     log(getHomeworkListRequest +
//         "?auth_token=$token&category_id=$categoryId&sub_category_id=$subCategoryId");
//     // var response = await http.get(
//     //   Uri.parse(getHomeworkListRequest +
//     //       "?auth_token=$token&category_id=$categoryId&sub_category_id=$subCategoryId"),
//     // );
//     Dio _dio = ApiEndpoints.getDioClient();
//     var response = await _dio.get(
//       getHomeworkListRequest,
//       queryParameters: data,
//       options: Options(responseType: ResponseType.plain),
//     );
//     List<HomeWorkList> submittedHomeworkResponse =
//         homeworkFromJson(response.data);
//     return submittedHomeworkResponse;
//   }

//   // to add / update homework
//   static Future<String> submitHomework(
//       String authToken, String homeworkId, File file) async {
//     String baseUrl = await Utils.getBaseUrlFromLocal();

//     String submitHomeworkRequest = baseUrl != null
//         ? baseUrl + "student_submit_homework"
//         : baseApi + "student_submit_homework";

//     print(submitHomeworkRequest);
//     Dio dio = ApiEndpoints.getDioClient();
//     var response = await dio.post(submitHomeworkRequest,
//         data: FormData.fromMap({
//           "auth_token": authToken,
//           "homework_id": homeworkId,
//           "file": file != null ? await MultipartFile.fromFile(file.path) : "",
//         }),
//         options: Options(responseType: ResponseType.plain));
//     print(response.data);
//     var jdata = jsonDecode(response.data);
//     return jdata["status"];
//     // if (jdata["status"] == "success") {
//     //   return jdata["data"]["order_id"];
//     // } else {
//     //   return "";
//     // }
//   }
}

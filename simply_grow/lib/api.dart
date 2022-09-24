import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:simply_grow/constant.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:simply_grow/models/cardDetails.dart';
import 'package:simply_grow/models/topicCardData.dart';

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

// //------------------------------------------------------------------------------
// //--------------------Flash card API-----------------------------------------------
  static Future<List<Card>> getFlashCards(String token) async {
    String baseUrl = baseApi;

    String flashCards = baseUrl != null
        ? baseUrl + "flash_questions_list"
        : baseApi + "flash_questions_list";
    var data = {"auth_token": token};
    log(flashCards);

    return [];
  }

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
  }
}

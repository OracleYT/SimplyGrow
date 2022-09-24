// To parse this JSON data, do
//
//     final TopicCardDetails = TopicCardDetailsFromJson(jsonString);

import 'dart:convert';

List<TopicCardDetails> TopicCardDetailsFromJson(String str) =>
    List<TopicCardDetails>.from(
        json.decode(str).map((x) => TopicCardDetails.fromJson(x)));

String TopicCardDetailsToJson(List<TopicCardDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopicCardDetails {
  TopicCardDetails({
    this.id,
    this.totalQuestions,
    this.correctQuestions,
    this.userId,
    this.date,
  });

  String id;
  String totalQuestions;
  String correctQuestions;
  String userId;
  DateTime date;

  factory TopicCardDetails.fromJson(Map<String, dynamic> json) =>
      TopicCardDetails(
        id: json["id"],
        totalQuestions: json["total_questions"],
        correctQuestions: json["correct_questions"],
        userId: json["user_id"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_questions": totalQuestions,
        "correct_questions": correctQuestions,
        "user_id": userId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}

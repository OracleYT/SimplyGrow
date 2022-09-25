//     final courseDetail = courseDetailFromJson(jsonString);

import 'dart:convert';

List<CourseDetail> courseDetailFromJson(String str) => List<CourseDetail>.from(
    json.decode(str).map((x) => CourseDetail.fromJson(x)));

String courseDetailToJson(List<CourseDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseDetail {
  CourseDetail({
    this.id,
    this.title,
  });

  String id;
  String title;

  factory CourseDetail.fromJson(Map<String, dynamic> json) => CourseDetail(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}

// To parse this JSON data, do
//
//     final Card = CardFromJson(jsonString);

import 'dart:convert';

List<Card> CardFromJson(String str) =>
    List<Card>.from(json.decode(str).map((x) => Card.fromJson(x)));

String CardToJson(List<Card> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Card {
  Card({
    this.id,
    this.question,
    this.answer,
  });

  String id;
  String question;
  String answer;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
      };
}

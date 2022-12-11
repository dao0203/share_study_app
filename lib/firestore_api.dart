/**
 * FirestoreApの関数を集約するファイル
 * 
 * @author 佐藤佑哉
 */
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../data/question_data.dart';
import 'package:http/http.dart' as http;

class ApiResults {
  final String message;
  ApiResults({
    required this.message,
  });
  factory ApiResults.fromJson(Map<String, dynamic> json) {
    return ApiResults(
      message: json['message'],
    );
  }
}

class QuestionPostRequest {
  final String title;
  final String content;
  final String sub_name;
  final String email;
  QuestionPostRequest({
    required this.title,
    required this.content,
    required this.sub_name,
    required this.email,
  });
  Map<String, dynamic> toJson() => {
        'title': title,
        'sub_name': sub_name,
        'content': content,
        'email': email,
      };
}

class FirestoreApi {
  /**
   * 質問GETメソッド
   */

  /**
   * 質問POSTメソッド
   */
  Future<ApiResults> fetchApiResults() async {
    var url =
        "https://asia-northeast1-sharestud.cloudfunctions.net/add_question";
    var request = new QuestionPostRequest(
        title: "", content: '', sub_name: '', email: '');
    final response = await http.post(Uri.parse(url),
        body: json.encode(request.toJson()),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      return ApiResults.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}

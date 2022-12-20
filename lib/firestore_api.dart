/* 
 * @author 佐藤佑哉
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_study_app/add_answer/add_answer.dart';
import '../data/question_data.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreApi {
  /*コレクションリファーレンスを追加*/
  CollectionReference answers = firestore.collection("answers");
  CollectionReference questions = firestore.collection("questions");
  CollectionReference subjects = firestore.collection("subjects");
  DateTime createdDate = DateTime.now(); //現在の時刻を指定
  List<QuestionArguments> _question = [];
  // Future<List<String>> fetchAnswer_browse(String question_Id)async{

  // }
  /**
   * 科目取得メソッド
   */
  void getSubject() async {
    subjects.get().then(
          (value) => print("subject is fetched"),
          onError: (e) => print("subjects error $e"),
        );
  }

  /**
   * 質問閲覧メソッド
   */
  Future getQuestion() async {
    final snapshot =
        await questions.orderBy("created_date", descending: true).get();
    final qId = snapshot.docs.map((doc) => QuestionArguments())
  }

  /**
   * 質問投稿メソッド
   */
  Future<void> postQuestion(QuestionData questionData) async =>
      await questions.add({
        "title": questionData.titleContent,
        "text_content": questionData.questionContent,
        "sub_name": questionData.qSubId,
        "quesition_id": questionData.qId,
        "email": questionData.email,
        "created_date": createdDate
      });
}

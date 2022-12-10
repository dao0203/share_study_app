/**
 * FirestoreApの関数を集約するファイル
 * 
 * @author 佐藤佑哉
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/question_data.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreApi {
  /*コレクションリファーレンスを追加*/
  CollectionReference answers = firestore.collection("answers");
  CollectionReference questions = firestore.collection("questions");
  CollectionReference subjects = firestore.collection("subjects");

  // Future<List<String>> fetchAnswer_browse(String question_Id)async{

  // }

  /**
   * 質問投稿メソッド
   */
  Future<void> addQuestion(QuestionData questionData) async =>
      await questions.add({
        "title": questionData.titleContent,
        "text_content": questionData.titleContent,
        "sub_name": questionData.qSubId,
        "quesitiom_id": questionData.qId,
        "email": questionData.email
      });
}

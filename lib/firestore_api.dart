/* 
 * @author 佐藤佑哉
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data/question_post_data.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreApi {
  /*コレクションリファーレンスを追加*/
  CollectionReference answers = firestore.collection("answers");
  CollectionReference questions = firestore.collection("questions");
  CollectionReference subjects = firestore.collection("subjects");
  DateTime createdDate = DateTime.now(); //現在の時刻を指定

  // Future<List<String>> fetchAnswer_browse(String question_Id)async{

  // }

  // Future<List<String>>getSubject()async{
  //   // return subjects.get().then((value) => (value.))
  // }
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

/* 
 * @author 佐藤佑哉
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/* freezedファイル */
import 'data/question_post_data.dart';
import 'data/answer_browse_data.dart';
import 'data/question_browse_data.dart';
import 'data/answer_post_data.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreApi {
  /*コレクションリファーレンスを追加*/
  CollectionReference answers = firestore.collection("answers");
  CollectionReference questions = firestore.collection("questions");
  CollectionReference subjects = firestore.collection("subjects");
  DateTime createdDate = DateTime.now(); //現在の時刻を指定
  List<QuestionBrowseData> _questionBrowse = [];
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
    final qId = snapshot.docs.map((doc) => _questionBrowse);
  }

  /**
   * 質問投稿メソッド
   */
  Future<void> postQuestion(QuestionPostData questionData) async =>
      await questions.add({
        "title": questionData.titleContent,
        "textContent": questionData.questionContent,
        "subName": questionData.qSubId,
        "quesitionId": questionData.qId,
        "email": questionData.email,
        "createDdate": createdDate
      });
}

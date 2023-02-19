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
  CollectionReference googleAcountId = firestore.collection("user");
  DateTime createdDate = DateTime.now(); //現在の時刻を指定

  // Future<List<String>> fetchAnswer_browse(String question_Id)async{

  // }
  /**
   * 科目取得メソッド
   */
  // Future<List<String>> getSubject() async {
  //   List<String> subjectsList = [
  //     await subjects.get().then((QuerySnapshot snapshot) {
  //       snapshot.docs.forEach((doc) {
  //         doc.get("subject_name");
  //       });
  //     })
  //   ];
  //   return subjectsList;
  // }

  /**
   * 質問閲覧メソッド
   */
  Future<List<QuestionBrowseData>> getQuestion() async {
    final List<QuestionBrowseData> questionBrowseData = [];

    return questionBrowseData;
  }

  /**
   * 質問投稿メソッド
   * 
   */
  Future<void> postQuestion(QuestionPostData questionData) async =>
      await questions.add(
        {
          "title": questionData.titleContent, //タイトル内容
          "text_content": questionData.questionContent, //質問内容
          "sub_name": questionData.qSubId, //科目ID
          "email": questionData.email, //e-mailアドレス
          "created_at": createdDate //現在の時刻
        },
      );

/**
 * 回答投稿メソッド
 */
  Future<void> postAnswer(AnswerPostData answerPostData) async =>
      await answers.add({
        "answer_text": answerPostData.answerText, //回答内容
        "email": answerPostData.email, //e-mailアドレス
        "question_id": answerPostData.questionId //質問ID
      });
}

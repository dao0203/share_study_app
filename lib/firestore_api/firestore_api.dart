/* 
 * @author 佐藤佑哉
 */

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/* freezedファイル */
import '../data/question_post_data.dart';
import '../data/answer_post_data.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreApi {
  /*コレクションリファーレンスを追加*/

  CollectionReference questions = firestore.collection("questions");
  CollectionReference subjects = firestore.collection("subjects");
  CollectionReference googleAcountId = firestore.collection("user");
  DateTime createdDate = DateTime.now(); //現在の時刻を指定

  //科目名取得メソッド
  Future<Map<String, String>> getDocumentIdAndSubject() async {
    Map<String, String> result = {};

    QuerySnapshot querySnapshot = await subjects.get();

    for (var doc in querySnapshot.docs) {
      result[doc.id] = doc.get("subject_name");
    }
    return result;
  }

  // 科目IDで検索して科目名を返すメソッド
  Future<String> getSubjectName(String documentId) async {
    DocumentSnapshot documentSnapshot = await subjects.doc(documentId).get();
    final result = documentSnapshot.get("subject_name");
    return result;
  }

  //質問取得メソッド
  Future<Map<String, Map<String, dynamic>>> getQuestions() async {
    QuerySnapshot querySnapshot = await questions.get();

    //ドキュメントIDをキーとして、questionのフィールドの全データを抽出する
    final result = <String, Map<String, dynamic>>{};

    for (final doc in querySnapshot.docs) {
      result[doc.id] = doc.data() as Map<String, dynamic>;
    }

    return result;
  }

  //質問IDで検索して質問を返すメソッド
  Future<Map<String, dynamic>> getSelectedQuestion(String questionId) async {
    Map<String, dynamic> result = {};
    await questions.doc(questionId).get().then(((value) {
      if (value.exists) {
        result = value.data() as Map<String, dynamic>;
      }
    }));
    return result;
  }

  // 質問投稿メソッド
  Future<void> postQuestion(QuestionPostData questionData) async =>
      await questions.add(
        {
          "title": questionData.titleContent, //タイトル内容
          "text_content": questionData.questionContent, //質問内容
          "subject_id": questionData.qSubId, //科目ID
          "google_account_id": questionData.email, //e-mailアドレス
          "created_at": createdDate //現在の時刻
        },
      );

  //回答GETメソッド
  Future<Map<String, Map<String, dynamic>>> getAnswers(
      String questionId) async {
    QuerySnapshot querySnapshot =
        await questions.doc(questionId).collection("answers").get();
    final result = <String, Map<String, dynamic>>{};
    for (final doc in querySnapshot.docs) {
      result[doc.id] = doc.data() as Map<String, dynamic>;
    }
    return result;
  }

  //回答投稿メソッド
  Future<void> postAnswer(
      AnswerPostData answerPostData, String questionId) async {
    await questions.doc(questionId).collection("answers").add(
      {
        "answer_text": answerPostData.answerText,
        "google_account_id": answerPostData.answerText,
        "created_at": createdDate,
      },
    );
  }
}

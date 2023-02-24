/* 
 * @author 佐藤佑哉
 */
import 'package:cloud_firestore/cloud_firestore.dart';

/* freezedファイル */
import '../data/question_post_data.dart';
import '../data/answer_post_data.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreApi {
  /*コレクションリファーレンスを追加*/
  CollectionReference questions = firestore.collection("questions");
  CollectionReference subjects = firestore.collection("subjects");
  CollectionReference answers = firestore.collection("answers");
  CollectionReference googleAcountId = firestore.collection("user");
  DateTime createdDate = DateTime.now(); //現在の時刻を指定

  //科目名取得メソッド
  Future<Map<String, String>> getDocumentIdAndSubject() async {
    Map<String, String> result = {};

    QuerySnapshot querySnapshot = await subjects.get();

    for (var doc in querySnapshot.docs) {
      result[doc.id] = doc.get("subjectName");
    }
    return result;
  }

  // 科目IDで検索して科目名を返すメソッド
  Future<String> getSubjectName(String documentId) async {
    DocumentSnapshot documentSnapshot = await subjects.doc(documentId).get();
    final result = documentSnapshot.get("subjectName");
    return result;
  }

  //質問取得メソッド
  Future<Map<String, Map<String, dynamic>>> getQuestions() async {
    QuerySnapshot querySnapshot = await questions.get();
    final result = <String, Map<String, dynamic>>{};
    for (final doc in querySnapshot.docs) {
      result[doc.id] = doc.data() as Map<String, dynamic>;
    }
    return result;
  }

  //質問IDで検索して質問を返すメソッド
  Future<DocumentSnapshot> getSelectedQuestion(String questionId) async {
    final docSnapShot = await questions.doc(questionId).get();
    return docSnapShot;
  }

  // 質問投稿メソッド
  Future<void> postQuestion(QuestionPostData questionData) async {
    final List<String> emptyList = [];
    await questions.add(
      {
        "title": questionData.titleContent, //タイトル内容
        "textContent": questionData.questionContent, //質問内容
        "subjectName": questionData.qSubName, //科目ID
        "googleAccountId": questionData.googleAccountId, //googleAccountId
        "createdAt": createdDate, //現在の時刻
        "answerIds": emptyList
      },
    );
  }

  //回答GETメソッド
  Future<Map<String, Map<String, dynamic>>> getAnswers(
      String questionId) async {
    final result = <String, Map<String, dynamic>>{};
    QuerySnapshot querySnapshot =
        await answers.where("questionId", isEqualTo: questionId).get();
    for (final doc in querySnapshot.docs) {
      result[doc.id] = doc.data() as Map<String, dynamic>;
    }
    return result;
  }

  //回答投稿メソッド
  Future<void> postAnswer(
      AnswerPostData answerPostData, String questionId) async {
    // 回答をFirestoreに格納
    final answerDocRef = await answers.add(
      {
        "answerText": answerPostData.answerText,
        "googleAccountId": answerPostData.answerText,
        "createdAt": createdDate,
        "questionId": questionId
      },
    );
    //直後に生成された回答IDを格納
    final answerId = answerDocRef.id;
    //questionsの特定のフィールドに格納
    await questions.doc(questionId).update(
      {
        "answerIds": FieldValue.arrayUnion([answerId]),
      },
    );
  }
}

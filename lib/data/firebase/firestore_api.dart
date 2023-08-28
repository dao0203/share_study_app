/* 
 * @author 佐藤佑哉
 */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_study_app/constants.dart';
import 'package:share_study_app/data/domain/answer.dart';
import 'package:share_study_app/data/domain/registration.dart';
import 'package:share_study_app/data/domain/question.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreApi {
  /*コレクションリファーレンスを追加*/
  CollectionReference questions = firestore.collection(QUESTIONS);
  CollectionReference subjects = firestore.collection(SUBJECTS);
  CollectionReference answers = firestore.collection(ANSWERS);
  CollectionReference users = firestore.collection(USERS);
  DateTime createdDate = DateTime.now(); //現在の時刻を指定
  User? auth = FirebaseAuth.instance.currentUser;
  Future<void> addUser(Registration dataWhenRegister) async {
    await users.doc(dataWhenRegister.email).set({
      USERS_EMAIL: dataWhenRegister.email,
      USERS_NAME: dataWhenRegister.lastName + dataWhenRegister.firstName,
      USERS_FIRST_NAME: dataWhenRegister.firstName,
      USERS_LAST_NAME: dataWhenRegister.lastName,
      USERS_GRADE: dataWhenRegister.grade,
    });
  }

  //科目名取得メソッド
  Future<Map<String, String>> getDocumentIdAndSubject() async {
    Map<String, String> result = {};

    QuerySnapshot querySnapshot = await subjects.get();

    for (var doc in querySnapshot.docs) {
      result[doc.id] = doc.get(SUBJECTS_NAME);
    }
    return result;
  }

  // 科目IDで検索して科目名を返すメソッド
  Future<String> getSubjectName(String documentId) async {
    DocumentSnapshot documentSnapshot = await subjects.doc(documentId).get();
    final result = documentSnapshot.get(SUBJECTS_NAME);
    return result;
  }

  //FirebaseAuthのemailからfirestoreのusersコレクションのドキュメントを取得するメソッド
  Future<DocumentSnapshot> getUser() async {
    String? userEmail = auth?.email;
    final docSnapShot = await users.doc(userEmail).get();
    return docSnapShot;
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
  Future<void> postQuestion(Question question) async {
    final List<String> emptyList = [];
    await questions.add(
      {
        QUESTIONS_TITLE: question.title, //タイトル内容
        QUESTIONS_QUESTION_CONTENT: question.content, //質問内容
        QUESTIONS_SUBJECT_NAME: question.qSubName, //科目名
        QUESTIONS_CREATED_AT: createdDate, //現在の時刻
        QUESTIONS_ANSWER_IDS: emptyList, //回答ID
        QUESTIONS_FIRST_NAME: question.questioner.firstName,
        QUESTIONS_LAST_NAME: question.questioner.lastName,
        QUESTIONS_GRADE: question.questioner.grade,
      },
    );
  }

  //回答GETメソッド
  Future<Map<String, Map<String, dynamic>>> getAnswers(
      String questionId) async {
    final result = <String, Map<String, dynamic>>{};
    QuerySnapshot querySnapshot =
        await answers.where(ANSWERS_QUETSION_ID, isEqualTo: questionId).get();
    for (final doc in querySnapshot.docs) {
      result[doc.id] = doc.data() as Map<String, dynamic>;
    }
    return result;
  }

  //回答投稿メソッド
  Future<void> postAnswer(Answer answerPostData, String questionId) async {
    // 回答をFirestoreに格納
    final answerDocRef = await answers.add(
      {
        ANSWERS_TEXT: answerPostData.content,
        ANSWERS_EMAIL: answerPostData.content,
        ANSWERS_FIRST_NAME: answerPostData.answerer.firstName,
        ANSWERS_LAST_NAME: answerPostData.answerer.lastName,
        ANSWERS_CREATED_AT: createdDate,
        ANSWERS_QUETSION_ID: questionId,
        ANSWERS_GRADE: answerPostData.answerer.grade,
      },
    );
    //直後に生成された回答IDを格納
    final answerId = answerDocRef.id;
    //questionsの特定のフィールドに格納
    await questions.doc(questionId).update(
      {
        QUESTIONS_ANSWER_IDS: FieldValue.arrayUnion([answerId]),
      },
    );
  }
}
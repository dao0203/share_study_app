import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

/**
 * 科目取得メソッド
 */
class GetSubjectApi {
  CollectionReference subjects = firestore.collection("questions");

  Future<Map<String, String>> getDocumentIdAndSubject() async {
    Map<String, String> result = {};

    QuerySnapshot querySnapshot = await subjects.get();

    querySnapshot.docs.forEach(
      (doc) {
        result[doc.id] = doc.get("subject_name");
      },
    );

    return result;
  }
}

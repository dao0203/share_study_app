import 'package:flutter/material.dart';
import 'package:share_study_app/data/firebase/firestore_api.dart';
import 'package:share_study_app/ui/view/timeline/components/question_list_items.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:share_study_app/ui/view/postquestion/question_post_page.dart';

class ThreadPage extends StatefulWidget {
  const ThreadPage({Key? key}) : super(key: key);
  static String tag = "thread_page";
  @override
  State<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  //FirestoreApiを使用
  FirestoreApi firestoreApi = FirestoreApi();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //戻るボタンを非表示
        title: const Text("質問一覧"),
      ),

      //フローティングボタン
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("質問投稿"),
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const QuestionPostPage()),
            ),
          );
        },
      ),

      //画面
      body: FutureBuilder(
          future: firestoreApi.getQuestions(), //getQuestion()でデータをAPIから取得

          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //エラーが発生した場合
              return const Center(
                child: Text("errorが発生しました"),
              );
            } else if (!snapshot.hasData) {
              //データの読み込み中
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //質問リストを表示
            return AnimationLimiter(
              //AnimationLimiterでラップ
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final questionItem = snapshot.data!.entries.elementAt(index);
                  return questionListItem(context, index, questionItem);
                },
              ),
            );
          }),
    );
  }
}

// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:share_study_app/firestore_api/firestore_api.dart';

class AnswerView extends StatefulWidget {
  const AnswerView({super.key, required this.questionId});

  final String questionId;

  @override
  State<AnswerView> createState() => _AnswerViewState();
}

class _AnswerViewState extends State<AnswerView> {
  FirestoreApi firestoreApi = FirestoreApi();
  late String questionId;

  @override
  void initState() {
    super.initState();
    //遷移
    questionId = widget.questionId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("回答一覧"),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: firestoreApi.getSelectedQuestion(questionId),
              builder:
                  ((context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Error：${snapshot.error},$questionId");
                  } else {
                    final data = snapshot.data!;
                    final title = data["title"];
                    final textContent = data["text_content"];

                    return Column(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              Text(title),
                              Text(textContent),
                            ],
                          ),
                        )
                      ],
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

//ベストアンサーされている質問の質問・回答閲覧ページ
class AnswerViewPage extends StatelessWidget {
  AnswerViewPage({Key? key}) : super(key: key);
  // 前のページからqId,qUserId,qSubId,qTitle,questionを受け取る
  // とりあえずダミー値をおいておく
  final qId = "TestQId";
  final qUserId = "TestQUserId";
  final qSubId = "TestQSubId";
  final qTitle = "TestQTitle";
  final question = "TestQuestion";
  // 受け取ったqIdを使ってapiを叩き，回答リストを取得する
  // とりあえずダミーの回答を代入
  final List<List<String>> list = [
    ["TestaId_1", "TestaUserId1", "TestAnswer1"],
    ["TestaId_2", "TestaUserId2", "TestAnswer2"],
    ["TestaId_3", "TestaUserId3", "TestAnswer3"],
    ["TestaId_4", "TestaUserId4", "TestAnswer4"],
    ["TestaId_5", "TestaUserId5", "TestAnswer5"],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("回答閲覧画面"),
        ),
        body: ListView(children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Text(
              "質問",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          //質問のcardの表示
          QuestionCard(
            qUserId: qUserId,
            qSubId: qSubId,
            qTitle: qTitle,
            question: question,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Text(
              "回答",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          AnswerCards(
            list: list,
          ),
          // return Card(
          //   child: ListTile(
          //     title: Text(items[index]),
          //   ),
          // );
        ]));
  }
}

// 質問のcardを表示する部分
class QuestionCard extends StatelessWidget {
  final String qUserId;
  final String qSubId;
  final String qTitle;
  final String question;
  const QuestionCard(
      {Key? key,
      required this.qUserId,
      required this.qSubId,
      required this.qTitle,
      required this.question})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Text(qSubId),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                const FlutterLogo(), // ここはuserのアイコンの予定
                Text(qUserId),
              ],
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15.0),
              child: Text(qTitle),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(question),
            ),
          ),
        ],
      ),
    );
  }
}

// 回答のcardを表示する部分
class AnswerCards extends StatelessWidget {
  final List<List<String>> list;
  const AnswerCards({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    const FlutterLogo(), // ここはuserのアイコンの予定
                    Text(list[index][1]),
                  ],
                ),
              ),
              ListTile(
                subtitle: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(list[index][2]),
                ),
              ),
            ],
          ),
        );
        // return Card(
        //   child: ListTile(
        //     title: Text(items[index]),
        //   ),
        // );
      },
    );
  }
}

// データ取得APIを使ってqIdから回答リストを取得する
// req:qId, res:List<Ans> Ansはtxt,email,dateが返される
// jsonで返ってくるのでjson.decoodeで変数に入れる
// とりあえずダミーの回答リストを作成
// List<List<String>> answerlist = [

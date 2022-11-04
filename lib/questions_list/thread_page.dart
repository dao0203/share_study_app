import 'package:flutter/material.dart';

class ThreadPage extends StatefulWidget {
  const ThreadPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          //ダミーの質問
          // ここは数十件(50とか？)まとめてロードしてページ分けで表示するようにしたい
          //BAとNBAは本来分けずに一つのwidgetで表示する
          _getQuestionsBA(context),
          _getQuestionsBA(context),
          _getQuestionsNBA(context),
          _getQuestionsBA(context),
          _getQuestionsNBA(context),
          _getQuestionsBA(context),
          _getQuestionsBA(context),
          _getQuestionsNBA(context),
          _getQuestionsNBA(context),
          _getQuestionsNBA(context),
          _getQuestionsBA(context),
          _getQuestionsBA(context),
          _getQuestionsNBA(context),
          _getQuestionsBA(context),
        ],
      ),
    );
  }
}

//質問と解答のセット
//解答があるか判断して回答するか詳細を見るかを判断
//answerは var list(複数解答が付きうるので)で，bestanswerはString
Widget _questionItem(BuildContext context, QuestionArguments question,
    AnswerArguments answer, bool isBestAnswered) {
  //ベストアンサーあり
  if (isBestAnswered) {
    return GestureDetector(
      child: Card(
        color: Colors.amber[50],
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(children: <Widget>[
              const SizedBox(width: 10),
              const Text('👑Best Answered!!👑'),
              const SizedBox(width: 10),
              Text("#${question.qSubId}"), //ここはqSubNameにしたい
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(children: <Widget>[
              const SizedBox(width: 10),
              Text(question.qUserId), //ここはqUserNameにしたい
            ]),
          ),
          ListTile(
            leading: const FlutterLogo(), // ここはuserのアイコンの予定
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(question.question),
            ),
            subtitle: Text(answer.answer),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('回答を見る'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/ap_ba'); //BAが決まっているので解答閲覧ページに遷移
                },
              ),
              const SizedBox(width: 20),
            ],
          ),
        ]),
      ),
    );
  } else {
    //ベストアンサーなし
    return GestureDetector(
      child: Card(
        color: Colors.blueGrey[50],
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(children: <Widget>[
              const SizedBox(width: 10),
              const Text('😔Best answer not provided...😔'),
              const SizedBox(width: 10),
              Text("#${question.qSubId}"),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(children: <Widget>[
              const SizedBox(width: 10),
              Text(question.qUserId), //ここはqUserNameにしたい
            ]),
          ),
          ListTile(
            leading: const FlutterLogo(), // ここはアイコンの予定
            contentPadding: const EdgeInsets.all(10), // ここは余白の予定
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15.0), // ここは余白の予定
              child: Text(question.question),
            ),
            subtitle: Text(answer.answer),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('回答する'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/ap_nba'); //BA決まってないのでNBAページに遷移して解答
                },
              ),
              const SizedBox(width: 20),
            ],
          ),
        ]),
      ),
    );
  }
}

/*
質問のデータ構造
qId: 質問のID
qUserId: 質問したユーザーのID
qSubId: 質問の科目ID
question: 質問の内容
attFiles: 質問に添付されたファイル(Path)
*/

//質問の構造体
//とりあえずでString
class QuestionArguments {
  final String qId;
  final String qUserId;
  final String qSubId;
  final String question;
  final String attFiles;
  const QuestionArguments(
      {required this.qId,
      required this.qUserId,
      required this.qSubId,
      required this.question,
      required this.attFiles});
}

/*
回答のデータ構造
qId: 質問のID
aId: 回答のID
aUserId: 回答したユーザーのID
answer: 回答の内容
attFiles: 回答に添付されたファイル(Path)
*/

//回答の構造体
//とりあえずでString
class AnswerArguments {
  final String qId; //質問のID
  final String aId; //回答のID
  final String aUserId; //回答したユーザーのID
  final String answer; //回答の内容
  final String numAnswers; //回答の数
  final String attFiles; //添付ファイル

  const AnswerArguments(
      {required this.qId,
      required this.aId,
      required this.aUserId,
      required this.answer,
      required this.numAnswers,
      required this.attFiles});
}

// DBから質問を受け取って表示widgetに渡すwidget
// BAとNBAになっているが，実際はDBからの取得値によって勝手に分岐する
//ベストアンサーされているもの
Widget _getQuestionsBA(BuildContext context) {
  var isBestAnswered = false;
  //質問の構造体
  var question = const QuestionArguments(
      qId: "qId",
      qUserId: "qUserId",
      qSubId: "qSubId",
      question: "question",
      attFiles: "attFiles");
  //解答の構造体
  var answer = const AnswerArguments(
      qId: "qId",
      aId: "aId",
      aUserId: "aUserId",
      answer: "answer",
      numAnswers: "3",
      attFiles: "attFiles");
  //質問を受け取る処理
  if (answer.answer == "") {
    isBestAnswered = false;
    return _questionItem(context, question, answer, isBestAnswered);
  } else {
    isBestAnswered = true;
    return _questionItem(context, question, answer, isBestAnswered);
  }
}

//ベストアンサーされていないもの
Widget _getQuestionsNBA(BuildContext context) {
  var isBestAnswered = false;
  //質問の構造体
  var question = const QuestionArguments(
      qId: "qId",
      qUserId: "qUserId",
      qSubId: "qSubId",
      question: "question",
      attFiles: "attFiles");
  //解答の構造体
  var answer = const AnswerArguments(
      qId: "qId",
      aId: "aId",
      aUserId: "aUserId",
      answer: "",
      numAnswers: "0",
      attFiles: "attFiles");
  //質問を受け取る処理
  if (answer.answer == "") {
    isBestAnswered = false;
    return _questionItem(context, question, answer, isBestAnswered);
  } else {
    isBestAnswered = true;
    return _questionItem(context, question, answer, isBestAnswered);
  }
}

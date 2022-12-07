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
          _baQuestionItem(context),
          _baQuestionItem(context),
          _nbaQuestionItem(context),
          _baQuestionItem(context),
          _nbaQuestionItem(context),
          _baQuestionItem(context),
          _baQuestionItem(context),
          _nbaQuestionItem(context),
          _nbaQuestionItem(context),
          _nbaQuestionItem(context),
          _baQuestionItem(context),
          _baQuestionItem(context),
          _nbaQuestionItem(context),
          _baQuestionItem(context),
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
  var stateText = "";
  var buttonText = "";
  var routeName = "";
  Color? color = Colors.white;
  // ベストアンサーがあるかどうかで値を決める
  if (isBestAnswered) {
    stateText = "👑Best Answered!!👑";
    buttonText = "回答を見る";
    color = Colors.amber[50];
    routeName = "/ap_ba";
  } else {
    stateText = "'😔Best answer not provided...😔'";
    buttonText = "回答する";
    color = Colors.blueGrey[50];
    routeName = "/ap_nba";
  }
  return GestureDetector(
    child: Card(
      color: color,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: _Header(
            stateText: stateText,
            qSubId: question.qSubId,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: _UserInfo(
            qUserId: question.qUserId,
          ),
        ),
        _Question(qTitle: question.qTitle, question: question.question),
        _FooterButton(buttonText: buttonText, routeName: routeName),
      ]),
    ),
  );
}

// QuestionItemのBA状態と科目IDを表示する部分
class _Header extends StatelessWidget {
  final String stateText;
  final String qSubId;
  const _Header({Key? key, required this.stateText, required this.qSubId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const SizedBox(width: 10),
      Text(stateText),
      const SizedBox(width: 10),
      Text("#$qSubId"), //ここはqSubNameにしたい
    ]);
  }
}

// QuestionItemのユーザー情報を表示する部分
class _UserInfo extends StatelessWidget {
  // ユーザーアイコンのデータも受け取る
  final String qUserId;
  const _UserInfo({Key? key, required this.qUserId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const FlutterLogo(), // ここはuserのアイコンの予定
      Text(qUserId),
    ]);
  }
}

// QuestionItemの質問タイトルと内容を表示する部分
class _Question extends StatelessWidget {
  final String qTitle;
  final String question;
  const _Question({Key? key, required this.qTitle, required this.question})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Text(qTitle),
      ),
      subtitle: Text(question),
    );
  }
}

// QuestionItemのページ遷移ボタンの部分
class _FooterButton extends StatelessWidget {
  final String buttonText;
  final String routeName;
  const _FooterButton(
      {Key? key, required this.buttonText, required this.routeName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextButton(
          child: Text(buttonText),
          onPressed: () {
            Navigator.pushNamed(context, routeName); //回答ページに遷移
          },
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

//質問の構造体
//とりあえずでString
class QuestionArguments {
  QuestionArguments(
      {required this.qId,
      required this.qUserId,
      required this.qSubId,
      required this.qTitle,
      required this.question
      //required this.attFiles});
      });
  String qId; //質問のID
  String qUserId; //qUserId: 質問したユーザーのID
  String qSubId; //qSubId: 質問の科目ID
  String qTitle; //qTitle: 質問のタイトル
  String question; //question: 質問の内容
  // final String attFiles; //質問の添付ファイル(一旦なし)
}

// 質問の変数を受け取る関数
class GetQuestionArguments {
  // ここで質問を受け取る
  // とりあえずダミーの回答を代入
  QuestionArguments questionArguments = QuestionArguments(
      qId: "TestQId",
      qUserId: "TestQUserId",
      qSubId: "TestQSubId",
      qTitle: "TestQTitle",
      question: "TestQuestion");
  // ここで質問を返す
  QuestionArguments getQuestionArguments() {
    return questionArguments;
  }
}

//回答の構造体
//とりあえずでString
class AnswerArguments {
  AnswerArguments({
    required this.qId,
    required this.aId,
    required this.aUserId,
    required this.answer,
    //required this.attFiles});
  });
  String qId; //質問のID
  String aId; //回答のID
  String aUserId; //回答したユーザーのID
  String answer; //回答の内容
  // final String attFiles; //回答の添付ファイル(一旦無し)
}

// 回答の変数を受け取る関数
class GetAnswerArguments {
  // ここで回答を受け取る
  // とりあえずダミーの回答を代入
  AnswerArguments answerArguments = AnswerArguments(
      qId: "TestQId",
      aId: "TestAid",
      aUserId: "TestAUserId",
      answer: "TestAnswer");
  // ここで回答を返す
  AnswerArguments getAnswerArguments() {
    return answerArguments;
  }
}

// DBから質問を受け取って表示widgetに渡すwidget
// BAとNBAになっているが，実際はDBからの取得値によって勝手に分岐するように実装する
//ベストアンサーされているもの
Widget _baQuestionItem(BuildContext context) {
  var isBestAnswered = false;
  //質問の構造体
  var question = GetQuestionArguments().getQuestionArguments();
  //解答の構造体
  var answer = GetAnswerArguments().getAnswerArguments();
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
Widget _nbaQuestionItem(BuildContext context) {
  bool isBestAnswered;
  // GetQuestionArgumentsで質問を受け取る
  var question = GetQuestionArguments().getQuestionArguments();
  // GetAnswerArgumentsで回答を受け取る
  var answer = GetAnswerArguments().getAnswerArguments();
  answer.answer = "";
  //質問を受け取る処理
  if (answer.answer == "") {
    isBestAnswered = false;
    return _questionItem(context, question, answer, isBestAnswered);
  } else {
    isBestAnswered = true;
    return _questionItem(context, question, answer, isBestAnswered);
  }
}

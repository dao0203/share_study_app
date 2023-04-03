import 'package:flutter/material.dart';
import 'package:share_study_app/firestore_api.dart';
import 'package:share_study_app/view/questions_list/list_item/question_list_items.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:share_study_app/view/tweet/question_post_page.dart';

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
        title: const Text("質問閲覧画面"),
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

//質問と解答のセット
//解答があるか判断して回答するか詳細を見るかを判断
//answerは var list(複数解答が付きうるので)で，bestanswerはString
Widget questionItem(BuildContext context, QuestionArguments question,
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
    routeName = "/avp";
  } else {
    stateText = "'😔Best answer not provided...😔'";
    buttonText = "回答する";
    color = Colors.blueGrey[50];
    routeName = "/avp";
  }
  return GestureDetector(
    child: Card(
      color: color,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Header(
            stateText: stateText,
            qSubId: question.qSubId,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: UserInfo(
            qUserId: question.qUserId,
          ),
        ),
        Question(qTitle: question.qTitle, question: question.question),
        FooterButton(buttonText: buttonText, routeName: routeName),
      ]),
    ),
  );
}

// QuestionItemのBA状態と科目IDを表示する部分
class Header extends StatelessWidget {
  final String stateText;
  final String qSubId;
  const Header({Key? key, required this.stateText, required this.qSubId})
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
class UserInfo extends StatelessWidget {
  // ユーザーアイコンのデータも受け取る
  final String qUserId;
  const UserInfo({Key? key, required this.qUserId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const FlutterLogo(), // ここはuserのアイコンの予定
      Text(qUserId),
    ]);
  }
}

// QuestionItemの質問タイトルと内容を表示する部分
class Question extends StatelessWidget {
  final String qTitle;
  final String question;
  const Question({Key? key, required this.qTitle, required this.question})
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
class FooterButton extends StatelessWidget {
  final String buttonText;
  final String routeName;
  const FooterButton(
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
            // 詳細ページに押された質問の情報を渡す
            // qId,qUserId,qSubId,qTitle,questionを渡す
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
Widget baQuestionItem(BuildContext context) {
  var isBestAnswered = false;
  //質問の構造体
  var question = GetQuestionArguments().getQuestionArguments();
  //解答の構造体
  var answer = GetAnswerArguments().getAnswerArguments();
  //質問を受け取る処理
  if (answer.answer == "") {
    isBestAnswered = false;
    return questionItem(context, question, answer, isBestAnswered);
  } else {
    isBestAnswered = true;
    return questionItem(context, question, answer, isBestAnswered);
  }
}

//ベストアンサーされていないもの
Widget nbaQuestionItem(BuildContext context) {
  bool isBestAnswered;
  // GetQuestionArgumentsで質問を受け取る
  var question = GetQuestionArguments().getQuestionArguments();
  // GetAnswerArgumentsで回答を受け取る
  var answer = GetAnswerArguments().getAnswerArguments();
  answer.answer = "";
  //質問を受け取る処理
  if (answer.answer == "") {
    isBestAnswered = false;
    return questionItem(context, question, answer, isBestAnswered);
  } else {
    isBestAnswered = true;
    return questionItem(context, question, answer, isBestAnswered);
  }
}

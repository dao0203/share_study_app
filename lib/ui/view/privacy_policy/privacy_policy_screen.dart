import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プライバシーポリシー'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'プライバシーポリシー',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '本アプリで提供するサービス（以下,「本サービス」といいます。）における，ユーザーの個人情報の取扱いについて，以下のとおりプライバシーポリシー（以下，「本ポリシー」といいます。）を定めます。',
            ),
            SizedBox(height: 16.0),
            Text(
              '第1条（個人情報）',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '「個人情報」とは，個人情報保護法にいう「個人情報」を指すものとし，生存する個人に関する情報であって，当該情報に含まれる氏名，生年月日，住所，電話番号，連絡先その他の記述等により特定の個人を識別できる情報及び容貌，指紋，声紋にかかるデータ，及び健康保険証の保険者番号などの当該情報単体から特定の個人を識別できる情報（個人識別情報）を指します。',
            ),
            SizedBox(height: 16.0),
            Text(
              '第2条（個人情報の収集方法）',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'ユーザーが利用登録をする際に氏名，メールアドレスなどの個人情報をお尋ねすることがあります。',
            ),
            SizedBox(height: 16.0),
            Text(
              '第3条（個人情報を収集・利用する目的）',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '当社が個人情報を収集・利用する目的は，以下のとおりです。\n'
                  '1.当社サービスの提供・運営のため\n'
                  '2.ユーザーからのお問い合わせに対応するため(本人確認を行うことも含む)\n'
                  '3.ユーザーが利用中のサービスの新機能，更新情報，キャンペーン等及び当社が提供する他のサービスの案内のメールを送付するため\n'
                  '4.メンテナンス，重要なお知らせなど必要に応じたご連絡のため\n'
                  '5.利用規約に違反したユーザーや，不正・不当な目的でサービスを利用しようとするユーザーの特定をし，ご利用をお断りするため\n'
                  '6.ユーザーにご自身の登録情報の閲覧や変更，削除，ご利用状況の閲覧を行っていただくため\n'
                  '7.有料サービスにおいて，ユーザーに利用料金を請求するため\n'
                  '8.上記の利用目的に付随する目的'
            ),
            SizedBox(height: 16.0),
            Text(
              '第4条（利用目的の変更）',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1.当社は，利用目的が変更前と関連性を有すると合理的に認められる場合に限り，個人情報の利用目的を変更するものとします。\n'
              '2.利用目的の変更を行った場合には，変更後の目的について，当社所定の方法により，ユーザーに通知し，または本ウェブサイト上に公表するものとします。\n'
            ),
            SizedBox(height: 16.0),

            Text(
              '第5条（個人情報の第三者提供）',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('当社は，次に掲げる場合を除いて，あらかじめユーザーの同意を得ることなく，第三者に個人情報を提供することはありません。ただし，個人情報保護法その他の法令で認められる場合を除きます。'),
            SizedBox(height: 8.0),
            Text(
              '1.人の生命，身体または財産の保護のために必要がある場合であって，本人の同意を得ることが困難であるとき\n'
              '2.公衆衛生の向上または児童の健全な育成の推進のために特に必要がある場合であって，本人の同意を得ることが困難であるとき\n'
              '3.国の機関もしくは地方公共団体またはその委託を受けた者が法令の定める事務を遂行することに対して協力する必要がある場合であって，本人の同意を得ることにより当該事務の遂行に支障を及ぼすおそれがあるとき\n'
              '4.予め次の事項を告知あるいは公表し，かつ当社が個人情報保護委員会に届出をしたとき\n'
            ),
            Text(
              '1.'
            ),
            SizedBox(height: 16.0),
            Text(
              '第10条（お問い合わせ窓口）',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '本ポリシーに関するお問い合わせは，下記の窓口までお願いいたします。\n\nEメールアドレス：g031t071@s.iwate-pu.ac.jp',
            ),
          ],
        ),
      ),
    );
  }
}

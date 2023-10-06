import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TosScreen extends HookConsumerWidget {
  const TosScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('利用規約'),
      ),
      body: const Markdown(
        data: '''
# 利用規約

この利用規約（以下，「本規約」といいます。）は，
本アプリケーション（以下，「本アプリ」といいます。）の利用条件を定めるものです。

## 第1条（適用）

1. 本規約は，ユーザーと本アプリの運営者との間の本アプリの利用に関わる一切の関係に適用されるものとします。
2. 本アプリは，本アプリの利用者（以下，「ユーザー」といいます。）に本規約の内容を十分に理解していただくために,
本規約をユーザーに対して提示します。
3. ユーザーは，本アプリを利用することにより，本規約の内容について同意したものとみなします。

## 第2条（利用登録）

1. 本サービスにおいては、登録希望者が本規約に同意の上、当社の定める方法によって利用登録を申請し、
当社がこの承認を登録希望者によって通知することによって、利用登録が完了するものとします。
2. 当社は、利用登録の申請者に以下の事由があると判断した場合、利用登録の申請を承認しないことがあります。
    1. 利用登録の申請に際して虚偽の事項を届け出た場合
    2. 本規約に違反したことがある者からの申請である場合
    3. その他、当社が利用登録を相当でないと判断した場合

## 第3条（ユーザーIDおよびパスワードの管理）

1. ユーザーは、自己の責任において、本アプリのユーザーIDおよびパスワードを管理するものとします。
2. ユーザーは、いかなる場合にも、ユーザーIDおよびパスワードを第三者に譲渡または貸与することはできません。
当社は、メールアドレスおよびパスワードの組み合わせが登録情報と一致してログインされた場合には、
そのメールアドレスを登録しているユーザー自身による利用とみなします。
3. ユーザーIDおよびパスワードが第三者によって使用されたことによって生じた損害は、
当社に故意又は重大な過失がある場合を除き、当社は一切の責任を負わないものとします。

## 第4条（禁止事項）

1. ユーザーは、本アプリの利用にあたり、以下の行為をしてはなりません。
    1. 法令または公序良俗に違反する行為
    2. 犯罪行為に関連する行為
    3. 当社のサーバーまたはネットワークの機能を破壊したり、妨害したりする行為
    4. 当社のサービスの運営を妨害するおそれのある行為
    5. 他のユーザーに関する個人情報等を収集または蓄積する行為
    6. 不正アクセスをし、またはこれを試みる行為
    7. 他のユーザーに成りすます行為
    8. 当社のサービスに関連して、反社会的勢力に対して直接または間接に利益を供与する行為
    9. 当社または第三者の知的財産権、肖像権、プライバシー、名誉その他の権利または利益を侵害する行為
    10. 以下の表現を含み、または含むと当社が判断する内容を本アプリ上に投稿し、または送信する行為
        1. 過度に暴力的な表現
        2. 露骨な性的表現
        3. 人種、国籍、信条、性別、社会的身分、門地等による差別を助長する表現
        4. 自殺、自傷行為、薬物乱用を誘引または助長する表現
        5. その他反社会的な内容を含み他人に不快感を与える表現
    11. 以下を目的とし、または目的とすると当社が判断する行為
        1. 営業、宣伝、広告、勧誘、その他営利を目的とする行為
        2. 性行為やわいせつな行為を目的とする行為
        3. 面識のない異性との出会いや交際を目的とする行為
        4. 当社のサービスの他の利用者に対する嫌がらせや誹謗中傷を目的とする行為
        5. 当社のサービスの他の利用者に対する金銭的な要求を目的とする行為
        6. 当社のサービスを利用して、性行為に関する画像、動画、文章等の投稿を目的とする行為
        7. その他、当社が不適切と判断する行為
    12. 宗教活動または宗教団体への勧誘行為
    13. その他、当社が不適切と判断する行為

## 第5条（本アプリの提供の停止等）

1. 当社は、以下のいずれかの事由があると判断した場合、ユーザーに事前に通知することなく、
本アプリの全部または一部の提供を停止または中断することができるものとします。
    1. 本アプリにかかるコンピューター・システムの保守点検または更新を行う場合
    2. 地震、落雷、火災、停電または天災などの不可抗力により、本アプリの提供が困難となった場合
    3. コンピューターまたは通信回線等が事故により停止した場合
    4. その他、当社が本アプリの提供が困難と判断した場合
2. 当社は、本アプリの提供の停止または中断により、ユーザーまたは第三者が被った損害について、
いかなる責任も負わないものとします。

## 第6条(著作権）

1. ユーザーは、自ら著作権の必要な知的在債権を有するか、または必要な権利者の許諾を得た文章、
画像や映像等の投稿を行うことができるものとします。
2. ユーザーが本アプリを利用して投稿ないしアップロードした文章、画像や映像等の著作権については、
当該ユーザーその他既存の権利者に担保されるものとします。
3.前項本文の定めるものを除き，本サービスおよび本サービスに関連する一切の情報についての著作権
およびその他の知的財産権はすべて当社または当社にその利用を許諾した権利者に帰属し，
ユーザーは無断で複製，譲渡，貸与，翻訳，改変，転載，公衆送信（送信可能化を含みます。），
伝送，配布，出版，営業使用等をしてはならないものとします。

## 第7条（利用制限および登録抹消）

1. 当社は，ユーザーが以下のいずれかに該当する場合には，事前の通知なく，投稿データを削除し，
ユーザーに対して本サービスの全部もしくは一部の利用を制限しまたはユーザーとしての登録を抹消することができるものとします。
    1. 本規約のいずれかの条項に違反した場合
    2. 登録事項に虚偽の事実があることが判明した場合
    3. 決済手段として当該ユーザーが届け出たクレジットカードが利用停止となった場合
    4. 料金等の支払債務の不履行があった場合
    5. 当社からの連絡に対し，一定期間返答がない場合
    6. 本サービスについて，最終の利用から一定期間利用がない場合
    7. その他，当社が本サービスの利用を適当でないと判断した場合
2. 前項各号のいずれかに該当した場合，ユーザーは，当然に当社に対する一切の債務について期限の利益を失い，
その時点において負担する一切の債務を直ちに一括して弁済しなければなりません。
3. 当社は，本条に基づき当社が行った行為によりユーザーに生じた損害について，一切の責任を負いません。

## 第8条（退会）

ユーザーは，当社の定める退会手続により，本サービスから退会できるものとします。

## 第9条（保証の否認および免責事項）

1. 当社は，本サービスに事実上または法律上の瑕疵（安全性，信頼性，正確性，完全性，有効性，特定の目的への適合性，
セキュリティなどに関する欠陥，エラーやバグ，権利侵害などを含みます。）がないことを明示的にも黙示的にも保証しておりません。
2. 当社は，本サービスに起因してユーザーに生じたあらゆる損害について、当社の故意又は重過失による場合を除き、一切の責任を負いません。
ただし，本サービスに関する当社とユーザーとの間の契約（本規約を含みます。）が消費者契約法に定める消費者契約となる場合，
この免責規定は適用されません。
3. 前項ただし書に定める場合であっても，当社は，当社の過失（重過失を除きます。）による債務不履行または不法行為により
ユーザーに生じた損害のうち特別な事情から生じた損害（当社またはユーザーが損害発生につき予見し，または予見し得た場合を含みます。）
について一切の責任を負いません。また，当社の過失（重過失を除きます。）による債務不履行または不法行為によりユーザーに生じた
損害の賠償は，ユーザーから当該損害が発生した月に受領した利用料の額を上限とします。
4. 当社は，本サービスに関して，ユーザーと他のユーザーまたは第三者との間において生じた取引，連絡または紛争等について一切責任を負いません。

## 第10条（サービス内容の変更等）

当社は，ユーザーに通知することなく，本サービスの内容を変更しまたは本サービスの提供を中断することができるものとします。

## 第11条（利用規約の変更） 
1. 当社は以下の場合には、ユーザーの個別の同意を要せず、本規約を変更することができるものとします。
    2. 本規約の変更がユーザーの一般の利益に適合するとき。
    3. 本規約の変更が本サービス利用契約の目的に反せず、かつ、変更の必要性、変更後の内容の相当性その他の変更に係る事情に照らして合理的なものであるとき。
2. 当社はユーザーに対し、前項による本規約の変更にあたり、事前に、本規約を変更する旨及び変更後の本規約の内容並びに
その効力発生時期を通知します。

## 第12条（個人情報の取り扱い）

当社は，本サービスの利用によって取得する個人情報については，当社「プライバシーポリシー」に従い適切に取り扱うものとします。

## 第13条（通知または連絡）

ユーザーと当社との間の通知または連絡は，当社の定める方法によって行うものとします。当社は,ユーザーから,
当社が別途定める方式に従った変更届け出がない限り,現在登録されている連絡先が有効なものとみなして当該連絡先へ
通知または連絡を行い,これらは,発信時にユーザーへ到達したものとみなします。

## 第14条（権利義務の譲渡の禁止）

ユーザーは，当社の書面による事前の承諾なく，利用契約上の地位または本規約に基づく権利もしくは義務を第三者に譲渡し，
または担保に供することはできません。

## 第15条（準拠法・裁判管轄）

1. 本規約の解釈にあたっては，日本法を準拠法とします。
2. 本サービスに関して紛争が生じた場合には，当社の本店所在地を管轄する裁判所を専属的合意管轄とします。
''',
      ),
    );
  }
}

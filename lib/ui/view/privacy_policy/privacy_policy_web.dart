import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyWebPage extends StatefulWidget {
  const PrivacyPolicyWebPage({super.key});
  static String tag = 'privacy_policy_web';
  @override
  State<PrivacyPolicyWebPage> createState() => _PrivacyPolicyWebPageState();
}

class _PrivacyPolicyWebPageState extends State<PrivacyPolicyWebPage> {
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Theme.of(context).scaffoldBackgroundColor)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url
                .startsWith('https://yuyudevelop0203.wixsite.com/my-site')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://yuyudevelop0203.wixsite.com/my-site'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('プライバシーポリシー'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

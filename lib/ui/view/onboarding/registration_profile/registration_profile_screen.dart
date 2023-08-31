import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationProfileScreen extends HookConsumerWidget {
  const RegistrationProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'プロフィール登録',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        //登録ボタンを配置
        actions: [
          TextButton.icon(
            onPressed: () {},
            label: Text(
              '登録',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            icon: Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  //要素を中央に配置
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    const SizedBox(height: 20),
                    Text("プロフィール画像を設定してください(任意)"),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Icon(
                            Icons.account_circle_outlined,
                            size: 100,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.inverseSurface,
                            child: Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'ニックネーム(必須)',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ニックネームを入力してください';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: '学校名(必須)',
                        prefixIcon: Icon(Icons.school),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '学校名を入力してください';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: '学部名(必須)',
                        prefixIcon: Icon(Icons.school_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '学部名を入力してください';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: '学科名(必須)',
                        prefixIcon: Icon(Icons.school_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '学科名を入力してください';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: '学年(必須)',
                        prefixIcon: Icon(Icons.school_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '学年を入力してください';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

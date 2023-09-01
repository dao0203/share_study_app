import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/state/my_profile_state.dart';

class RegistrationProfileScreen extends HookConsumerWidget {
  RegistrationProfileScreen({super.key});
  final gradeList = [
    "学士1年",
    "学士2年",
    "学士3年",
    "学士4年",
    "修士1年",
    "修士2年",
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _myProfile = ref.watch(myProfileStateProvider);
    final myProfileState = useState(Profile());
    final _formKey = GlobalKey<FormState>();
    final nicknameController = useTextEditingController();
    final universityNameController = useTextEditingController();
    final facultyNameController = useTextEditingController();
    final departmentNameController = useTextEditingController();
    final gradeControler = useTextEditingController();
    final bioController = useTextEditingController();
    Logger().d("RegistrationProfileScreen");
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
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                myProfileState.value = myProfileState.value.copyWith(
                  nickname: nicknameController.text,
                  universityName: universityNameController.text,
                  facultyName: facultyNameController.text,
                  departmentName: departmentNameController.text,
                  grade: gradeControler.text,
                  bio: bioController.text,
                );
                showDialog(
                    barrierColor: Colors.white54,
                    context: context,
                    builder: (context) {
                      return const Center(
                          child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ));
                    });
                // 登録処理
                await ref
                    .watch(profileRepositoryProvider)
                    .updateProfile(myProfileState.value)
                    .then((value) {});
              }
            },
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
            child: _myProfile.when(
              data: (myProfile) {
                Logger().i(myProfile);
                myProfileState.value = myProfile;
                nicknameController.text = myProfile.nickname;
                universityNameController.text = myProfile.universityName ?? "";
                facultyNameController.text = myProfile.facultyName ?? "";
                departmentNameController.text = myProfile.departmentName ?? "";
                gradeControler.text = myProfile.grade ?? "";
                bioController.text = myProfile.bio ?? "";

                return SingleChildScrollView(
                  child: Column(
                    //要素を中央に配置
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      const SizedBox(height: 20),
                      const Text("プロフィール画像を設定してください(任意)"),
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              size: 100,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
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
                        controller: nicknameController,
                        decoration: const InputDecoration(
                          labelText: 'ニックネーム(必須)',
                          prefixIcon: Icon(Icons.person),
                        ),
                        maxLength: 20,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ニックネームを入力してください';
                          } else if (value.length > 20) {
                            return 'ニックネームは20文字以内で入力してください';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: universityNameController,
                        decoration: const InputDecoration(
                          labelText: '学校名(必須)',
                          prefixIcon: Icon(Icons.school),
                        ),
                        maxLength: 20,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '大学名を入力してください';
                          } else if (value.length > 20) {
                            return '大学名は20文字以内で入力してください';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: facultyNameController,
                        decoration: const InputDecoration(
                          labelText: '学部名(任意)',
                          prefixIcon: Icon(Icons.school_outlined),
                        ),
                        maxLength: 20,
                        validator: (value) {
                          if (value!.length > 20) {
                            return '学部名は20文字以内で入力してください';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: departmentNameController,
                        decoration: const InputDecoration(
                          labelText: '学科名(任意)',
                          prefixIcon: Icon(Icons.school_outlined),
                        ),
                        maxLength: 20,
                        validator: (value) {
                          if (value!.length > 20) {
                            return '学科名は20文字以内で入力してください';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: gradeControler,
                        decoration: const InputDecoration(
                          labelText: '学年(任意)',
                          prefixIcon: Icon(Icons.school_outlined),
                        ),
                        validator: (value) {
                          return null;
                        },
                        readOnly: true,
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  child: Column(
                                    children: [
                                      const Text("学年を選択してください"),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: gradeList.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              title: Text(gradeList[index]),
                                              onTap: () {
                                                gradeControler.text =
                                                    gradeList[index];
                                                Navigator.pop(context);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: bioController,
                        decoration: const InputDecoration(
                          labelText: '自己紹介(任意)',
                          prefixIcon: Icon(Icons.person),
                        ),
                        maxLength: 200,
                        validator: (value) {
                          if (value!.length > 200) {
                            return '自己紹介は100文字以内で入力してください';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) {
                Logger().e({error, stackTrace});
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'プロフィールの取得に失敗しました',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //画面を再取得
                          ref.refresh(myProfileStateProvider);
                        },
                        child: Text(
                          '再取得',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              loading: () {
                Logger().i("loading");
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      Text(
                        'プロフィールを取得中...',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
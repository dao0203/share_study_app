import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/state/activity_profile_state.dart';
import 'package:share_study_app/ui/state/my_profile_state.dart';
import 'package:share_study_app/util/image_picker_app.dart';

class ProfileUpdateScreen extends HookConsumerWidget {
  ProfileUpdateScreen({super.key, required this.profile});
  final Profile profile;
  final gradeList = [
    '学士1年',
    '学士2年',
    '学士3年',
    '学士4年',
    '修士1年',
    '修士2年',
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePickerApp = ref.watch(imagePickerAppProvider);
    final myProfileState = useState(Profile(
      id: profile.id,
      nickname: '',
      universityName: '',
      departmentName: '',
      facultyName: '',
      grade: '',
      bio: '',
    ));
    final isEmptyField = useState(
      profile.nickname.isEmpty || profile.universityName.isEmpty,
    );
    final nicknameController = useTextEditingController(text: profile.nickname);
    final universityNameController =
        useTextEditingController(text: profile.universityName);
    final facultyNameController =
        useTextEditingController(text: profile.facultyName);
    final departmentNameController =
        useTextEditingController(text: profile.departmentName);
    final gradeControler = useTextEditingController(text: profile.grade);
    final bioController = useTextEditingController(text: profile.bio);
    final xFile = useState<XFile?>(null);
    final isLoading = useState(false);
    useEffect(() {
      nicknameController.addListener(() {
        isEmptyField.value = nicknameController.text.isEmpty ||
            universityNameController.text.isEmpty;
      });
      universityNameController.addListener(() {
        isEmptyField.value = nicknameController.text.isEmpty ||
            universityNameController.text.isEmpty;
      });
      return null;
    }, [
      nicknameController,
      universityNameController,
    ]);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('編集'),
        actions: [
          TextButton.icon(
            onPressed: isEmptyField.value
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    isLoading.value = true;
                    ref
                        .read(profileRepositoryProvider)
                        .updateProfile(
                          myProfileState.value.copyWith(
                            nickname: nicknameController.text,
                            universityName: universityNameController.text,
                            facultyName: facultyNameController.text,
                            departmentName: departmentNameController.text,
                            grade: gradeControler.text,
                            bio: bioController.text,
                          ),
                          xFile.value?.path,
                        )
                        .then((value) {
                      isLoading.value = false;
                      Navigator.of(context).pop();
                      // ignore: unused_result
                      ref.refresh(myProfileStateProvider);
                      return ref
                          .refresh(activityProfileStateProvider(profile.id));
                    }).catchError((e) {
                      isLoading.value = false;
                      //TODO: あとでエラーのスナックバーを表示する
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    });
                  },
            icon: Icon(
              Icons.check,
              color: isEmptyField.value
                  ? Theme.of(context).colorScheme.onSurface.withOpacity(0.5)
                  : Theme.of(context).colorScheme.onSurface,
            ),
            label: Text(
              '保存',
              style: TextStyle(
                color: isEmptyField.value
                    ? Theme.of(context).colorScheme.onSurface.withOpacity(0.5)
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          isLoading.value
              ? Positioned.fill(
                  child: Container(
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.5),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await imagePickerApp
                                .pickImageFromGallery()
                                .then((value) {
                              xFile.value = value;
                            });
                          },
                          child: xFile.value == null
                              ? profile.imageUrl == null
                                  ? Icon(
                                      Icons.account_circle_outlined,
                                      size: 100,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    )
                                  : CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                        profile.imageUrl!,
                                      ),
                                    )
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundImage: FileImage(
                                    File(xFile.value!.path),
                                  ),
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: xFile.value == null
                                ? IconButton(
                                    onPressed: () async {
                                      await imagePickerApp
                                          .pickImageFromGallery()
                                          .then(
                                        (value) {
                                          xFile.value = value;
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      xFile.value = null;
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nicknameController,
                    decoration: const InputDecoration(
                      labelText: 'ニックネーム(必須)',
                      prefixIcon: Icon(Icons.person),
                    ),
                    maxLength: 20,
                  ),
                  TextField(
                    controller: universityNameController,
                    decoration: const InputDecoration(
                      labelText: '大学名(必須)',
                      prefixIcon: Icon(Icons.school),
                    ),
                    maxLength: 20,
                  ),
                  TextField(
                    controller: facultyNameController,
                    decoration: const InputDecoration(
                      labelText: '学部名',
                      prefixIcon: Icon(Icons.school),
                    ),
                    maxLength: 20,
                  ),
                  TextField(
                    controller: departmentNameController,
                    decoration: const InputDecoration(
                      labelText: '学科名',
                      prefixIcon: Icon(Icons.school),
                    ),
                    maxLength: 20,
                  ),
                  TextField(
                    controller: gradeControler,
                    decoration: const InputDecoration(
                      labelText: '学年',
                      prefixIcon: Icon(Icons.school),
                    ),
                    maxLength: 20,
                    readOnly: true,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: ListView.builder(
                              itemCount: gradeList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(gradeList[index]),
                                  onTap: () {
                                    gradeControler.text = gradeList[index];
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                  TextField(
                    controller: bioController,
                    decoration: const InputDecoration(
                      labelText: '自己紹介',
                      prefixIcon: Icon(Icons.person),
                    ),
                    maxLength: 100,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firestoreVersionsProvider = Provider<DocumentReference>(
    (ref) => FirebaseFirestore.instance.collection("versions").doc("1"));

final firestoreYearsProvider = Provider<DocumentReference>((ref) =>
    ref.watch(firestoreVersionsProvider).collection("years").doc("2023"));

final firestoreAnswerssProvider = Provider<CollectionReference>(
    (ref) => ref.watch(firestoreVersionsProvider).collection("answers"));

final firestoreQuestionsProvider = Provider<CollectionReference>(
    (ref) => ref.watch(firestoreVersionsProvider).collection("questions"));

final firestoreSubjectsProvider = Provider<CollectionReference>(
    (ref) => ref.watch(firestoreYearsProvider).collection("subjects"));

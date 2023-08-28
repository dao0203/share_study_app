import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final versionsCollectionRefProvider = Provider<DocumentReference>(
    (ref) => FirebaseFirestore.instance.collection("versions").doc("1"));

final yearsCollectionRefProvider = Provider<DocumentReference>((ref) =>
    ref.watch(versionsCollectionRefProvider).collection("years").doc("2023"));

final answersCollectionRefProvider = Provider<CollectionReference>(
    (ref) => ref.watch(versionsCollectionRefProvider).collection("answers"));

final questionsCollectionRefProvider = Provider<CollectionReference>(
    (ref) => ref.watch(versionsCollectionRefProvider).collection("questions"));

final subjectsCollectionRefProvider = Provider<CollectionReference>(
    (ref) => ref.watch(yearsCollectionRefProvider).collection("subjects"));

/**
 * FirestoreApの関数を集約するファイル
 * 
 * @author 佐藤佑哉
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/question_data.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreApi {
  CollectionReference user = firestore.collection("");
}

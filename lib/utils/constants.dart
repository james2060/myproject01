import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myproject01/controller/auth_controller.dart';
import 'package:uuid/uuid.dart';

final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;



void showAlert(String message) {
  //Fluttertoast.showToast(msg: message);
}

String generateId() {
  return const Uuid().v1();
}

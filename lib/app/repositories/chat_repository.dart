import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatRepository {
//  User _userFromFirebaseUser(User user) {
//    return user != null ? User(uid: user.uid) : null;
//  }

  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  getUserInfo(String token) async {
    return FirebaseFirestore.instance.collection("users").where("token", isEqualTo: token).get().catchError((e) {
      print(e.toString());
    });
  }

  searchByName(String searchField) {
    return FirebaseFirestore.instance.collection("users").where('userName', isEqualTo: searchField).get();
  }

  Future<void> updateMessage(String messageId, Map<String, dynamic> message) {
    return FirebaseFirestore.instance.collection("messages").doc(messageId).update(message).catchError((e) {
      print(e.toString());
    });
  }

  Future<String> uploadFile(File _imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(_imageFile);
    return uploadTask.then((TaskSnapshot storageTaskSnapshot) {
      return storageTaskSnapshot.ref.getDownloadURL();
    }, onError: (e) {
      throw Exception(e.toString());
    });
  }
}

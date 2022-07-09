import 'package:cloud_firestore/cloud_firestore.dart';

const String USER_COLLECTION = "users";
const String JOURNAL_COLLECTION = "Journals";
const String TODOLIST_COLLECTION = "Todo";
const String PET_COLLECTION = "Pets";
const String GAME_COLLECTION = "Game";

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService() {}

  Future<DocumentSnapshot> getUser(String _uid) async {
    return await _db.collection(USER_COLLECTION).doc(_uid).get();
  }
}

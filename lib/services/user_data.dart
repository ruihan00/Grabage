import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:nobeans/screens/flow_register_screen.dart';

abstract class UserBase {
  Future<User> createNewUser(
      final String id,
      final String email,
      final String name,
      );

  Future<User> updateUser(
      final bool online,
      final String id,
      final String email,
      final String firstName,
      final String fastName,
      final String userGender,
      final String userBdate,
      final List<String> userReferral,
      final List<String> userGrow,
      final String accountType,
      final bool isFacil,
      final bool isWork,
      final bool isRelationship,
      final bool isConfidence,
      final bool isMood,

      final String growthkillerEquivalents,
      final bool isStress,
      final bool isUncertainty,
      final bool isSelfDoubt,

      final String location,
      final double individually,
      final double interpersonally,
      final double socially,
      final double overall,
      final DateTime lastActive,
      final String photoURL,
      );
}

class UserData implements UserBase {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  // online : true,
  //                   email : user.email,
  //                   displayName : user.displayName,
  //                   photoURL: user.photoURL,
  //                   firstname: user.displayName,
  //                   lastname: '',
  //                   gender: '',
  //                   accountType: "google",
  //                   referral: [],
  //                   grow: [],
  //                   last_active : timestamp.fromDate(new Date()),
  //                   uid:  user.uid

  @override
  Future<User> createNewUser(
      String id,
      String email,
      String name) async {
    await _firebaseFirestore.collection("users").doc(id).set({
      "email": email,
      "name": name,
    });
    return _firebaseAuth.currentUser!;
  }

  @override
  Future<User> updateUser(
      bool online,
      String id,
      String email,
      String firstName,
      String lastName,
      String userGender,
      String userBdate,
      List userReferral,
      List userGrow,
      String accountType,
      bool isFacil,
      bool isWork,
      bool isRelationship,
      bool isConfidence,
      bool isMood,
      String growthkillerEquivalents,
      bool isStress,
      bool isUncertainty,
      bool isSelfDoubt,
      String location,
      double individually,
      double interpersonally,
      double socially,
      double overall,
      DateTime? lastActive,
      String? photoURL) async {
    await _firebaseFirestore.collection("users").doc(id).update({
      "online": online,
      'uid': id,
      'email': email,
      'firstname': firstName,
      'lastname': lastName,
      'gender': userGender,
      'age': userBdate,
      'referral': userReferral,
      'grow': userGrow,
      'accountType': accountType,
      "isFacil": isFacil,
      "isWork": isWork,
      "isRelationship": isRelationship,
      "isConfidence": isConfidence,
      "isMood": isMood,
      "growthkillerEquivalents": growthkillerEquivalents,
      "isStress": isStress,
      "isUncertainty": isUncertainty,
      "isSelfDoubt": isSelfDoubt,
      "location": location,
      "individually": individually,
      "interpersonally": interpersonally,
      "socially": socially,
      "overall": overall,
      "last_active": lastActive,
      "photoURL": photoURL,
    });
    return _firebaseAuth.currentUser!;
  }

  Future<bool> usernameCheck(String username) async {
    final result = await _firebaseFirestore
        .collection('users')
        .where('email', isEqualTo: username)
        .get();
    return result.docs.isEmpty;
  }

  Future<List> getUser(String email) async {
    var items = [];

    await _firebaseFirestore
        .collection("users")
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach(
        // add data to your list
            (f) {
          items.insert(0, f.data());
        },
      );
    });
    return items;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    return await _firebaseFirestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid) //is this ok lol
        .get();
  }

  Future<void> createUserViaSocial(String userUid, String email,
      String displayName, String SocialSource) async {
    // await createNewUser(false, userUid, email, displayName, '', '', '', [], [],
    //     SocialSource, DateTime.now().toUtc(), '');
  }

  Future<void> updateUserViaSocial(
      bool? online,
      String userUid,
      String email,
      String firstName,
      String lastName,
      String userGender,
      String userBdate,
      List userRefferal,
      List userGrow,
      String SocialSource,
      DateTime? lastActive,
      String? photoURL,
      ) async {
    // await updateUser(
    //   online,
    //   userUid,
    //   email,
    //   firstName,
    //   lastName,
    //   userGender,
    //   userBdate,
    //   userRefferal,
    //   userGrow,
    //   SocialSource,
    //   lastActive,
    //   photoURL,
    // );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User get currentUser;
  Stream<User?> authStateChanges();
  Future<User> signInAnonymously();
  Future<User> createNewUserWithEmailAndPassword(String email, String password);
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<User> signInLinkedIn(Object user);
  Future<void> forgotPasswordResetEmail(String email);
  Future<bool> checkIfMethodsForEmail(String email);
  Future<void> signOut();
}

class Auth implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User get currentUser => _firebaseAuth.currentUser as User;

  @override
  Future<User> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user as Future<User>;
  }

  @override
  Future<bool> checkIfMethodsForEmail(String email) async {
    final method = await _firebaseAuth.fetchSignInMethodsForEmail(email);
    if (method.contains('google.com')) {
      return true;
    } else if (method.contains('facebook.com')) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user!;
  }

  @override
  Future<User> createNewUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!;
  }

  @override
  Future forgotPasswordResetEmail(email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email.trim());
  }

  @override
  Future<User> signInLinkedIn(user) async {
    return user as Future<User>;
  }

  @override
  Future<void> signOut() async {
    final _firebaseFirestore = FirebaseFirestore.instance;
    await _firebaseFirestore.collection("users").doc(_firebaseAuth.currentUser?.uid).update({"online" : false});
    await _firebaseAuth.signOut();
  }

  @override
  Future<User> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<User> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}

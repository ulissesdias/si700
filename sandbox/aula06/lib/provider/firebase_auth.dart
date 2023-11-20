import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationProvider {
  FirebaseAuth _auth = FirebaseAuth.instance;

  get stream {
    return _auth.authStateChanges().map((User? event) => event?.email);
  }

  createUserWithEmailandPassword(email, password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  signInWithEmailAndPassword(email, password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  signOut() async {
    await _auth.signOut();
  }
}

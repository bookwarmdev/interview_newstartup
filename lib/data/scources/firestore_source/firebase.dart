import 'package:firebase_auth/firebase_auth.dart';

class Firebase {
  String registerMessage = '';
  String loginMessage = '';

  User? user = FirebaseAuth.instance.currentUser;

  late UserCredential userCredential;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> register(
      {required String email, required String password}) async {
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return registerMessage = 'Successful';
    } on FirebaseAuthException catch (e) {
      registerMessage = e.message.toString();
    } catch (e) {
      print(e);
    }
    return registerMessage;
  }

  Future<String> login(
      {required String email, required String password}) async {
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      loginMessage = 'Successful Login Details';
    } on FirebaseAuthException catch (e) {
      loginMessage = e.message.toString();
    }
    return loginMessage;
  }

  signOut() async {
    await auth.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        DocumentSnapshot snapshot =
            await _firestore.collection('users').doc(user.uid).get();
        if (snapshot.exists) {
          return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
        }
      }
    } catch (e) {
      print('Error signing in: $e');
    }
    return null;
  }

  Future<UserModel?> signUpWithEmail(
    String email,
    String password,
    String firstName,
    String lastName,
    String phone,
    String address,
    String nodeAddress,
    String profilePicURL,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        UserModel newUser = UserModel(
          uid: user.uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
          address: address,
          nodeAddress: nodeAddress,
          profilePicURL: profilePicURL,
        );
        await _firestore.collection('users').doc(user.uid).set(newUser.toMap());
        return newUser;
      }
    } catch (e) {
      print('Error signing up: $e');
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

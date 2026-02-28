import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/features/auth/data/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<String> createUser(String email, String password,String name) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      try {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(credential.user!.uid)
            .set({
          "email": email,
          "name": name,
          "id": credential.user!.uid
        });
      } catch (e) {
        print("Firestore Error: $e");
        return "Firestore Error: $e";
      }

      await credential.user?.sendEmailVerification();
      return "200";

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email";
      }
      return e.message ?? "Firebase Auth Error";
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<Either<String, User?>> login(String email, String password,String name) async {
    try{
      final credential = await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: email, password: password);

      if (credential.user ==null){
        return Left("User not Found");
      }
      return Right(credential.user);
    }catch(e){
      return Left(e.toString());
    }

  }

}
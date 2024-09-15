
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  

  Future<Either<String, UserCredential>> signInWithFacebook();

  Future<Either> getUser();
}
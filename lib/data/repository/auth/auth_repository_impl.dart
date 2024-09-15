
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/repository/auth/auth.dart';
import '../../../service_locator.dart';
import '../../sources/auth/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository {

  
 @override
  Future<Either<String, UserCredential>> signInWithFacebook() async {
    return await sl<AuthFirebaseService>().signInWithFacebook();
  }
  
  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }
  
}
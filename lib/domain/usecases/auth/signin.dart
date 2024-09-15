import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class SigninUseCase implements UseCase<Either<String, UserCredential>, dynamic> {

   @override
  Future<Either<String, UserCredential>> call({params}) async {
    return sl<AuthRepository>().signInWithFacebook();
  }

}
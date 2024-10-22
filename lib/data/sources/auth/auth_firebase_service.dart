
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../core/configs/constants/app_urls.dart';
import '../../../domain/entities/auth/user.dart';
import '../../models/auth/user.dart';

abstract class AuthFirebaseService {

  Future<Either<String, UserCredential>> signInWithFacebook();
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  
  @override
  Future < Either > getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore.collection('Users').doc(
        firebaseAuth.currentUser?.uid
      ).get();

      UserModel userModel = UserModel.fromJson(user.data() !);
      userModel.imageURL = firebaseAuth.currentUser?.photoURL ?? AppURLs.defaultImage;
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return const Left('An error occurred');
    }
  }

   @override
  Future<Either<String, UserCredential>> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['email','public_profile','user_posts']);
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      final AccessToken? accessToken = await FacebookAuth.instance.accessToken;

      
      var user = userCredential.user;

      // Store user data in Firestore
      await FirebaseFirestore.instance.collection('Users').doc(user?.uid).set({
        'name': user?.displayName,
        'email': user?.email,
        'photoURL': user?.photoURL,
      });

      return Right(userCredential);
    } catch (e) {
      return Left('An error occurred during Facebook Signin $e');

    }
  }

  
}
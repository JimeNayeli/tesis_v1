import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class HomePage extends StatelessWidget {
  final String displayName;
  //final AccessToken? result = await FacebookAuth.instance.accessToken;
  //final token = result?.tokenString; // Aquí está el token de acceso

  const HomePage({Key? key, required this.displayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $displayName'), // Display user's name in the app bar
      ),
      body: Center(
        child: Text(
          'Hello, $displayName!', // Greet the user
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}






import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesis_v1/common/helpers/is_dark_mode.dart';
import 'package:tesis_v1/common/widgets/appbar/app_bar.dart';
import 'package:tesis_v1/core/configs/assets/app_vectors.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../domain/usecases/auth/signin.dart';
import '../../../service_locator.dart';
import '../../home/pages/home_page.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Facebook Sign-in Button
            const BasicAppbar(),
            const SizedBox(height: 100,),
            SvgPicture.asset(
              AppVectors.facebook,
              height: 100,
            ),
            const SizedBox(height: 100,),
            Text(
                'Agradecemos tu participacion, requerimos tu acceso mediante tu cuenta de facebook',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: context.isDarkMode ? Colors.white : Colors.black
                ),
            ),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SigninUseCase>().call();
                result.fold(
                  (l) {
                    var snackbar = SnackBar(
                      content: Text(l),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                  (r) {
                    var user = FirebaseAuth.instance.currentUser;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>  HomePage(displayName: user?.displayName ?? 'User'),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              title: 'Ingresar con Facebook',                 
            ),
          ],
        ),
      ),
    );
  }

}

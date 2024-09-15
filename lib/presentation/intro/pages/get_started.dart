
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesis_v1/common/widgets/button/basic_app_button.dart';
import 'package:tesis_v1/core/configs/assets/app_images.dart';
import 'package:tesis_v1/core/configs/assets/app_vectors.dart';
import 'package:tesis_v1/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget{
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
            horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.introBG,
                )
              ) 
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                    AppVectors.logo,
                  ),
                ),
                  
                const Spacer(),
                const Text(
                  'Bienvenido a la aplicación',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 21,),
                  const Text(
                    'Tesis v1',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black26,
                      fontSize: 13
                    ),
                    textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20,),
                    BasicAppButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const ChooseModePage()
                            )
                          );                      
                      },
                      title: 'Empecemos')
                ],
              ),
          ),

        ],
      ),
    );
  }

}
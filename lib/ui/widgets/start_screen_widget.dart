import 'package:flutter/material.dart';

class StartScreenWidget extends StatelessWidget {
  const StartScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      fit: StackFit.expand,
      children: <Widget>[
        const Image(
          image: AssetImage('assets/images/background_image.png'),
        ),
        Column(
          children: const [
            SizedBox(height: 33),
            Image(
              image: AssetImage('assets/images/text_image.png'),
            ),
            SizedBox(height: 50),
            Image(
              image: AssetImage('assets/images/home_screen_image_3.png'),
            ),
          ],
        ),
      ],
    );
  }
}

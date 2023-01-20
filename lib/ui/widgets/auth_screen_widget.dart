import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/gen/fonts.gen.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: ColorTheme.voilet),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Image(
              image: AssetImage('assets/images/text_image.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  filled: true,
                  fillColor: ColorTheme.grey,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
                    child: SvgPicture.asset(
                      Assets.icons.userIcon.path,
                      color: ColorTheme.white100,
                    ),
                  ),
                  hintText: 'Login',
                  hintStyle: const TextStyle(
                      fontFamily: FontFamily.roboto,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: ColorTheme.white100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

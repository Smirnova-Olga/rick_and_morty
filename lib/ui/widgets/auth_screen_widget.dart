import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:rick_and_morty/theme/app_text_theme.dart';

class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: ColorTheme.voilet),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 50),
              BackgroundImageWidget(),
              TextWidget(text: 'Login'),
              SizedBox(height: 10),
              TextFieldWidget(
                isLoginText: true,
              ),
              SizedBox(height: 10),
              TextWidget(text: 'Password'),
              SizedBox(height: 10),
              TextFieldWidget(
                isLoginText: false,
              ),
              SizedBox(height: 25),
              ButtonLoginWidget(),
              SizedBox(height: 20),
              NewAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage('assets/images/text_image.png'),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextTheme.body2.copyWith(
        color: ColorTheme.white000,
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final bool isLoginText;

  const TextFieldWidget({
    Key? key,
    required this.isLoginText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.left,
      obscureText: isLoginText ? false : true,
      obscuringCharacter: '•',
      style: TextStyle(
        color: ColorTheme.white000,
        fontWeight: isLoginText ? FontWeight.w400 : FontWeight.w900,
        letterSpacing: isLoginText ? 1 : 5,
      ),
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
          padding: const EdgeInsets.fromLTRB(16, 12, 20, 12),
          child: SvgPicture.asset(
            isLoginText
                ? Assets.icons.userIcon.path
                : Assets.icons.passwordIcon.path,
            color: ColorTheme.white100,
          ),
        ),
        hintText: isLoginText ? 'Login' : 'Password',
        hintStyle: AppTextTheme.body1.copyWith(color: ColorTheme.white100),
      ),
    );
  }
}

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: ColorTheme.blue,
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Login',
          style: AppTextTheme.subtitle1.copyWith(
            color: ColorTheme.white000,
          ),
        ),
      ),
    );
  }
}

class NewAccountWidget extends StatelessWidget {
  const NewAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account yet?",
          style: AppTextTheme.body2.copyWith(color: ColorTheme.white100),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Login',
              style: TextStyle(color: ColorTheme.green),
            ))
      ],
    );
  }
}

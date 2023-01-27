import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/theme/app_text_theme.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:rick_and_morty/ui/screens/auth/auth_screen_widget.dart';
import 'package:rick_and_morty/ui/screens/home/home_screen.dart';

class CreateAccountWidget extends StatelessWidget {
  const CreateAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const _BackButtonWidget(),
        leadingWidth: 90,
        backgroundColor: ColorTheme.voilet,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(color: ColorTheme.voilet),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Create account',
                  style: AppTextTheme.headline7
                      .copyWith(color: ColorTheme.white000),
                ),
              ),
              const _HelpTextWidget(text: 'Name'),
              const _CreateAccountTextFieldWidget(
                hintText: 'Name',
              ),
              const _HelpTextWidget(text: 'Surname'),
              const _CreateAccountTextFieldWidget(
                hintText: 'Surname',
              ),
              const _DividerWidget(),
              const _HelpTextWidget(text: 'Username'),
              const TextFieldWidget(isLoginText: true),
              const _HelpTextWidget(text: 'Password'),
              const TextFieldWidget(isLoginText: false),
              const _ButtonLoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackButtonWidget extends StatelessWidget {
  const _BackButtonWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset(
          Assets.icons.back.path,
          color: ColorTheme.white000,
        ),
      ),
    );
  }
}

class _HelpTextWidget extends StatelessWidget {
  final String text;
  const _HelpTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: AppTextTheme.body2.copyWith(
          color: ColorTheme.white000,
        ),
      ),
    );
  }
}

class _CreateAccountTextFieldWidget extends StatelessWidget {
  final String hintText;

  const _CreateAccountTextFieldWidget({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: ColorTheme.white000,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
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
          hintText: hintText,
          hintStyle: AppTextTheme.body1.copyWith(color: ColorTheme.white100),
        ));
  }
}

class _DividerWidget extends StatelessWidget {
  const _DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 1.5,
        color: ColorTheme.grey,
      ),
    );
  }
}

class _ButtonLoginWidget extends StatelessWidget {
  const _ButtonLoginWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 65),
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: ColorTheme.blue900,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            'Create',
            style: AppTextTheme.subtitle1.copyWith(
              color: ColorTheme.white000,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/app_global_widgets/button_widget.dart';
import 'package:rick_and_morty/app_global_widgets/devider_widget.dart';
import 'package:rick_and_morty/app_global_widgets/text_field_widget.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
import 'package:rick_and_morty/parts/home/home_part.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    final style = AppTextTheme.headline7.copyWith(color: ColorTheme.white100);
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
                  locale.createAccount,
                  style: style,
                ),
              ),
              _HelpTextWidget(text: locale.name),
              _CreateAccountTextFieldWidget(
                hintText: locale.name,
              ),
              _HelpTextWidget(text: locale.surname),
              _CreateAccountTextFieldWidget(
                hintText: locale.surname,
              ),
              const DividerWidget(),
              _HelpTextWidget(text: locale.username),
              const TextFieldWidget(isPassword: false),
              _HelpTextWidget(text: locale.password),
              const TextFieldWidget(isPassword: true),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 65),
                child: ButtonWidget(
                  text: locale.create,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                ),
              ),
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

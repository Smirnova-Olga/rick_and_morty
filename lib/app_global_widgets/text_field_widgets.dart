import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    required this.emailTextInputController,
    required this.locale,
  });

  final TextEditingController emailTextInputController;
  final AppLocalizations locale;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      style: const TextStyle(color: ColorTheme.white100Dark),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      controller: emailTextInputController,
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? locale.enterValidEmail
          : null,
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
        fillColor: ColorTheme.greyDark,
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 20, 12),
          child: SvgPicture.asset(
            Assets.icons.userIcon.path,
            color: ColorTheme.white100Dark,
          ),
        ),
        hintText: locale.username,
        hintStyle: AppTextTheme.body2.copyWith(color: ColorTheme.white100Dark),
      ),
    );
  }
}

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.passwordTextInputController,
    required this.locale,
  });

  final TextEditingController passwordTextInputController;
  final AppLocalizations locale;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isObscure = true;

  void togglePasswordView() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      style: const TextStyle(color: ColorTheme.white100Dark),
      autocorrect: false,
      controller: widget.passwordTextInputController,
      obscureText: _isObscure,
      obscuringCharacter: '•',
      validator: (value) => value != null && value.length < 6
          ? widget.locale.minimumCharacters
          : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
        fillColor: ColorTheme.greyDark,
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 20, 12),
          child: SvgPicture.asset(
            Assets.icons.passwordIcon.path,
            color: ColorTheme.white100Dark,
          ),
        ),
        hintText: widget.locale.password,
        hintStyle: AppTextTheme.body2.copyWith(color: ColorTheme.white100Dark),
        suffixIcon: IconButton(
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
          color: ColorTheme.white100Dark,
          onPressed: () {
            togglePasswordView();
          },
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController textInputController;

  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.textInputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: ColorTheme.white100Dark,
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
          fillColor: ColorTheme.greyDark,
          hintText: hintText,
          hintStyle:
              AppTextTheme.body1.copyWith(color: ColorTheme.white100Dark),
        ));
  }
}

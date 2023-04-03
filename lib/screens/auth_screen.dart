// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/app_global_widgets/button_widget.dart';
import 'package:rick_and_morty/app_global_widgets/text_field_widget.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/screens/create_account_screen.dart';
import 'package:rick_and_morty/services/snack_bar_service.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isObscure = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  Future<void> login() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        SnackBarService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
        return;
      }
    }

    navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  Future<String?> _showDialogMessage(BuildContext context) {
    final locale = context.l10n;
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        actionsPadding: const EdgeInsets.all(30),
        backgroundColor: ColorTheme.blue700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: Text(locale.error),
        titlePadding: const EdgeInsets.all(30),
        titleTextStyle:
            AppTextTheme.headline6.copyWith(color: ColorTheme.white000),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(locale.incorrectData),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        contentTextStyle:
            AppTextTheme.body2.copyWith(color: ColorTheme.white000),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: const BorderSide(color: ColorTheme.blue900),
              ),
            ),
            onPressed: () => Navigator.pop(context, locale.ok),
            child: Text(
              locale.ok,
              style: AppTextTheme.subtitle1.copyWith(color: ColorTheme.blue900),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    final style = AppTextTheme.body2.copyWith(color: ColorTheme.white000);
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: ColorTheme.voilet),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const _BackgroundImageWidget(),
              Text(locale.username, style: style),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: emailTextInputController,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Введите правильный Email'
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
                  fillColor: ColorTheme.grey,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 20, 12),
                    child: SvgPicture.asset(
                      Assets.icons.userIcon.path,
                      color: ColorTheme.white100,
                    ),
                  ),
                  hintText: locale.username,
                  hintStyle: style.copyWith(color: ColorTheme.white100),
                ),
              ),
              const SizedBox(height: 10),
              Text(locale.password, style: style),
              const SizedBox(height: 10),
              TextFormField(
                autocorrect: false,
                controller: passwordTextInputController,
                obscureText: true,
                obscuringCharacter: '•',
                validator: (value) => value != null && value.length < 6
                    ? 'Минимум 6 символов'
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
                  fillColor: ColorTheme.grey,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 20, 12),
                    child: SvgPicture.asset(
                      Assets.icons.passwordIcon.path,
                      color: ColorTheme.white100,
                    ),
                  ),
                  hintText: locale.password,
                  hintStyle: style.copyWith(color: ColorTheme.white100),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    color: ColorTheme.white000,
                    onPressed: () {
                      togglePasswordView();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ButtonWidget(
                text: locale.login,
                onPressed: login,
              ),
              const SizedBox(height: 20),
              const _NewAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackgroundImageWidget extends StatelessWidget {
  const _BackgroundImageWidget({
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

class _NewAccountWidget extends StatelessWidget {
  const _NewAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    final style = AppTextTheme.body2.copyWith(color: ColorTheme.white100);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          locale.doNotHaveAnAccountYet,
          style: style,
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateAccountScreen()),
              );
            },
            child: Text(
              locale.create,
              style: style.copyWith(color: ColorTheme.green),
            ))
      ],
    );
  }
}

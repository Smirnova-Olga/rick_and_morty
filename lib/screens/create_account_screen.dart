import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/app_global_widgets/button_widget.dart';
import 'package:rick_and_morty/app_global_widgets/devider_widget.dart';
import 'package:rick_and_morty/app_global_widgets/text_field_widget.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/services/snack_bar_service.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
import 'package:rick_and_morty/parts/home/home_part.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isObscure = true;
  TextEditingController nameInputController = TextEditingController();
  TextEditingController surnameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController passwordRepeatInputController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailInputController.dispose();
    passwordInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  Future<void> signUp() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    if (passwordInputController.text != passwordRepeatInputController.text) {
      SnackBarService.showSnackBar(
        context,
        'Пароли должны совпадать',
        true,
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailInputController.text.trim(),
        password: passwordInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'email-already-in-use') {
        SnackBarService.showSnackBar(
          context,
          'Такой Email уже используется, повторите попытку с использованием другого Email',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
      }
    }

    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

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
              TextFieldWidget(
                hintText: locale.name,
                textInputController: nameInputController,
              ),
              _HelpTextWidget(text: locale.surname),
              TextFieldWidget(
                hintText: locale.surname,
                textInputController: surnameInputController,
              ),
              const DividerWidget(),
              _HelpTextWidget(text: locale.username),
              EmailFormField(
                  emailTextInputController: emailInputController,
                  locale: locale,
                  style: style),
              _HelpTextWidget(text: locale.password),
              PasswordFormField(
                  passwordTextInputController: passwordInputController,
                  locale: locale,
                  style: style),
              PasswordFormField(
                  passwordTextInputController: passwordRepeatInputController,
                  locale: locale,
                  style: style),
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

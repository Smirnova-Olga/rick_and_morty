// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rick_and_morty/app_global_widgets/button_widget.dart';
import 'package:rick_and_morty/app_global_widgets/text_field_widget.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/screens/create_account_screen.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
              TextFieldWidget(
                isPassword: false,
                text: locale.username,
              ),
              const SizedBox(height: 10),
              Text(locale.password, style: style),
              const SizedBox(height: 10),
              TextFieldWidget(
                isPassword: true,
                text: locale.password,
              ),
              const SizedBox(height: 30),
              ButtonWidget(
                text: locale.login,
                onPressed: () => _showDialogMessage(context),
              ),
              const SizedBox(height: 20),
              const NewAccountWidget(),
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

class NewAccountWidget extends StatelessWidget {
  const NewAccountWidget({
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

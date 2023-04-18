// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty/app_global_widgets/button_widget.dart';
import 'package:rick_and_morty/app_global_widgets/devider_widget.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/parts/auth/bloc/auth_bloc.dart';
import 'package:rick_and_morty/screens/auth_screen.dart';
import 'package:rick_and_morty/services/snack_bar_service.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isDarkMode = false;

  void _toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.backgroundDark,
      ),
      backgroundColor: ColorTheme.backgroundDark,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipOval(
                        child: Image.asset('assets/images/morty_smith.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Oleg Belotserkovsky',
                            style: AppTextTheme.subtitle1
                                .copyWith(color: ColorTheme.white000ForDark),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Rick',
                            style: AppTextTheme.subtitle1
                                .copyWith(color: ColorTheme.white100Dark),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ButtonWidget(
                    onPressed: () {},
                    text: locale.edit,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: DividerWidget(),
                ),
                _RowWithButton(
                  rowTitle: locale.design,
                  icon: const Icon(
                    Icons.palette_outlined,
                    color: ColorTheme.white000ForDark,
                    size: 35,
                  ),
                  title: locale.darkTheme,
                  widget: CupertinoSwitch(
                    value: isDarkMode,
                    onChanged: _toggleTheme,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: DividerWidget(),
                ),
                _RowWithButton(
                  rowTitle: locale.language,
                  icon: const Icon(
                    Icons.language,
                    color: ColorTheme.white000ForDark,
                    size: 35,
                  ),
                  title: 'Español',
                  widget: Container(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: DividerWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ButtonWidget(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _logout(context);
                      } else {
                        SnackBarService.showDialogMessage(
                          context,
                          locale.unknownError,
                        );
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthScreen()),
                      );
                    },
                    text: 'logout',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _logout(BuildContext context) async {
    BlocProvider.of<AuthBloc>(context).add(
      SignOutRequested(),
    );
  }
}

class _RowWithButton extends StatelessWidget {
  final String rowTitle;
  final Icon icon;
  final String title;

  final Widget widget;

  const _RowWithButton({
    Key? key,
    required this.rowTitle,
    required this.icon,
    required this.title,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rowTitle,
          style:
              AppTextTheme.subtitle1.copyWith(color: ColorTheme.white100Dark),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              icon,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextTheme.subtitle1
                            .copyWith(color: ColorTheme.white000ForDark),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
              widget,
            ],
          ),
        ),
      ],
    );
  }
}

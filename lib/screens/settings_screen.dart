// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty/app_global_widgets/button_widget.dart';
import 'package:rick_and_morty/app_global_widgets/devider_widget.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/parts/auth/bloc/auth_bloc.dart';
import 'package:rick_and_morty/services/snack_bar_service.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    return Scaffold(
      backgroundColor: ColorTheme.voilet,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                              .copyWith(color: ColorTheme.white000),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rick',
                          style: AppTextTheme.subtitle1
                              .copyWith(color: ColorTheme.white100),
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
                  color: ColorTheme.white000,
                  size: 35,
                ),
                title: locale.darkTheme,
                onPressed: () {},
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: DividerWidget(),
              ),
              _RowWithButton(
                rowTitle: locale.language,
                icon: const Icon(
                  Icons.language,
                  color: ColorTheme.white000,
                  size: 35,
                ),
                title: 'Español',
                onPressed: () {},
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: DividerWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ButtonWidget(
                  onPressed: () => _logout(context),
                  text: 'logout',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logout(BuildContext context) async {
    final isValid = _formKey.currentState?.validate();
    if (isValid == null) {
      SnackBarService.showDialogMessage(
        context,
        'locale.unknownError',
      );
    } else if (!isValid) {
      return;
    } else if (isValid) {
      BlocProvider.of<AuthBloc>(context).add(
        SignOutRequested(),
      );
    }
  }
}

class _RowWithButton extends StatelessWidget {
  final String rowTitle;
  final Icon icon;
  final String title;

  final void Function()? onPressed;

  const _RowWithButton({
    Key? key,
    required this.rowTitle,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rowTitle,
          style: AppTextTheme.subtitle1.copyWith(color: ColorTheme.white100),
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
                            .copyWith(color: ColorTheme.white000),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.chevron_right,
                  color: ColorTheme.white000,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

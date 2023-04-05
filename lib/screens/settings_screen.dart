// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rick_and_morty/app_global_widgets/button_widget.dart';
import 'package:rick_and_morty/app_global_widgets/devider_widget.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  text: 'Редактировать',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: DividerWidget(),
              ),
              _RowWithButton(
                rowTitle: 'Внешний вид',
                icon: const Icon(
                  Icons.palette_outlined,
                  color: ColorTheme.white000,
                  size: 35,
                ),
                title: 'Темная тема',
                onPressed: () {},
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: DividerWidget(),
              ),
              _RowWithButton(
                rowTitle: 'Язык',
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
            ],
          ),
        ),
      ),
    );
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

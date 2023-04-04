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
          child: Column(children: [
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
          ]),
        ),
      ),
    );
  }
}

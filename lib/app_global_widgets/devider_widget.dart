import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1.5,
      color: ColorTheme.greyDark,
    );
  }
}

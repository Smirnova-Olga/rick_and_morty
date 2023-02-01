part of '../ui_kit/ui_kit.dart';

class AppLoadingScreen extends StatelessWidget {
  const AppLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorTheme.voilet,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

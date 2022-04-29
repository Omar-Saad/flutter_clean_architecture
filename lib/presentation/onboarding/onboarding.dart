import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorManager.white,
      body: Center(child: Text("on boarding")),
    );
  }
}

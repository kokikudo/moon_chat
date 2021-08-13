import 'package:flutter/material.dart';
import 'package:test_chat_app/constraints.dart';
import 'package:test_chat_app/screen/login_screen.dart';
import 'package:test_chat_app/screen/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:test_chat_app/widgets/my_elevated_button.dart';

///TODO

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static String id = '/welcome';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // _animation =
    //     CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);

    _animation = ColorTween(begin: Colors.indigo, end: kBackgroundColor)
        .animate(_animationController);

    _animationController.forward();

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                    tag: 'logo',
                    child: Container(
                        height: 60, child: Image.asset('images/moon.png'))),
                SizedBox(
                  width: 10.0,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Moon Chat',
                        textStyle: kLogo,
                        speed: const Duration(milliseconds: 300)),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            MyElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              buttonName: 'ログイン',
              buttonColor: Colors.lightBlue,
            ),
            SizedBox(
              height: 15.0,
            ),
            MyElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RegistrationScreen.id),
              buttonName: '新規登録',
              buttonColor: Colors.blue,
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

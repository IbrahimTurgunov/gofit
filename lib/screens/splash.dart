import 'package:flutter/material.dart';
// import 'package:gofit/screens/auth/signup.dart';
import 'package:gofit/screens/main/bottombar.dart';
import 'package:gofit/screens/main/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      // ignore: use_build_context_synchronously
        singUp();
    });
  }
  void singUp(){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const Bottombar()));
  }
  // void mainScreen(){
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (_) => const Bottombar()));
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 280,
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'Go',
                        style: TextStyle(
                            color: white,
                            fontSize: 50,
                            fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: 'Fit',
                        style: TextStyle(
                            color: red,
                            fontSize: 50,
                            fontWeight: FontWeight.w400))
                  ])),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Let's start train!",
                style: TextStyle(
                    color: white, fontWeight: FontWeight.w400, fontSize: 35),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Your personal trainer for achieving your \n physical goals ",
                style: TextStyle(color: white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

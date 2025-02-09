// ignore_for_file: unused_import, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:gofit/screens/main/listdata.dart';
import 'package:gofit/screens/main/styles.dart';
import 'package:gofit/screens/quotes/quotes.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}
class _MainscreenState extends State<Mainscreen> {
  int currentSlide = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: UpgradeAlert(
          showLater: true,
          upgrader: Upgrader(
            debugLogging: true,
            languageCode: "eng",
            minAppVersion: "1.0.0+1"
          ),
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(35, 20, 35, 21),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Quotes(
                                    currentSlide: currentSlide,
                                    onChange: (value) {
                                      setState(() {
                                        currentSlide = value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  const Text("Exercises",
                                      style: TextStyle(
                                          color: blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24)),
                                          const SizedBox(height: 10),
                                  const ListData(),
                                ],
                              ),
                            ),
                          ),
          ),
        ));
  }
}

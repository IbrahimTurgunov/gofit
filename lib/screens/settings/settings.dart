import 'package:flutter/material.dart';
import 'package:gofit/screens/main/styles.dart';
import 'package:gofit/screens/providers/themeprovider.dart';
import 'package:gofit/screens/settings/aboutapp.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: blue, fontSize: 22)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Material(
              color: grey,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lightbulb,
                      color: blue,
                      size: 30,
                    ),
                    const SizedBox(width: 40),
                    Text(
                      themeProvider.isDarkModeChecked
                          ? "Dark Mode"
                          : "Light Mode",
                      style: const TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(width: 105),
                    Switch(
                        inactiveTrackColor: grey,
                        inactiveThumbColor: white,
                        activeColor: white,
                        activeTrackColor: red,
                        value: themeProvider.isDarkModeChecked,
                        onChanged: (value) {
                          themeProvider.updateMode(darkMode: value);
                        }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            /////
            Material(
              color: grey,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: InkWell(
                enableFeedback: false,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                onTap: () {
                  launchUrl(Uri.parse("mailto:our.gofit588@gmail.com"));
                },
                splashColor: blue,
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.help,
                        color: blue,
                        size: 30,
                      ),
                      SizedBox(width: 38),
                      Text("Help",
                          style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            //////
            Material(
              color: grey,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: InkWell(
                enableFeedback: false,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                splashColor: blue,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Aboutapp()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: blue,
                        size: 30,
                      ),
                      SizedBox(width: 38),
                      /////
                      Text("About App",
                          style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            //////
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: grey,
              child: InkWell(
                enableFeedback: false,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                splashColor: blue,
                onTap: () async {
                  try {
                    await Share.share(
                        "https://play.google.com/store/apps/com.gofit.app");
                  } catch (e) {
                    // ignore: avoid_print
                    print("Error sharing: $e");
                    // You can show a message or handle the error
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.share_rounded,
                        color: blue,
                        size: 30,
                      ),
                      SizedBox(width: 38),
                      Text("Share",
                          style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ///////
            Material(
              color: grey,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: InkWell(
                enableFeedback: false,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                splashColor: blue,
                onTap: () {
                  launchUrl(Uri.parse("https://sujanpokhrelstc.netlify.app"));
                },
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: blue,
                        size: 30,
                      ),
                      SizedBox(width: 38),
                      Text("Rate the app",
                          style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

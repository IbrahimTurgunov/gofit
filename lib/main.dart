import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gofit/firebase_options.dart';
import 'package:gofit/screens/providers/allgifprovider.dart';
import 'package:gofit/screens/providers/favoriteprovider.dart';
import 'package:gofit/screens/providers/searchprovider.dart';
import 'package:gofit/screens/providers/themeprovider.dart';
import 'package:gofit/screens/splash.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => AllProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavoriteProvider>(context, listen: false).loadFavorites();
    Provider.of<ThemeProvider>(context, listen: false).loadMode();
    Provider.of<AllProvider>(context, listen: false).fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: themeProvider.isDarkModeChecked
      ? ThemeData.dark(useMaterial3: true).copyWith(
          textTheme: ThemeData.dark(useMaterial3: true).textTheme.apply(
            fontFamily: 'Lato',
          ),
        )
      : ThemeData.light(useMaterial3: true).copyWith(
          textTheme: ThemeData.light(useMaterial3: true).textTheme.apply(
            fontFamily: 'Lato',
          ),
        ),
  themeMode: themeProvider.isDarkModeChecked ? ThemeMode.dark : ThemeMode.light,
      // color: Colors.white,
      home: const SplashScreen(),
    );
  }
}

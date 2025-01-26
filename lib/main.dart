import 'package:flutter/material.dart';
import 'package:flutter_application_1/Localization/app_localizations.dart';
import 'package:flutter_application_1/providers/themes.dart';
import 'package:flutter_application_1/providers/localization.dart';
import 'package:flutter_application_1/screens/guest/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/guest/SplashScreen.dart';

// import 'firebase_options.dart';
//here we import the

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  //   print("=======================Firebase Connected Successfully!");
  // } catch (e) {
  //   print("=======================Firebase Connection Failed: $e");
  // }
  // // WidgetsFlutterBinding.ensureInitialized();
  // // await Firebase.initializeApp(
  // //   options: DefaultFirebaseOptions.currentPlatform,
  // // );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<LanguageProvider>(
            create: (_) => LanguageProvider()),
        ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LanguageProvider>(
      builder: (context, themeProvider, languageProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.theme,
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // Arabic
            Locale('fa'), // Kurdish (Central)
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Provider.of<LocaleProvider>(context).locale,
          home: const SplashScreen(),
        );
      },
    );
  }
}

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
          PopupMenuButton<Locale>(
            onSelected: (Locale locale) {
              Provider.of<LocaleProvider>(context, listen: false)
                  .setLocale(locale);
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: Locale('en'),
                child: Text('English'),
              ),
              const PopupMenuItem(
                value: Locale('fa'),
                child: Text('کوردی'),
              ),
              const PopupMenuItem(
                value: Locale('ar'),
                child: Text('العربية'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text(
            AppLocalizations.of(context)?.translate('welcome') ?? 'Welcome11'),
      ),
    );
  }
}

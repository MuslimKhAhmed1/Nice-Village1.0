import 'package:flutter/material.dart';
import 'package:flutter_application_1/Localization/app_localizations.dart';
import 'package:flutter_application_1/screens/guest/HomeGuest_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Theme.of(context).secondaryHeaderColor.withOpacity(0.8),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    AppLocalizations.of(context)
                            ?.translate('welcome_message') ??
                        'Welcome to',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Nice ',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Village',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 77, 123, 230),
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement login navigation
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).secondaryHeaderColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)?.translate('login') ??
                          'login',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      // TODO: Implement guest navigation
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeGuestScreen(),
                          ));
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white, width: 2),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)?.translate('guest') ??
                          'guest',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

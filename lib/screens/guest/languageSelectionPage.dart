import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/localization.dart';
import 'package:flutter_application_1/screens/guest/welcome_screen.dart';
import 'package:provider/provider.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.language,
              size: 150,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Select Your Language',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLanguageButton(
                    context, 'English', 'E', const Locale('en')),
                const SizedBox(width: 20),
                _buildLanguageButton(context, 'کوردی', 'ک', const Locale('ku')),
                const SizedBox(width: 20),
                _buildLanguageButton(
                    context, 'العربية', 'ع', const Locale('ar')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(
      BuildContext context, String language, String flagPath, Locale locale) {
    return GestureDetector(
      onTap: () {
        Provider.of<LocaleProvider>(context, listen: false).setLocale(locale);
        Provider.of<LanguageProvider>(context, listen: false).setLocale(locale);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const WelcomeScreen()),
        );
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: Center(
              child: Text(flagPath,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            language,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

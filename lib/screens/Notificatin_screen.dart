// notifications_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/showDialog.dart';

import '../Localization/app_localizations.dart';

class Notification {
  final String message;
  final IconData icon;

  Notification({
    required this.message,
    this.icon = Icons.notification_important,
  });
}

class NotificationsPage extends StatelessWidget {
  final List<Notification> notifications = [
    Notification(message: 'You have only two days to pay this Mount\'s rent'),
    Notification(message: 'You have to pay for the service in two days'),
    Notification(message: 'You have only two days to pay'),
  ];

  NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)?.translate('notifications') ??
              "notifications",
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return InkWell(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) => DeleteDialog(),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: Icon(
                  notifications[index].icon,
                  color: Colors.red,
                  size: 30,
                ),
                title: Text(
                  notifications[index].message,
                  style: TextStyle(color: Colors.black),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          );
        },
      ),
    );
  }
}
